Extension { #name : #FASTFortranEntity }

{ #category : #'*FAST-Fortran' }
FASTFortranEntity >> accept: aVisitor [
	^aVisitor visitFASTFortranEntity: self
]
