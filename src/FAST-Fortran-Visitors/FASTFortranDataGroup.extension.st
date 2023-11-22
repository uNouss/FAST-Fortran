Extension { #name : #FASTFortranDataGroup }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranDataGroup >> accept: aVisitor [

	^aVisitor visitFASTFortranDataGroup: self
]
