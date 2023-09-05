Extension { #name : #FASTFortranLogicalType }

{ #category : #'*FAST-Fortran' }
FASTFortranLogicalType >> accept: aVisitor [
	^aVisitor visitFASTFortranLogicalType: self
]
