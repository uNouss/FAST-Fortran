Extension { #name : #FASTFortranProgramFile }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranProgramFile >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranProgramFile: self.
]
