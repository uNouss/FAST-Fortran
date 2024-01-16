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

{ #category : #'visiting - programUnits' }
FASTFortranBasicBlockVisitor >> visitFASTFortranProgramUnit: aFASTFortranProgramUnit [
	
	self nextStatementIsLeader.
	super visitFASTFortranProgramUnit: aFASTFortranProgramUnit
]

{ #category : #'visiting - traits' }
FASTFortranBasicBlockVisitor >> visitFASTFortranTStatement: aFASTFortranTStatement [

	self checkIsLeaderStatement: aFASTFortranTStatement

]

{ #category : #'visiting - traits' }
FASTFortranBasicBlockVisitor >> visitFASTFortranTStatementBlock: aFASTFortranTStatementBlock [
	"first statement in a statement block is a leader"

	self nextStatementIsLeader.
	^super visitFASTFortranTStatementBlock: aFASTFortranTStatementBlock
]
