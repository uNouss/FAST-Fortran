Extension { #name : #FASTFortranComplexLiteral }

{ #category : #'*FAST-Fortran' }
FASTFortranComplexLiteral >> accept: aVisitor [
	^aVisitor visitFASTFortranComplexLiteral: self
]
