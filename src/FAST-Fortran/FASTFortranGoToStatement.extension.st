Extension { #name : #FASTFortranGoToStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranGoToStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranGoToStatement: self
]
