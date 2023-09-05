Class {
	#name : #FASTFortranExporterVisitor,
	#superclass : #FASTFortranVisitor,
	#instVars : [
		'stream'
	],
	#category : #'FAST-Fortran-Visitor'
}

{ #category : #accessing }
FASTFortranExporterVisitor >> resetStream [
	stream := nil
]

{ #category : #visiting }
FASTFortranExporterVisitor >> rootEntitiesIn: aFASTFortranModel [
	^aFASTFortranModel entities select: [ :entity |
		entity parents isEmpty
	]
]

{ #category : #accessing }
FASTFortranExporterVisitor >> stream [
	^stream ifNil: [ stream := WriteStream on: '' ]
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visit: aFASTFortranModel [
	(self rootEntitiesIn: aFASTFortranModel) do: [ :rootEntity |
			rootEntity accept: self
	].
	^stream
]
