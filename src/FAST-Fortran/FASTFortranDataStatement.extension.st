Extension { #name : #FASTFortranDataStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranDataStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranDataStatement: self
]
