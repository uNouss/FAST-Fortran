Extension { #name : #FASTFortranIntegerLiteral }

{ #category : #'*FAST-Fortran' }
FASTFortranIntegerLiteral >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranIntegerLiteral: self.
]
