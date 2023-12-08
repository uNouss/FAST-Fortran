Extension { #name : #FASTFortranImplicitRange }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranImplicitRange >> accept: aVisitor [

	^aVisitor visitFASTFortranImplicitRange: self
]
