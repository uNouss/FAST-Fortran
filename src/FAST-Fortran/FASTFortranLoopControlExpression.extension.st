Extension { #name : #FASTFortranLoopControlExpression }

{ #category : #'*FAST-Fortran' }
FASTFortranLoopControlExpression >> accept: aVisitor [
	^aVisitor visitFASTFortranLoopControlExpression: self
]
