Extension { #name : #FASTFortranInquireStatement }

{ #category : #'*FAST-Fortran' }
FASTFortranInquireStatement >> accept: aVisitor [
	^aVisitor visitFASTFortranInquireStatement: self
]
