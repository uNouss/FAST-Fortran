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

	| filename option |
	option := '-v77l -t json encode'.
	filename := './fortran77.f'.
	filename asFileReference writeStreamDo: [ :stream | 
		stream truncate.
		stream
		<< (sourceCode copy replaceAll: Character cr with: Character lf) ].
	
	LibC runCommand: ('{1} {2} "{3}" >"{3}.json" 2>"{3}.err"' format: { 
				 self haskellParserPath.
				 option.
				 filename. })
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
	^ FASTFortranJsonVisitor new visit:
		('fortran77.f.json' asFileReference readStreamDo: [ :str | 
			 NeoJSONReader fromString: str contents ])
]

{ #category : #'as yet unclassified' }
FortranToFASTTestSetUp >> parse: sourceCode as: puMarker [
	| parseSelector |
	parseSelector := ('parse' , puMarker , ':') asSymbol.
	self astHaskell: sourceCode.
	^ FASTFortranJsonVisitor new
		perform: parseSelector
		with:
		  ('fortran77.f.json' asFileReference readStreamDo: [ :str | 
			   NeoJSONReader fromString: str contents ])
]

{ #category : #'as yet unclassified' }
FortranToFASTTestSetUp >> parse: sourceCode rule: aRule [

	^ FASTFortranJsonVisitor new visit:
		('fortran77.f.json' asFileReference readStreamDo: [ :str | 
			 NeoJSONReader fromString: str contents ]).
]
