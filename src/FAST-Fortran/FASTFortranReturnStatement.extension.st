Extension { #name : #FASTFortranReturnStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranReturnStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranReturnStatement: self
]
