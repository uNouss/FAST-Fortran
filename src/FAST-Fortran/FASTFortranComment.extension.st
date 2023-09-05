Extension { #name : #FASTFortranComment }

{ #category : #'*FAST-Fortran' }
FASTFortranComment >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranComment: self.
]
