Extension { #name : #FASTFortranUnionStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranUnionStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranUnionStatement: self
]
