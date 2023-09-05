Extension { #name : #FASTFortranBackspaceStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranBackspaceStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranBackspaceStatement: self
]
