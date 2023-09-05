Extension { #name : #FASTFortranStaticStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranStaticStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranStaticStatement: self
]
