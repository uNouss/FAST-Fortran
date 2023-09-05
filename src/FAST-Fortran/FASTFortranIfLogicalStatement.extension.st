Extension { #name : #FASTFortranIfLogicalStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranIfLogicalStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranIfLogicalStatement: self
]
