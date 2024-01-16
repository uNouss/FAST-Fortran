Class {
	#name : #FASTFortranBasicBlockVisitorTest,
	#superclass : #FASTFortranAbstractVisitorTest,
	#category : #'FAST-Fortran-Visitors-Tests-Visitor'
}

{ #category : #running }
FASTFortranBasicBlockVisitorTest >> detectLeaderStatement: aBlock [
	"aBlock should have one parameter and tests that a given leaderStatement was found"

	^visitor leaderStatements
		detect: aBlock
		ifNone: [ nil ].

]

{ #category : #'entity creation' }
FASTFortranBasicBlockVisitorTest >> functionBigSmall [
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
FASTFortranBasicBlockVisitorTest >> newVisitor [

	^FASTFortranBasicBlockVisitor new
]

{ #category : #tests }
FASTFortranBasicBlockVisitorTest >> testFirstStatementInBlockIsLeader [

	self functionBigSmall accept: visitor.

	self assert: (self detectLeaderStatement: [ :statement |
		(statement class = FASTFortranVariableDeclarationStatement) and:
		[statement declarators size = 2]
	]) isNotNil.

	self assert: (self detectLeaderStatement: [ :statement |
		(statement class = FASTFortranAssignmentStatement) and:
		[(statement expression class = FASTFortranCharacterLiteral) and:
		[statement expression primitiveValue = '"small"'] ]
	]) isNotNil.

	self assert: (self detectLeaderStatement: [ :statement |
		(statement class = FASTFortranAssignmentStatement) and:
		[(statement expression class = FASTFortranCharacterLiteral) and:
		[statement expression primitiveValue = '"big"'] ]
	]) isNotNil.

]

{ #category : #tests }
FASTFortranBasicBlockVisitorTest >> testStatementAfterBlockIsLeader [

	self functionBigSmall accept: visitor.

	self assert: (self detectLeaderStatement: [ :statement |
		statement class = FASTFortranReturnStatement
	]) isNotNil.

]
