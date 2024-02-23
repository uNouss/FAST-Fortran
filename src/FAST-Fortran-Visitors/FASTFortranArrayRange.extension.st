Extension { #name : #FASTFortranArrayRange }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranArrayRange >> accept: aVisitor [

	^aVisitor visitFASTFortranArrayRange: self
]
