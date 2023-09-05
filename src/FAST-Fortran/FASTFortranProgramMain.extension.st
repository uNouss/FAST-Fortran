Extension { #name : #FASTFortranProgramMain }

{ #category : #'*FAST-Fortran' }
FASTFortranProgramMain >> accept: aVisitor [
	^aVisitor visitFASTFortranProgramMain: self
]
