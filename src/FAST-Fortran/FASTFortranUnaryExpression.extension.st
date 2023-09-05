Extension { #name : #FASTFortranUnaryExpression }

{ #category : #'*FAST-Fortran' }
FASTFortranUnaryExpression >> accept: aVisitor [
	^aVisitor visitFASTFortranUnaryExpression: self
]
