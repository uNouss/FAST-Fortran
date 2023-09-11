Extension { #name : #FASTFortranProgramUnit }

{ #category : #'*FAST-Core-Model-Extension' }
FASTFortranProgramUnit >> inspectionFASTDisplay [

	^ (self class name allButFirst: 4) , self name
]
