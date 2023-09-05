Extension { #name : #FASTFortranDoWhileStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranDoWhileStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranDoWhileStatement: self
]
