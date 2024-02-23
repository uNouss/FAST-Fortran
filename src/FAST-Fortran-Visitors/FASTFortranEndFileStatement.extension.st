Extension { #name : #FASTFortranEndFileStatement }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranEndFileStatement >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranEndFileStatement: self.
]

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranEndFileStatement >> exportForBasicBlock [

	^FASTFortranExporterVisitor export: self
]
