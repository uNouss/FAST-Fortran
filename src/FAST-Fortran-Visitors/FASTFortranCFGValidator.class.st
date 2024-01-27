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
	^(importer getFASTFor: string) first
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

	| ast |
	aFileReference fullName traceCr.

	ast := 
		["1halt."
			self getASTFromFileReference: aFileReference.
		]
		on: Error
		do: [
			'  ** NOT PARSEABLE **' traceCr.
			nil
		].

	ast ifNotNil: [
		(FASTFortranCFGChecker on: (ast accept: FASTFortranCFGVisitor new))
			ifNotEmpty: [ '  ** Found errors **' traceCr ]
	].
]
