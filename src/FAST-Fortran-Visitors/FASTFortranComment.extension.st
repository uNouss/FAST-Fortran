Extension { #name : #FASTFortranComment }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranComment >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranComment: self.
]
