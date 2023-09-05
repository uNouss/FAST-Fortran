Extension { #name : #FASTFortranOpenStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranOpenStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranOpenStatement: self
]
