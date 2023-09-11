"
Contains the block of Fortran statements
"
Class {
	#name : #FASTFortranStatementBlock,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTStatementBlock + FASTFortranTWithComments',
	#classTraits : 'FASTFortranTStatementBlock classTrait + FASTFortranTWithComments classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #'as yet unclassified' }
FASTFortranStatementBlock class >> annotation [

	<FMClass: #StatementBlock super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
