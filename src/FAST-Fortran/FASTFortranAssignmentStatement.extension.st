Extension { #name : #FASTFortranAssignmentStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranAssignmentStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranAssignmentStatement: self
]
