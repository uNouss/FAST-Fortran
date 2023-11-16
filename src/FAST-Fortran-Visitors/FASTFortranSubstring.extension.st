Extension { #name : #FASTFortranSubstring }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranSubstring >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranSubstring: self.
]
