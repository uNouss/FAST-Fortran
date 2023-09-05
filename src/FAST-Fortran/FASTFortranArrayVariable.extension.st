Extension { #name : #FASTFortranArrayVariable }

{ #category : #'*FAST-Fortran' }
FASTFortranArrayVariable >> accept: aVisitor [
	^aVisitor visitFASTFortranArrayVariable: self
]
