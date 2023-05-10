Class {
	#name : #FortranToFASTTestSetUp,
	#superclass : #TestCase,
	#instVars : [
		'result'
	],
	#category : #'FAST-Fortran-JSON-Visitor-Tests'
}

{ #category : #'as yet unclassified' }
FortranToFASTTestSetUp >> astHaskell: sourceCode [
	FortranProjectImporter new
		astJSON: sourceCode
]

{ #category : #'as yet unclassified' }
FortranToFASTTestSetUp >> haskellParserPath [

	"temporal dirty hard-coding"

	^ '/Users/lsafina/.cabal/bin/fortran-src-extras serialize'
	"^ '/Users/lsafina/.cabal/bin/fortran-src' - when we need to receive a haskell-based representation"
]

{ #category : #'as yet unclassified' }
FortranToFASTTestSetUp >> parse: sourceCode [

	self astHaskell: sourceCode.
	^ FASTFortranJsonVisitor new visitProgramFile:
		('fortran77.f.json' asFileReference readStreamDo: [ :str | 
			 NeoJSONReader fromString: str contents ])
]
