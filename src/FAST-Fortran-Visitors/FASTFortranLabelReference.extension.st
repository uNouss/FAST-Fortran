Extension { #name : #FASTFortranLabelReference }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranLabelReference >> accept: aVisitor [

	^aVisitor visitFASTFortranLabelReference: self
]
