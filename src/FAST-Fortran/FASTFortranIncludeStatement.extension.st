Extension { #name : #FASTFortranIncludeStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranIncludeStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranIncludeStatement: self
]
