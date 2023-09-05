Extension { #name : #FASTFortranParameterStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranParameterStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranParameterStatement: self
]
