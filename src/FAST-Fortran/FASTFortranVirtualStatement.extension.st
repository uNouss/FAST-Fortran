Extension { #name : #FASTFortranVirtualStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranVirtualStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranVirtualStatement: self
]
