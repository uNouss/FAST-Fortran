Extension { #name : #FASTFortranComment }

{ #category : #'*FAST-Fortran' }
FASTFortranComment >> accept: aVisitor [
	^aVisitor visitFASTFortranComment: self
]
