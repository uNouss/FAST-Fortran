Class {
	#name : #FASTFortranCFGValidator,
	#superclass : #FASTAbstractValidator,
	#instVars : [
		'importer'
	],
	#category : #'FAST-Fortran-Visitors-CFG'
}

{ #category : #utilities }
FASTFortranCFGValidator >> getASTFromString: string [
	^importer getFASTFor: string
]

{ #category : #initialization }
FASTFortranCFGValidator >> initialize [

	super initialize.

	importer := FortranProjectImporter new
]

{ #category : #testing }
FASTFortranCFGValidator >> isSourceFile: aFileReference [
	"for lack of a better idea"

	^ #(f F FOR) includes: aFileReference extension
]

{ #category : #testing }
FASTFortranCFGValidator >> runOnSourceFile: aFileReference [

	| ast cfg |
	aFileReference fullName traceCr.

	[
		ast := self getASTFromFileReference: aFileReference.

		cfg := ast accept: FASTFortranCFGVisitor new.
		(FASTFortranCFGChecker on: cfg)
		ifNotEmpty: [ '  ** Found errors **' traceCr ].
	]
	on: Error
	do: [ '  ** NOT PARSEABLE **' traceCr ].

]
