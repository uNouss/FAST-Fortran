Extension { #name : #FASTFortranEquivalenceGroup }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranEquivalenceGroup >> accept: aVisitor [

	^aVisitor visitFASTFortranEquivalenceGroup: self
]
