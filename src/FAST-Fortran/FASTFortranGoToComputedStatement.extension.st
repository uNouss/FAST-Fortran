Extension { #name : #FASTFortranGoToComputedStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranGoToComputedStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranGoToComputedStatement: self
]
