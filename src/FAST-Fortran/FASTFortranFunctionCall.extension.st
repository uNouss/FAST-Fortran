Extension { #name : #FASTFortranFunctionCall }

{ #category : #'*FAST-Fortran' }
FASTFortranFunctionCall >> accept: aVisitor [
	^aVisitor visitFASTFortranFunctionCall: self
]
