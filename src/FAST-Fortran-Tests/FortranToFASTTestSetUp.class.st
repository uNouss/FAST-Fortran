Class {
	#name : #FortranToFASTTestSetUp,
	#superclass : #TestCase,
	#category : #'FAST-Fortran-Tests-Visitor'
}

{ #category : #'as yet unclassified' }
FortranToFASTTestSetUp >> astHaskell: sourceCode [
	FortranProjectImporter new
		astJSON: sourceCode
]

{ #category : #'as yet unclassified' }
FortranToFASTTestSetUp >> parse: sourceCode [

	self astHaskell: sourceCode.
	^ FASTFortranJsonVisitor new visitProgramFile:
		('fortran77.f.json' asFileReference readStreamDo: [ :str | 
			 NeoJSONReader fromString: str contents ])
]
