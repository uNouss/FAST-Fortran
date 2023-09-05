Extension { #name : #FASTFortranDoubleComplexType }

{ #category : #'*FAST-Fortran' }
FASTFortranDoubleComplexType >> accept: aVisitor [
	^aVisitor visitFASTFortranDoubleComplexType: self
]
