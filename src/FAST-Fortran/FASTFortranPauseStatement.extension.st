Extension { #name : #FASTFortranPauseStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranPauseStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranPauseStatement: self
]
