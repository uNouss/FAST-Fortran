Extension { #name : #FASTFortranFunction }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranFunction >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranFunction: self.
]
