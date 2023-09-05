Extension { #name : #FASTFortranIntrinsicStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranIntrinsicStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranIntrinsicStatement: self
]
