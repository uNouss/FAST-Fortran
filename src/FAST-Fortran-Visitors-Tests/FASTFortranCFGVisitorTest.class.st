Class {
	#name : #FASTFortranCFGVisitorTest,
	#superclass : #FASTFortranAbstractVisitorTest,
	#instVars : [
		'ast'
	],
	#category : #'FAST-Fortran-Visitors-Tests-Visitor'
}

{ #category : #'entity creation' }
FASTFortranCFGVisitorTest >> add: statementBlock statement: aStatement [

	aStatement startPos: (statementBlock statements size + 1).
	statementBlock addStatement: aStatement.

	^aStatement

]

{ #category : #'entity creation' }
FASTFortranCFGVisitorTest >> addParameter: name type: typeDescription [
	"assume #ast contains a function definition"

	self entity: ast parameters: ((ast parameters collect: #name)
			 add: name asString;
			 yourself).

	^ self addStatement: (self declarationStatement: name type: typeDescription)
]

{ #category : #'entity creation' }
FASTFortranCFGVisitorTest >> addStatement: aStatement [

	^self add: ast statementBlock statement: aStatement

]

{ #category : #accessing }
FASTFortranCFGVisitorTest >> ast [

	^ast
]

{ #category : #running }
FASTFortranCFGVisitorTest >> findBasicBlocks: aClass with: aPharoBooleanBlock [

	^visitor basicBlocks
		select: [ :aBasicBlock |
			(aBasicBlock class = aClass) and:
			[ aPharoBooleanBlock value: aBasicBlock ]
		]
]

{ #category : #'entity creation' }
FASTFortranCFGVisitorTest >> function: name type: typeDescription [

	ast := self functionDeclaration: name.
	ast returnType: (self makeType: typeDescription).

	^ast

]

{ #category : #'entity creation' }
FASTFortranCFGVisitorTest >> functionWithConditional [
	"
	CHARACTER*20 FUNCTION fctBigSmall( x, y)
	INTEGER x, y
	CHARACTER*20 str

	x = 1

	IF y .gt. 5 THEN
	str = ""small""
	y = fctSmall(x)

	ELSE
	str = ""big""
	y = y - x
	END IF

	RETURN str
	END
	"

	| ifStatement |
	self function: #fctBigSmall type: #(character 20).
	self addParameter: #x type: #integer.
	self addParameter: #y type: #integer.
	self addStatement: (self declarationStatement: #str type: #(character 20) ).
	self addStatement: (self assignementStatement: #x value: 1).
	ifStatement := self addStatement: (self ifBlock: (self binary: '.gt.' left: #y right: 5) then: #() else:  #()).
	self addStatement: (self returnStatement: #str).

	self
		add: ifStatement thenStatementBlock
		statement: (self assignementStatement: #str value: '"small"').
	self
		add: ifStatement thenStatementBlock
		statement: (self
			assignementStatement: #y
			value: (self functionCall: #fctSmall arguments: { self scalarVariable: 'x' })).

	self
		add: ifStatement elseStatementBlock
		statement: (self assignementStatement: #str value: '"big"').
	self
		add: ifStatement elseStatementBlock
		statement: (self
			assignementStatement: #y
			value: (self binary: '-' left: #y right: #x)).

	^ast

]

{ #category : #running }
FASTFortranCFGVisitorTest >> newVisitor [

	^FASTFortranCFGVisitor new
]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testBlockChainingAfterConditionalBlock [

	| conditional |
	self functionWithConditional accept: visitor.

	conditional := (self findBasicBlocks: FASTFortranConditionalBasicBlock with: [ :basicBloc | true ])
		anyOne.

	self assert: conditional nextBlocks size equals: 2.
	self
		assert: conditional nextBlocks first nextBlock
		equals: conditional nextBlocks second nextBlock
	
]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testBlockChainingAfterIfLogical [

	| conditional blocks |
	"
	INTEGER FUNCTION something( x)
	INTEGER x
	IF (x .lt. 5) return x
	RETURN x - 5
	END
	"
	self function: 'something' type: #integer.
	self addParameter: #x type: #integer.
	self addStatement: (self
		logicalIf: (self binary: '.lt.' left: #x right: 5)
		statement: (self returnStatement: #x)).
	self addStatement: (self returnStatement: (self binary: '-' left: #x right: 5)).
	
	ast accept: visitor.

	blocks := self findBasicBlocks: FASTFortranConditionalBasicBlock with: [ :basicBloc | true ].

	self assert: blocks size equals: 1.
	conditional := blocks anyOne.

	self assert: conditional nextBlocks size equals: 2.
	self
		assert: conditional nextBlocks first nextBlock
		equals: conditional nextBlocks second
	
]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testBlockChainingBeforeConditionalBlock [

	| blocks |
	self functionWithConditional accept: visitor.

	blocks := self findBasicBlocks: FASTFortranBasicBlock with: [ :basicBloc |
		(basicBloc firstStatement class = FASTFortranVariableDeclarationStatement) and:
		[basicBloc lastStatement class = FASTFortranAssignmentStatement ]
	].

	self assert: blocks size equals: 1.
	self assert: blocks anyOne nextBlock class equals: FASTFortranConditionalBasicBlock
]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testBlockChainingForDoLoopConditional [

	| conditional basicBlock loop |
	"
	INTEGER FUNCTION factorial( x)
	INTEGER x
	INTEGER fact=1
 
	DO i=1, x, 1
	fact = fact*i
	END DO	
	RETURN fact
	END
	"
	self function: #factorial type: #integer.
	self addParameter: #x type: #integer.
	self addStatement: (self declarationStatement: #fact type: #integer init: 1).
	loop := self addStatement: (self doStatement: #(i 1 x 1)  statements: #()).
	self
		add: loop statementBlock
		statement: (self assignementStatement: #fact value: (self binary: '*' left: #fact right: #i)).
	self addStatement: (self returnStatement: #fact).
	
	ast accept: visitor.	

	conditional := (self findBasicBlocks: FASTFortranConditionalBasicBlock with: [ :basicBloc | true ])
		anyOne.

	self assert: conditional nextBlocks size equals: 2.

	basicBlock := conditional nextBlockForValue: true.
	self assert: basicBlock firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: basicBlock firstStatement equals: basicBlock lastStatement.
	self assert: basicBlock nextBlock equals: conditional.

	basicBlock := conditional nextBlockForValue: false.
	self assert: basicBlock firstStatement class equals: FASTFortranReturnStatement.
	self assert: basicBlock firstStatement expression class equals: FASTFortranScalarVariable.
	self assert: basicBlock firstStatement equals: basicBlock lastStatement.

]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testDoLoopCreatesConditionalBlock [

	| conditional blocks loop |
	"
	INTEGER FUNCTION factorial( x)
	INTEGER x
	INTEGER fact=1
 
	DO i=1, x, 1
	fact = fact*i
	END DO	
	RETURN fact
	END
	"
	self function: #factorial type: #integer.
	self addParameter: #x type: #integer.
	self addStatement: (self declarationStatement: #fact type: #integer init: 1).
	loop := self addStatement: (self doStatement: #(i 1 x 1)  statements: #()).
	self
		add: loop statementBlock
		statement: (self assignementStatement: #fact value: (self binary: '*' left: #fact right: #i)).
	self addStatement: (self returnStatement: #fact).
	
	ast accept: visitor.	

	blocks := self findBasicBlocks: FASTFortranConditionalBasicBlock with: [ :basicBloc | true ].

	self assert: blocks size equals: 1.
	conditional := blocks anyOne.

	self assert: conditional condition class equals: FASTFortranLoopControlExpression.

	self assert: conditional nextBlocks size equals: 2
]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testFirstStatementOfBlockIsLabelled [

	| blocks |
	"
	INTEGER FUNCTION something()
10	x = 1
	END
	"
	self function: #something type: #integer.
	self addStatement: (self
		labelled: 10
		statement: (self assignementStatement: #x value: 1)).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 1.

	self assert: blocks anyOne firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: blocks anyOne lastStatement equals: blocks anyOne firstStatement

]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testIfStatementCreatesConditionalBlock [

	| blocks  conditional |
	self functionWithConditional accept: visitor.

	blocks := self findBasicBlocks: FASTFortranConditionalBasicBlock with: [ :basicBloc | true ].

	self assert: blocks size equals: 1.
	conditional := blocks anyOne.

	self assert: conditional condition class equals: FASTFortranBinaryExpression.
	self assert: conditional condition operator equals: '.gt.'.

	self assert: conditional nextBlocks size equals: 2
]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testIfStatementElsePartIsABasicBlock [

	| aBlock |
	self functionWithConditional accept: visitor.

	aBlock := (self findBasicBlocks: FASTFortranConditionalBasicBlock with: [:e | true])
		anyOne nextBlockForValue: false.

	self assert: aBlock class equals: FASTFortranBasicBlock.

	self assert: aBlock firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: aBlock firstStatement expression class equals: FASTFortranCharacterLiteral.
	self assert: aBlock firstStatement expression primitiveValue equals: '"big"'.

	self assert: aBlock lastStatement class equals: FASTFortranAssignmentStatement.
	self assert: aBlock lastStatement expression class equals: FASTFortranBinaryExpression.
	self assert: aBlock lastStatement expression operator equals: '-'.

]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testIfStatementFollowedByABasicBlock [

	| blocks |
	self functionWithConditional accept: visitor.

	blocks := self findBasicBlocks: FASTFortranBasicBlock with: [ :basicBloc |
		basicBloc lastStatement class = FASTFortranReturnStatement
	].

	self assert: blocks size equals: 1.
	self assert: blocks anyOne firstStatement equals: blocks anyOne lastStatement.
]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testIfStatementThenPartIsABasicBlock [

	| aBlock |
	self functionWithConditional accept: visitor.

	aBlock := (self findBasicBlocks: FASTFortranConditionalBasicBlock with: [:e | true])
		anyOne nextBlockForValue: true.

	self assert: aBlock class equals: FASTFortranBasicBlock.

	self assert: aBlock firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: aBlock firstStatement expression class equals: FASTFortranCharacterLiteral.
	self assert: aBlock firstStatement expression primitiveValue equals: '"small"'.

	self assert: aBlock lastStatement class equals: FASTFortranAssignmentStatement.
	self assert: aBlock lastStatement expression class equals: FASTFortranFunctionCall.
	self assert: aBlock lastStatement expression name equals: 'fctSmall'.

]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testLabelledIfStatementStartsNewBlock [

	| blocks |
	"
	INTEGER FUNCTION something(bool)
	LOGICAL bool
10	IF bool RETURN 0
   RETURN 1
	END
	"
	self function: #something type: #integer.
	self addParameter: #bool type: #logical.
	self addStatement: (self
		labelled: 10
		statement: (self logicalIf: #bool statement: (self returnStatement: 0))).
	self addStatement: (self returnStatement: 1).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 4.

	self assert: blocks first class equals: FASTFortranBasicBlock.
	self assert: blocks first  firstStatement class equals: FASTFortranVariableDeclarationStatement.

	self assert: blocks second class equals: FASTFortranConditionalBasicBlock.

	self assert: blocks third class equals: FASTFortranBasicBlock.
	self assert: blocks third  firstStatement class equals: FASTFortranReturnStatement.

	self assert: blocks fourth class equals: FASTFortranBasicBlock.
	self assert: blocks fourth firstStatement class equals: FASTFortranReturnStatement.
]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testLabelledStatementStartsNewBlock [

	| blocks |
	"
	INTEGER FUNCTION something()
	INTEGER x = 5
10 RETURN x
	END
	"
	self function: #something type: #integer.
	self addStatement: (self declarationStatement: #x type: #integer init: 5).
	self addStatement: (self labelled: 10 statement: (self returnStatement: #x)).
	
	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 2.
	self assert: blocks first firstStatement class equals: FASTFortranVariableDeclarationStatement.
	self assert: blocks second firstStatement class equals: FASTFortranReturnStatement.
]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testProgramUnitBodyStartsABasicBlock [

	| blocks |
	self functionWithConditional accept: visitor.

	blocks := self findBasicBlocks: FASTFortranBasicBlock with: [ :basicBloc |
		basicBloc firstStatement class = FASTFortranVariableDeclarationStatement
	].

	self assert: blocks size equals: 1.
	self assert: blocks anyOne firstStatement declarators size equals: 1.
	self assert: blocks anyOne lastStatement class equals: FASTFortranAssignmentStatement.
	self assert: blocks anyOne lastStatement variable name equals: 'x'.
]
