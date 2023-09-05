Extension { #name : #FASTFortranType }

{ #category : #'*FAST-Fortran' }
FASTFortranType >> accept: aVisitor [
	^aVisitor visitFASTFortranType: self
]
