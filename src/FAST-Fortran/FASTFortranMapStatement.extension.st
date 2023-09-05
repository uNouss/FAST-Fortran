Extension { #name : #FASTFortranMapStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranMapStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranMapStatement: self
]
