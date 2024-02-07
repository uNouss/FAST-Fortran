Extension { #name : #FASTFortranWriteStatement }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranWriteStatement >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranWriteStatement: self.
]

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranWriteStatement >> exportForBasicBlock [

	^FASTFortranExporterVisitor export: self
]
