Extension { #name : #FASTFortranStopStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranStopStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranStopStatement: self
]
