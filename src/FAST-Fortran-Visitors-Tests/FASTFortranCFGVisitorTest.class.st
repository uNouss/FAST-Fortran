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
FASTFortranCFGVisitorTest >> functionWithLogicalIf [
	"FAST for:

	INTEGER FUNCTION something( x)
	INTEGER x
	IF (x .lt. 5) return x
	RETURN x - 5
	END
	"

	| function block ifStatement |
	function := self functionDeclaration: 'something'.
	self entity: function parameters: #(x).
	function returnType: (self integerType: nil).

	block := function statementBlock.
	block addStatement: (self declarationStatement: (self integerType: nil) variables: #(x)).

	ifStatement := FASTFortranIfLogicalStatement new.
	ifStatement condition: (self binary: '.lt.' left: 'x' right: '5').
	ifStatement statement: (self returnStatement: (self scalarVariable: 'x')).
	block addStatement: ifStatement.

	block addStatement: (self returnStatement: (self binary: '-' left: 'x' right: '5')).
	
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
