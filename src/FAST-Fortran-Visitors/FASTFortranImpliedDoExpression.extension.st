Extension { #name : #FASTFortranImpliedDoExpression }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranImpliedDoExpression >> accept: aVisitor [

	^aVisitor visitFASTFortranImpliedDo: self
]
