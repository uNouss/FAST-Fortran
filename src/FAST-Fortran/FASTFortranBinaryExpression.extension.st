Extension { #name : #FASTFortranBinaryExpression }

{ #category : #'*FAST-Fortran' }
FASTFortranBinaryExpression >> accept: aVisitor [
	^aVisitor visitFASTFortranBinaryExpression: self
]
