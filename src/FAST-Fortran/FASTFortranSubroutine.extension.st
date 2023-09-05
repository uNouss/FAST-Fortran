Extension { #name : #FASTFortranSubroutine }

{ #category : #'*FAST-Fortran' }
FASTFortranSubroutine >> accept: aVisitor [
	^aVisitor visitFASTFortranSubroutine: self
]
