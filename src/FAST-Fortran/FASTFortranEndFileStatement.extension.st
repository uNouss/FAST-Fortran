Extension { #name : #FASTFortranEndFileStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranEndFileStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranEndFileStatement: self
]
