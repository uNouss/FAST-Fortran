Extension { #name : #FASTFortranPragmaStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranPragmaStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranPragmaStatement: self
]
