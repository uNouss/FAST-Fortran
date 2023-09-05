Extension { #name : #FASTFortranAmpersand }

{ #category : #'*FAST-Fortran' }
FASTFortranAmpersand >> accept: aVisitor [
	^aVisitor visitFASTFortranAmpersand: self
]
