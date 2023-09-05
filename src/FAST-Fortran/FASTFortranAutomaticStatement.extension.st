Extension { #name : #FASTFortranAutomaticStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranAutomaticStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranAutomaticStatement: self
]
