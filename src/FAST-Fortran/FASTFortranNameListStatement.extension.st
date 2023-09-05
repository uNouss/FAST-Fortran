Extension { #name : #FASTFortranNameListStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranNameListStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranNameListStatement: self
]
