Extension { #name : #FASTFortranReadStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranReadStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranReadStatement: self
]
