Extension { #name : #FASTFortranEncodeStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranEncodeStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranEncodeStatement: self
]
