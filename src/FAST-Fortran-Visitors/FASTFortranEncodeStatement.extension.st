Extension { #name : #FASTFortranEncodeStatement }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranEncodeStatement >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranEncodeStatement: self.
]

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranEncodeStatement >> exportForBasicBlock [

	^FASTFortranExporterVisitor export: self
]
