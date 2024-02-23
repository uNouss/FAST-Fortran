Extension { #name : #FASTFortranReadStatement }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranReadStatement >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranReadStatement: self.
]

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranReadStatement >> exportForBasicBlock [

	^FASTFortranExporterVisitor export: self
]
