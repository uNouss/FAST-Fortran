Extension { #name : #FASTFortranDataStatement }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranDataStatement >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranDataStatement: self.
]
