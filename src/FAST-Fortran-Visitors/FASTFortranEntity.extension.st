Extension { #name : #FASTFortranEntity }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranEntity >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranEntity: self.
]
