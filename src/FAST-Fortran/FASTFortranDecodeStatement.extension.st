Extension { #name : #FASTFortranDecodeStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranDecodeStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranDecodeStatement: self
]
