Extension { #name : #FASTFortranPointer }

{ #category : #'*FAST-Fortran' }
FASTFortranPointer >> accept: aVisitor [
	^aVisitor visitFASTFortranPointer: self
]
