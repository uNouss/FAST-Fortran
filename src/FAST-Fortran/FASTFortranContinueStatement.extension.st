Extension { #name : #FASTFortranContinueStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranContinueStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranContinueStatement: self
]
