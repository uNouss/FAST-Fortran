Extension { #name : #FASTFortranArrayDimensionDeclarator }

{ #category : #'*FAST-Fortran' }
FASTFortranArrayDimensionDeclarator >> accept: aVisitor [
	^aVisitor visitFASTFortranArrayDimensionDeclarator: self
]
