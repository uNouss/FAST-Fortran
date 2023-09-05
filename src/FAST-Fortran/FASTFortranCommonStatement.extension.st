Extension { #name : #FASTFortranCommonStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranCommonStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranCommonStatement: self
]
