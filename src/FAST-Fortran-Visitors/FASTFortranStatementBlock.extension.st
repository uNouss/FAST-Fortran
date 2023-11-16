Extension { #name : #FASTFortranStatementBlock }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranStatementBlock >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranStatementBlock: self.
]
