Extension { #name : #FASTFortranGoToComputedStatement }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranGoToComputedStatement >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranGoToComputedStatement: self.
]

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranGoToComputedStatement >> exportForBasicBlock [

	^FASTFortranExporterVisitor export: self
]
