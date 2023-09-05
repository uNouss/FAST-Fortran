Extension { #name : #FASTFortranSubprogram }

{ #category : #'*FAST-Fortran' }
FASTFortranSubprogram >> accept: aVisitor [
	^aVisitor visitFASTFortranSubprogram: self
]
