Extension { #name : #FASTFortranIntegerLiteral }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranIntegerLiteral >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranIntegerLiteral: self.
]
