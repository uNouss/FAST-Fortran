Extension { #name : #FASTFortranCloseStatement }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranCloseStatement >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranCloseStatement: self.
]

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranCloseStatement >> exportForBasicBlock [

	^FASTFortranExporterVisitor export: self
]
