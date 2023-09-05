Extension { #name : #FASTFortranDoublePrecisionLiteral }

{ #category : #'*FAST-Fortran' }
FASTFortranDoublePrecisionLiteral >> accept: aVisitor [
	^aVisitor visitFASTFortranDoublePrecisionLiteral: self
]
