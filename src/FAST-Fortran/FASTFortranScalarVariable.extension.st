Extension { #name : #FASTFortranScalarVariable }

{ #category : #'*FAST-Fortran' }
FASTFortranScalarVariable >> accept: aVisitor [
	^aVisitor visitFASTFortranScalarVariable: self
]
