Extension { #name : #FASTFortranVolatileStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranVolatileStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranVolatileStatement: self
]
