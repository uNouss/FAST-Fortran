Extension { #name : #FASTFortranOpenStatement }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranOpenStatement >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranOpenStatement: self.
]

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranOpenStatement >> exportForBasicBlock [

	^FASTFortranExporterVisitor export: self
]
