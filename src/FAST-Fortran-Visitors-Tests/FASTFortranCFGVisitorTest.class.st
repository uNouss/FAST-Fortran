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
	INTEGER x
	INTEGER y
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

{ #category : #'tests - cfg' }
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

{ #category : #'tests - cfg' }
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

{ #category : #'tests - cfg' }
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

{ #category : #'tests - cfg' }
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
	self assert: basicBlock statements size equals: 1.
	self assert: basicBlock nextBlock equals: conditional.

	basicBlock := conditional nextBlockForValue: false.
	self assert: basicBlock firstStatement class equals: FASTFortranReturnStatement.
	self assert: basicBlock firstStatement expression class equals: FASTFortranScalarVariable.
	self assert: basicBlock statements size equals: 1.

]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testChainingGotoWhenAfterLabelledBlock [

	| blocks |
	"
	INTEGER FUNCTION something()
10	x = 1
20	y = 1
	GOTO 10
	END
	"
	self function: #something type: #integer.
	self addStatement: (self
		labelled: 10
		statement: (self assignementStatement: #x value: 1)).
	self addStatement: (self
		labelled: 20
		statement: (self assignementStatement: #y value: 1)).
	self addStatement: (self gotoStatement: 10).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 2.

	self assert: blocks first  firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: blocks first statements size equals: 1.
	self assert: blocks second firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: blocks second lastStatement  class equals: FASTFortranGoToStatement.

	self assert: blocks first nextBlock equals: blocks second.
	self assert: blocks second nextBlock equals: blocks first

]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testChainingGotoWhenBeforeLabelledBlock [

	| blocks |
	"
	INTEGER FUNCTION something()
	GOTO 20
10	x = 1
20	y = 1
	END
	"
	self function: #something type: #integer.
	self addStatement: (self gotoStatement: 20).
	self addStatement: (self
		labelled: 10
		statement: (self assignementStatement: #x value: 1)).
	self addStatement: (self
		labelled: 20
		statement: (self assignementStatement: #y value: 1)).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 3.
	blocks do: [ :block |
		self assert: block statements size equals: 1.
	].
	
	self assert: blocks first firstStatement class equals: FASTFortranGoToStatement.
	self assert: blocks second firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: blocks third firstStatement class equals: FASTFortranAssignmentStatement.

	self assert: blocks first nextBlock equals: blocks third.
	self assert: blocks second nextBlock equals: blocks third.
	self assert: blocks third nextBlock equals: nil

]

{ #category : #'tests - cfg' }
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

	self assert: conditional firstStatement class equals: FASTFortranDoStatement.

	self assert: conditional nextBlocks size equals: 2
]

{ #category : #'tests - cfg' }
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
	self assert: blocks anyOne statements size equals: 1
]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testIfStatementCreatesConditionalBlock [

	| blocks  conditional |
	self functionWithConditional accept: visitor.

	blocks := self findBasicBlocks: FASTFortranConditionalBasicBlock with: [ :basicBloc | true ].

	self assert: blocks size equals: 1.
	conditional := blocks anyOne.

	self assert: conditional firstStatement class equals: FASTFortranIfBlockStatement.

	self assert: conditional nextBlocks size equals: 2
]

{ #category : #'tests - cfg' }
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

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testIfStatementFollowedByABasicBlock [

	| blocks |
	self functionWithConditional accept: visitor.

	blocks := self findBasicBlocks: FASTFortranBasicBlock with: [ :basicBloc |
		basicBloc lastStatement class = FASTFortranReturnStatement
	].

	self assert: blocks size equals: 1.
	self assert: blocks anyOne statements size equals: 1.
]

{ #category : #'tests - cfg' }
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

{ #category : #'tests - cfg' }
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

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testLabelledStatementFollowingLabelledStatement [

	| blocks |
	"
	INTEGER FUNCTION something()
10	INTEGER x = 5
20 RETURN x
	END
	"
	self function: #something type: #integer.
	self addStatement: (self labelled: 10 statement: (self declarationStatement: #x type: #integer init: 5)).
	self addStatement: (self labelled: 20 statement: (self returnStatement: #x)).
	
	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 2.

	self assert: blocks first firstStatement class equals: FASTFortranVariableDeclarationStatement.
	self assert: blocks first statements size equals: 1.
	self assert: blocks second firstStatement class equals: FASTFortranReturnStatement.
	self assert: blocks second statements size equals: 1.

	self assert: blocks first  nextBlock equals: blocks second.
	self assert: blocks second nextBlock equals: nil.


]

{ #category : #'tests - cfg' }
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

{ #category : #'tests - cfg' }
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

{ #category : #tests }
FASTFortranCFGVisitorTest >> testSourceCode [

	| blocks |
	"
	INTEGER FUNCTION something()
	x = 1
	y = 1
	END
	"
	self function: #something type: #integer.
	self addStatement: (self assignementStatement: #x value: 1).
	self addStatement: (self assignementStatement: #y value: 1).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 1.

	self assert: blocks anyOne sourceCode equals: '        x = 1
        y = 1
'
]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testSourceCodeIfBlock [

	| blocks |
	"
	INTEGER FUNCTION something(x)
	INTEGER x
	IF (x .lt. 5) THEN
	return 0
	ELSE
	return x
	END
	"
	self function: #something type: #integer.
	self addParameter: #x type: #integer.
	self addStatement: (self
		ifBlock: (self binary: '.lt.' left: #x right: 5)
		then: { self returnStatement: 0 }
		else:  {self returnStatement: #x}).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 4.


	self assert: blocks second class equals: FASTFortranConditionalBasicBlock.
	self assert: blocks second sourceCode equals: 'if (x .lt. 5)'
]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testSourceCodeIfLogical [

	| blocks |
	"
	INTEGER FUNCTION something(x)
	INTEGER x
	IF (x .lt. 5) return x
	END
	"
	self function: 'something' type: #integer.
	self addParameter: #x type: #integer.
	self addStatement: (self
		logicalIf: (self binary: '.lt.' left: #x right: 5)
		statement: (self returnStatement: #x)).
	
	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 3.


	self assert: blocks second class equals: FASTFortranConditionalBasicBlock.
	self assert: blocks second sourceCode equals: 'if (x .lt. 5)'
]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testStartFinalBlocks [

	| blocks |
	"
	INTEGER FUNCTION something()
	INTEGER x = 5
20 RETURN x
	END
	"
	self function: #something type: #integer.
	self addStatement: (self declarationStatement: #x type: #integer init: 5).
	self addStatement: (self labelled: 20 statement: (self returnStatement: #x)).
	
	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 2.

	self assert: blocks first isStart.
	self deny:   blocks first isFinal.

	self deny:   blocks second isStart.
	self assert: blocks second isFinal.

]
