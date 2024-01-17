Class {
	#name : #FASTFortranCFGVisitorTest,
	#superclass : #FASTFortranAbstractVisitorTest,
	#category : #'FAST-Fortran-Visitors-Tests-Visitor'
}

{ #category : #running }
FASTFortranCFGVisitorTest >> findBasicBlocks: aClass with: aPharoBooleanBlock [

	^visitor basicBlocks
		select: [ :aBasicBlock |
			(aBasicBlock class = aClass) and:
			[ aPharoBooleanBlock value: aBasicBlock ]
		]
]

{ #category : #'entity creation' }
FASTFortranCFGVisitorTest >> functionBigSmall [
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
	block addStatement: (self declarationStatement: (self integerType: nil) variables: #(x y)).
	block addStatement: (self declarationStatement: (self characterType: 20) variables: #(str)).
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
	self functionBigSmall accept: visitor.

	conditional := (self findBasicBlocks: FASTFortranConditionalBasicBlock with: [ :basicBloc | true ])
		anyOne.

	self assert: conditional nextBlocks size equals: 2.
	self
		assert: conditional nextBlocks first nextBlock
		equals: conditional nextBlocks second nextBlock
	
]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testBlockChainingBeforeConditionalBlock [

	| blocks |
	self functionBigSmall accept: visitor.

	blocks := self findBasicBlocks: FASTFortranBasicBlock with: [ :basicBloc |
		(basicBloc firstStatement class = FASTFortranVariableDeclarationStatement) and:
		[basicBloc lastStatement class = FASTFortranAssignmentStatement ]
	].

	self assert: blocks size equals: 1.
	self assert: blocks anyOne nextBlock class equals: FASTFortranConditionalBasicBlock
]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testIfStatementCreatesConditionalBlock [

	| blocks  conditional |
	self functionBigSmall accept: visitor.

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
	self functionBigSmall accept: visitor.

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
	self functionBigSmall accept: visitor.

	blocks := self findBasicBlocks: FASTFortranBasicBlock with: [ :basicBloc |
		basicBloc lastStatement class = FASTFortranReturnStatement
	].

	self assert: blocks size equals: 1.
	self assert: blocks anyOne firstStatement equals: blocks anyOne lastStatement.
]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testIfStatementThenPartIsABasicBlock [

	| aBlock |
	self functionBigSmall accept: visitor.

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
	self functionBigSmall accept: visitor.

	blocks := self findBasicBlocks: FASTFortranBasicBlock with: [ :basicBloc |
		(basicBloc firstStatement class = FASTFortranVariableDeclarationStatement) and:
		[basicBloc lastStatement class = FASTFortranAssignmentStatement ]
	].

	self assert: blocks size equals: 1.
	self assert: blocks anyOne firstStatement declarators size equals: 2.
	self assert: blocks anyOne lastStatement variable name equals: 'x'.
]
