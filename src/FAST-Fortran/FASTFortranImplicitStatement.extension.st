Extension { #name : #FASTFortranImplicitStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranImplicitStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranImplicitStatement: self
]
