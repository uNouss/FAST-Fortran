Extension { #name : #FASTFortranBooleanLiteral }

{ #category : #'*FAST-Fortran' }
FASTFortranBooleanLiteral >> accept: aVisitor [
	^aVisitor visitFASTFortranBooleanLiteral: self
]
