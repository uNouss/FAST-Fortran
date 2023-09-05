Extension { #name : #FASTFortranElseStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranElseStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranElseStatement: self
]
