"
A class to import a FAST model from the source code of a program unit.

Example:
```
FASTFortranCamfortImporter new getFASTFor: '      SUBROUTINE RANK( A, B)
      end
 '.
```
"
Class {
	#name : #FASTFortranCamfortImporter,
	#superclass : #FortranProjectImporter,
	#category : #'FAST-Fortran-JSON-Visitor-Visitor'
}

{ #category : #'private - parsing' }
FASTFortranCamfortImporter >> fortranSrcPath [ 
	^'/home/anquetil/.cabal/bin/fortran-src-extras'
]

{ #category : #api }
FASTFortranCamfortImporter >> getFASTFor: sourceCode [

	self astJSON: sourceCode.
	^ (self getFASTFromDefaultFile) first
]

{ #category : #'private - parsing' }
FASTFortranCamfortImporter >> getFASTFromDefaultFile [

	^ FASTFortranJsonVisitor new visitProgramFile:
		  ('fortran77.f.json' asFileReference readStreamDo: [ :str | 
			   NeoJSONReader fromString: str contents ])
]
