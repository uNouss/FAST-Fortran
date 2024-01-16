"
A FASTFortranVisitor that computes BasicBlocks on the statements
"
Class {
	#name : #FASTFortranBasicBlockVisitor,
	#superclass : #FASTFortranVisitor,
	#instVars : [
		'leaderStatements',
		'isLeader'
	],
	#category : #'FAST-Fortran-Visitors-Visitor'
}

{ #category : #'private state' }
FASTFortranBasicBlockVisitor >> checkIsLeaderStatement: aFASTFortranStatement [

	isLeader ifFalse: [ ^ self ].

	leaderStatements add: aFASTFortranStatement.
	isLeader := false
]

{ #category : #initialization }
FASTFortranBasicBlockVisitor >> initialize [

	super initialize.

	leaderStatements := OrderedCollection new.
	isLeader := false
]

{ #category : #'accessing - private tests' }
FASTFortranBasicBlockVisitor >> leaderStatements [

	^leaderStatements
]

{ #category : #'private state' }
FASTFortranBasicBlockVisitor >> nextStatementIsLeader [
	"sets instance variable #isLeader that must be tested in all statements"

	isLeader := true
]

{ #category : #'visiting - statements' }
FASTFortranBasicBlockVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [

	| visit |
	visit := super visitFASTFortranDoStatement: aFASTFortranDoStatement.
	self nextStatementIsLeader.

	^visit
]

{ #category : #'visiting - statements' }
FASTFortranBasicBlockVisitor >> visitFASTFortranDoWhileStatement: aFASTFortranDoWhileStatement [

	| visit |
	visit := super visitFASTFortranDoWhileStatement: aFASTFortranDoWhileStatement.
	self nextStatementIsLeader.

	^visit
]

{ #category : #'visiting - statements' }
FASTFortranBasicBlockVisitor >> visitFASTFortranExitStatement: aFASTFortranExitStatement [

	| visit |
	visit := super visitFASTFortranExitStatement: aFASTFortranExitStatement.
	self nextStatementIsLeader.

	^visit
]

{ #category : #'visiting - statements' }
FASTFortranBasicBlockVisitor >> visitFASTFortranGoToAssignedStatement: aFASTFortranGoToAssignedStatement [

	| visit |
	visit := super visitFASTFortranGoToAssignedStatement: aFASTFortranGoToAssignedStatement.
	self nextStatementIsLeader.

	^visit
]

{ #category : #'visiting - statements' }
FASTFortranBasicBlockVisitor >> visitFASTFortranGoToComputedStatement: aFASTFortranGoToComputedStatement [

	| visit |
	visit := super visitFASTFortranGoToComputedStatement: aFASTFortranGoToComputedStatement.
	self nextStatementIsLeader.

	^visit
]

{ #category : #'visiting - statements' }
FASTFortranBasicBlockVisitor >> visitFASTFortranGoToStatement: aFASTFortranGoToStatement [

	| visit |
	visit := super visitFASTFortranGoToStatement: aFASTFortranGoToStatement.
	self nextStatementIsLeader.

	^visit
]

{ #category : #'visiting - statements' }
FASTFortranBasicBlockVisitor >> visitFASTFortranGoToUnconditionalStatement: aFASTFortranGoToUnconditionalStatement [

	| visit |
	visit := super visitFASTFortranGoToUnconditionalStatement: aFASTFortranGoToUnconditionalStatement.
	self nextStatementIsLeader.

	^visit
]

{ #category : #'visiting - statements' }
FASTFortranBasicBlockVisitor >> visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatement [

	| visit |
	visit := super visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatement.
	self nextStatementIsLeader.

	^visit
]

{ #category : #'visiting - statements' }
FASTFortranBasicBlockVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [

	| visit |
	visit := super visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement.
	self nextStatementIsLeader.

	^visit
]

{ #category : #'visiting - statements' }
FASTFortranBasicBlockVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [

	| visit |
	visit := super visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement.
	self nextStatementIsLeader.

	^visit
]

{ #category : #'visiting - programUnits' }
FASTFortranBasicBlockVisitor >> visitFASTFortranProgramUnit: aFASTFortranProgramUnit [
	
	self nextStatementIsLeader.
	^super visitFASTFortranProgramUnit: aFASTFortranProgramUnit
]

{ #category : #'visiting - traits' }
FASTFortranBasicBlockVisitor >> visitFASTFortranTStatement: aFASTFortranTStatement [

	^self checkIsLeaderStatement: aFASTFortranTStatement

]

{ #category : #'visiting - traits' }
FASTFortranBasicBlockVisitor >> visitFASTFortranTStatementBlock: aFASTFortranTStatementBlock [
	"first statement in a statement block is a leader"

	self nextStatementIsLeader.
	^super visitFASTFortranTStatementBlock: aFASTFortranTStatementBlock
]
