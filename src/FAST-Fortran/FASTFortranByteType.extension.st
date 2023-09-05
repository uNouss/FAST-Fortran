Extension { #name : #FASTFortranByteType }

{ #category : #'*FAST-Fortran' }
FASTFortranByteType >> accept: aVisitor [
	^aVisitor visitFASTFortranByteType: self
]
