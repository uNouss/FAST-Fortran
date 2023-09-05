Extension { #name : #FASTFortranComplexType }

{ #category : #'*FAST-Fortran' }
FASTFortranComplexType >> accept: aVisitor [
	^aVisitor visitFASTFortranComplexType: self
]
