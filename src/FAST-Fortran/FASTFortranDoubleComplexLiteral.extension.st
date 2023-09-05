Extension { #name : #FASTFortranDoubleComplexLiteral }

{ #category : #'*FAST-Fortran' }
FASTFortranDoubleComplexLiteral >> accept: aVisitor [
	^aVisitor visitFASTFortranDoubleComplexLiteral: self
]
