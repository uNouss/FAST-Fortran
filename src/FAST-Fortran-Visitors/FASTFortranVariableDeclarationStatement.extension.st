Extension { #name : #FASTFortranVariableDeclarationStatement }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranVariableDeclarationStatement >> accept: aVisitor [

	^aVisitor visitFASTFortranVariableDeclarationStatement: self
]
