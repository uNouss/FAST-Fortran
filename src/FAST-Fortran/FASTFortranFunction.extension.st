Extension { #name : #FASTFortranFunction }

{ #category : #'*FAST-Fortran' }
FASTFortranFunction >> accept: aVisitor [
	^aVisitor visitFASTFortranFunction: self
]
