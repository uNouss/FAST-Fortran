Extension { #name : #FASTFortranSubprogram }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranSubprogram >> accept: aVisitor [
	<generated>
	^aVisitor visitFASTFortranSubprogram: self.
]
