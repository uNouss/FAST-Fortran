Extension { #name : #FASTFortranIntegerType }

{ #category : #'*FAST-Fortran' }
FASTFortranIntegerType >> accept: aVisitor [
	^aVisitor visitFASTFortranIntegerType: self
]
