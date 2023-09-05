Extension { #name : #FASTFortranRewindStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranRewindStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranRewindStatement: self
]
