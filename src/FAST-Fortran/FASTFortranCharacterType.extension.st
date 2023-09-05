Extension { #name : #FASTFortranCharacterType }

{ #category : #'*FAST-Fortran' }
FASTFortranCharacterType >> accept: aVisitor [
	^aVisitor visitFASTFortranCharacterType: self
]
