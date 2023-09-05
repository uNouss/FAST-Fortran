Extension { #name : #FASTFortranDimensionStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranDimensionStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranDimensionStatement: self
]
