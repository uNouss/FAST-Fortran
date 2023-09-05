Extension { #name : #FASTFortranGoToAssignedStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranGoToAssignedStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranGoToAssignedStatement: self
]
