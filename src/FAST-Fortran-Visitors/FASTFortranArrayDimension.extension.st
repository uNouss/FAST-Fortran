Extension { #name : #FASTFortranArrayDimension }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranArrayDimension >> accept: aVisitor [

	^aVisitor visitFASTFortranArrayDimension: self
]
