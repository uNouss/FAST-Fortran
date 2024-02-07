Extension { #name : #FASTFortranDecodeStatement }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranDecodeStatement >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranDecodeStatement: self.
]

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranDecodeStatement >> exportForBasicBlock [

	^FASTFortranExporterVisitor export: self
]
