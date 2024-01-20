Extension { #name : #FASTFortranIfBlockStatement }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranIfBlockStatement >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranIfBlockStatement: self.
]

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranIfBlockStatement >> exportForBasicBlock [

	^'if (' , (FASTFortranExporterVisitor export: self condition) , ')'
]
