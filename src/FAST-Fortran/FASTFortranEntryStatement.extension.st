Extension { #name : #FASTFortranEntryStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranEntryStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranEntryStatement: self
]
