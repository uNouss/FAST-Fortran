Extension { #name : #FASTFortranVariableDeclarator }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranVariableDeclarator >> accept: aVisitor [

	^aVisitor visitFASTFortranVariableDeclarator: self
]
