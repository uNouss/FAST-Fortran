Extension { #name : #FASTFortranCharacterLiteral }

{ #category : #'*FAST-Fortran' }
FASTFortranCharacterLiteral >> accept: aVisitor [
	^aVisitor visitFASTFortranCharacterLiteral: self
]
