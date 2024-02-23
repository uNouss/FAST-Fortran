Extension { #name : #FASTFortranAssignmentExpression }

{ #category : #'*FAST-Fortran-Visitors' }
FASTFortranAssignmentExpression >> accept: aVisitor [

	^aVisitor visitFASTFortranAssignmentExpression: self.
]
