Extension { #name : #FASTFortranImplicitTypingRule }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranImplicitTypingRule >> accept: aVisitor [

	^aVisitor visitFASTFortranImplicitTypingRule: self
]
