Class {
	#name : #FASTFortranCFGVisitorTest,
	#superclass : #FASTFortranAbstractVisitorTest,
	#instVars : [
		'ast'
	],
	#category : #'FAST-Fortran-Visitors-Tests-Visitor'
}

{ #category : #'entity creation' }
FASTFortranCFGVisitorTest >> add: aNode statement: aStatement [

	aStatement startPos: (aNode statementBlock statements size + 1).
	aNode statementBlock addStatement: aStatement.

	^aStatement

]

{ #category : #'entity creation' }
FASTFortranCFGVisitorTest >> addDeclarationStatement: name type: typeDescription [

	| statement |
	statement := (self declarationStatement: (self makeType: typeDescription) variables: { name }).
	self add: ast statement: statement.
	^statement
]

{ #category : #'entity creation' }
FASTFortranCFGVisitorTest >> addLogicalIf: condition statement: statement [

	| logicalIf |
	logicalIf := self logicalIf: statement statement: condition.

	self add: ast statement: logicalIf.

	^ logicalIf
]

{ #category : #'entity creation' }
FASTFortranCFGVisitorTest >> addParameter: name type: typeDescription [
	"assume #ast contains a function definition"

	self entity: ast parameters: (ast parameters asOrderedCollection
			 add: name;
			 yourself).

	^ self addDeclarationStatement: name type: typeDescription
]

{ #category : #'entity creation' }
FASTFortranCFGVisitorTest >> addReturnStatement: expressionDescription [

	self add: ast statement: (self returnStatement: expressionDescription).

]

{ #category : #'entity creation' }
FASTFortranCFGVisitorTest >> addStatement: aStatement [

	aStatement startPos: (ast statementBlock statements size + 1).
	ast statementBlock addStatement: aStatement.

	^aStatement

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
	"FAST for:

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

	| function block ifStatement |
	function := self functionDeclaration: 'fctBigSmall'.
	self entity: function parameters: #(x y).
	function returnType: (self characterType: 20).

	block := function statementBlock.
	block addStatement: (self declarationStatement: #integer variables: #(x y)).
	block addStatement: (self declarationStatement: #(character 20) variables: #(str)).
	block addStatement: (self assignementStatement: 'x' value: (self integerLiteral: '1')).

	ifStatement := self ifBlock: (self binary: '.gt.' left: 'y' right: '5') then: #() else:  #().
	block addStatement: ifStatement.

	block addStatement: (self returnStatement: (self scalarVariable: 'str')).
	
	block statements doWithIndex: [ :statement :i | statement startPos: i ].

	block := ifStatement thenStatementBlock.
	block addStatement: (self assignementStatement: 'str' value: (self characterLiteral: '"small"')).
	block addStatement: (self
		assignementStatement: 'y'
		value: (self functionCall: 'fctSmall' arguments: { self scalarVariable: 'x' })).

	block statements doWithIndex: [ :statement :i | statement startPos: i ].

	block := ifStatement elseStatementBlock.
	block addStatement: (self assignementStatement: 'str' value: (self characterLiteral: '"big"')).
	block addStatement: (self
		assignementStatement: 'y'
		value: ((self binary: '-' left: 'y' right: '5')
			right: (self scalarVariable: 'x') ;
			yourself)).

	block statements doWithIndex: [ :statement :i | statement startPos: i ].

	^function

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
	self addLogicalIf: (self binary: '.lt.' left: #x right: 5) statement: (self returnStatement: #x).
	self addReturnStatement: (self binary: '-' left: #x right: 5).
	
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
	self function: 'factorial' type: #integer.
	self addParameter: #x type: #integer.
	self add: ast statement: (self declarationStatement: 'fact' type: #integer init: 1).
	loop := self add: ast statement: (self doStatement: #(i 1 x 1)  statements: #()).
	self add: loop statement: (self assignementStatement: 'fact' value: (self binary: '*' left: #fact right: #i)).
	self add: ast statement: (self returnStatement: #fact).
	
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
	self function: 'factorial' type: #integer.
	self addParameter: #x type: #integer.
	self add: ast statement: (self declarationStatement: 'fact' type: #integer init: 1).
	loop := self add: ast statement: (self doStatement: #(i 1 x 1)  statements: #()).
	self add: loop statement: (self assignementStatement: 'fact' value: (self binary: '*' left: #fact right: #i)).
	self add: ast statement: (self returnStatement: #fact).
	
	ast accept: visitor.	

	blocks := self findBasicBlocks: FASTFortranConditionalBasicBlock with: [ :basicBloc | true ].

	self assert: blocks size equals: 1.
	conditional := blocks anyOne.

	self assert: conditional condition class equals: FASTFortranLoopControlExpression.

	self assert: conditional nextBlocks size equals: 2
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
FASTFortranCFGVisitorTest >> testProgramUnitBodyStartsABasicBlock [

	| blocks |
	self functionWithConditional accept: visitor.

	blocks := self findBasicBlocks: FASTFortranBasicBlock with: [ :basicBloc |
		(basicBloc firstStatement class = FASTFortranVariableDeclarationStatement) and:
		[basicBloc lastStatement class = FASTFortranAssignmentStatement ]
	].

	self assert: blocks size equals: 1.
	self assert: blocks anyOne firstStatement declarators size equals: 2.
	self assert: blocks anyOne lastStatement variable name equals: 'x'.
]
