Extension { #name : #FASTFortranSaveStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranSaveStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranSaveStatement: self
]
