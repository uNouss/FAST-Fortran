Extension { #name : #FASTFortranProcedure }

{ #category : #'*FAST-Fortran' }
FASTFortranProcedure >> accept: aVisitor [
	^aVisitor visitFASTFortranProcedure: self
]
