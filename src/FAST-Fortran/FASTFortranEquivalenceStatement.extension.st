Extension { #name : #FASTFortranEquivalenceStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranEquivalenceStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranEquivalenceStatement: self
]
