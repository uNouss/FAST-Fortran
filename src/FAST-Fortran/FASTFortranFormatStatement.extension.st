Extension { #name : #FASTFortranFormatStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranFormatStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranFormatStatement: self
]
