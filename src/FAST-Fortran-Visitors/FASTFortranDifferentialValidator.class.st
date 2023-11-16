Class {
	#name : #FASTFortranDifferentialValidator,
	#superclass : #FASTDifferentialValidator,
	#instVars : [
		'importer'
	],
	#category : #'FAST-Fortran-Visitors-Tools'
}

{ #category : #utilities }
FASTFortranDifferentialValidator >> getASTFromString: stream [

	^importer getFASTFor: stream
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
	"dummy test"

	^aFileReference extension = 'f'
]

{ #category : #utilities }
FASTFortranDifferentialValidator >> reExportAST: ast [

	^ast accept: FASTFortranExporterVisitor new
]
