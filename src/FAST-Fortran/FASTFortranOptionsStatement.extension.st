Extension { #name : #FASTFortranOptionsStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranOptionsStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranOptionsStatement: self
]
