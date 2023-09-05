Extension { #name : #FASTFortranStatementBlock }

{ #category : #'*FAST-Fortran' }
FASTFortranStatementBlock >> accept: aVisitor [
	^aVisitor visitFASTFortranStatementBlock: self
]
