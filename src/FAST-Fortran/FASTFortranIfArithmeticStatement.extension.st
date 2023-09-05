Extension { #name : #FASTFortranIfArithmeticStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranIfArithmeticStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranIfArithmeticStatement: self
]
