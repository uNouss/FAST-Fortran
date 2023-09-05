Extension { #name : #FASTFortranStructure }

{ #category : #'*FAST-Fortran' }
FASTFortranStructure >> accept: aVisitor [
	^aVisitor visitFASTFortranStructure: self
]
