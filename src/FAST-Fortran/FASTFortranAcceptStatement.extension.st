Extension { #name : #FASTFortranAcceptStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranAcceptStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranAcceptStatement: self
]
