Extension { #name : #FASTFortranRealType }

{ #category : #'*FAST-Fortran' }
FASTFortranRealType >> accept: aVisitor [
	^aVisitor visitFASTFortranRealType: self
]
