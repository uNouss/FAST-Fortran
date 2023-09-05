Extension { #name : #FASTFortranExternalStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranExternalStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranExternalStatement: self
]
