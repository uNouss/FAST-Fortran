Extension { #name : #FASTFortranReadStatement }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranReadStatement >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranReadStatement: self.
]
