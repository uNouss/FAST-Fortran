Extension { #name : #FASTFortranDoStatement }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranDoStatement >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranDoStatement: self.
]

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranDoStatement >> exportForBasicBlock [

	^'do ' , (FASTFortranExporterVisitor export: self loopControl)
]
