Extension { #name : #FASTFortranIfBlockStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranIfBlockStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranIfBlockStatement: self
]
