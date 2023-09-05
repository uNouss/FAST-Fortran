Extension { #name : #FASTFortranVariable }

{ #category : #'*FAST-Fortran' }
FASTFortranVariable >> accept: aVisitor [
	^aVisitor visitFASTFortranVariable: self
]
