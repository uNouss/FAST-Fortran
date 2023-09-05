Extension { #name : #FASTFortranProgramUnit }

{ #category : #'*FAST-Fortran' }
FASTFortranProgramUnit >> accept: aVisitor [
	^aVisitor visitFASTFortranProgramUnit: self
]
