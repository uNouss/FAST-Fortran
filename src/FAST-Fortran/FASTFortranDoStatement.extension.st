Extension { #name : #FASTFortranDoStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranDoStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranDoStatement: self
]
