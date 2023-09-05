Extension { #name : #FASTFortranDataStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranDataStatement >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranDataStatement: self.
]
