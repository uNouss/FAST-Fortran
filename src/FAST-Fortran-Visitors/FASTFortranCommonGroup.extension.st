Extension { #name : #FASTFortranCommonGroup }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranCommonGroup >> accept: aVisitor [

	^aVisitor visitFASTFortranCommonGroup: self
]
