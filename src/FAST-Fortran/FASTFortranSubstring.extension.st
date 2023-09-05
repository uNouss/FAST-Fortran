Extension { #name : #FASTFortranSubstring }

{ #category : #'*FAST-Fortran' }
FASTFortranSubstring >> accept: aVisitor [
	^aVisitor visitFASTFortranSubstring: self
]
