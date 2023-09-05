Extension { #name : #FASTFortranExitStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranExitStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranExitStatement: self
]
