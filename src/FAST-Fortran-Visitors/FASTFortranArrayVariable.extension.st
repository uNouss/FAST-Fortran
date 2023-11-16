Extension { #name : #FASTFortranArrayVariable }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranArrayVariable >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranArrayVariable: self.
]
