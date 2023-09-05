Extension { #name : #FASTFortranRecord }

{ #category : #'*FAST-Fortran' }
FASTFortranRecord >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranRecord: self.
]
