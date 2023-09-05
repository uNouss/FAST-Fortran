Extension { #name : #FASTFortranRealLiteral }

{ #category : #'*FAST-Fortran' }
FASTFortranRealLiteral >> accept: aVisitor [
	^aVisitor visitFASTFortranRealLiteral: self
]
