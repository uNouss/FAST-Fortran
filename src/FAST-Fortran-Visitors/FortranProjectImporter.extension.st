Extension { #name : #FortranProjectImporter }

{ #category : #'*FAST-Fortran-Visitors' }
FortranProjectImporter >> defaultFASTSource [
	^(self ensureFolder: self fastSrcFolder) / 'tmpFASTSource.f'
]

{ #category : #'*FAST-Fortran-Visitors' }
FortranProjectImporter >> fastSrcFolder [
	^'FastTmp'
]

{ #category : #'*FAST-Fortran-Visitors' }
FortranProjectImporter >> getFASTFor: sourceCode [

	"Remove TAB at state of lines ???? "

	| fastSrcFile |
	fastSrcFile := self defaultFASTSource.
	fastSrcFile writeStreamDo: [:stream |
		stream truncate.
		self preprocess: sourceCode to: stream.
		stream cr
	].
	
	self parseFortran77: fastSrcFile.
	^self jsonASTToFAST 
]

{ #category : #'*FAST-Fortran-Visitors' }
FortranProjectImporter >> jsonASTToFAST [

	| fortranFile jsonAST |
	fortranFile := self defaultFASTSource.
	jsonAST := (self fortranFolderToASTFolder: fortranFile parent) / (fortranFile basename , '.json').

	^FASTFortranJsonVisitor new visitProgramFile:
		  (jsonAST readStreamEncoded: self defaultFileEncoding do: [ :str | 
			   NeoJSONReader fromString: str contents ])
]
