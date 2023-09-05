Extension { #name : #FASTFortranBlockData }

{ #category : #'*FAST-Fortran' }
FASTFortranBlockData >> accept: aVisitor [
	^aVisitor visitFASTFortranBlockData: self
]
