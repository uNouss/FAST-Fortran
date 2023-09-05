Extension { #name : #FASTFortranProgramFile }

{ #category : #'*FAST-Fortran' }
FASTFortranProgramFile >> accept: aVisitor [
	^aVisitor visitFASTFortranProgramFile: self
]
