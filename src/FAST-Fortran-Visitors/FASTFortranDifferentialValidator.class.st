Class {
	#name : #FASTFortranDifferentialValidator,
	#superclass : #FASTDifferentialValidator,
	#instVars : [
		'importer'
	],
	#category : #'FAST-Fortran-Visitors-Tools'
}

{ #category : #utilities }
FASTFortranDifferentialValidator >> getASTFromString: string [
	^importer getFASTFor: string
]

{ #category : #utilities }
FASTFortranDifferentialValidator >> getTopLevelNodes: model [

	^model allWithSubTypesOf: FamixF77ProgramUnit 
]

{ #category : #initialization }
FASTFortranDifferentialValidator >> initialize [

	super initialize.

	importer := FortranProjectImporter new
]

{ #category : #testing }
FASTFortranDifferentialValidator >> isSourceFile: aFileReference [
	"for lack of a better idea"

	^ #(f FOR) includes: aFileReference extension
]

{ #category : #utilities }
FASTFortranDifferentialValidator >> reExportAST: ast [

	^ast accept: FASTFortranExporterVisitor new
]
