Extension { #name : #FASTFortranVariable }

{ #category : #'*FAST-Fortran' }
FASTFortranVariable >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranVariable: self.
]
