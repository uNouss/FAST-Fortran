Extension { #name : #FASTFortranFunctionStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranFunctionStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranFunctionStatement: self
]
