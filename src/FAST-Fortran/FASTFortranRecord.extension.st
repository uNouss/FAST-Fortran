Extension { #name : #FASTFortranRecord }

{ #category : #'*FAST-Fortran' }
FASTFortranRecord >> accept: aVisitor [
	^aVisitor visitFASTFortranRecord: self
]
