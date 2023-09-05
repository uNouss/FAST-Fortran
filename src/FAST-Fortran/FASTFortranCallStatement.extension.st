Extension { #name : #FASTFortranCallStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranCallStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranCallStatement: self
]
