Extension { #name : #FASTFortranIntegerLiteral }

{ #category : #'*FAST-Fortran' }
FASTFortranIntegerLiteral >> accept: aVisitor [
	^aVisitor visitFASTFortranIntegerLiteral: self
]
