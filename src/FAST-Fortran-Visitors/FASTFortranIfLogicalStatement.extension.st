Extension { #name : #FASTFortranIfLogicalStatement }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranIfLogicalStatement >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranIfLogicalStatement: self.
]

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranIfLogicalStatement >> exportForBasicBlock [

	^'if (' , (FASTFortranExporterVisitor export: self condition) , ')'
]
