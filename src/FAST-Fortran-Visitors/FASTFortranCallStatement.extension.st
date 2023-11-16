Extension { #name : #FASTFortranCallStatement }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranCallStatement >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranCallStatement: self.
]
