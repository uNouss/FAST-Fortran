Extension { #name : #FASTFortranVariable }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranVariable >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranVariable: self.
]
