Extension { #name : #FASTFortranWriteStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranWriteStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranWriteStatement: self
]
