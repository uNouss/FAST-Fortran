Class {
	#name : #FASTFortranBasicBlockVisitor,
	#superclass : #FASTFortranVisitor,
	#instVars : [
		'leaderStatements',
		'isLeader'
	],
	#category : #'FAST-Fortran-Visitors-Visitor'
}

{ #category : #initialization }
FASTFortranBasicBlockVisitor >> initialize [

	super initialize.

	leaderStatements := Set new.
	isLeader := false
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
