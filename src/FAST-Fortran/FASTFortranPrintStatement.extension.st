Extension { #name : #FASTFortranPrintStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranPrintStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranPrintStatement: self
]
