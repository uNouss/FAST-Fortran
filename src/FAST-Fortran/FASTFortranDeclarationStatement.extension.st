Extension { #name : #FASTFortranDeclarationStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranDeclarationStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranDeclarationStatement: self
]
