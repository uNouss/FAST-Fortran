Extension { #name : #FASTFortranCloseStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranCloseStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranCloseStatement: self
]
