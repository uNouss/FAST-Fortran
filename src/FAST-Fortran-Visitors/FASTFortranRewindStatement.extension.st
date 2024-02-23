Extension { #name : #FASTFortranRewindStatement }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranRewindStatement >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranRewindStatement: self.
]

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranRewindStatement >> exportForBasicBlock [

	^FASTFortranExporterVisitor export: self
]
