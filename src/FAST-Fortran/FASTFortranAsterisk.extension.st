Extension { #name : #FASTFortranAsterisk }

{ #category : #'*FAST-Fortran' }
FASTFortranAsterisk >> accept: aVisitor [
	^aVisitor visitFASTFortranAsterisk: self
]
