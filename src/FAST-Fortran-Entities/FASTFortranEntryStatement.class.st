"
I represent Fortran Entry statement
"
Class {
	#name : #FASTFortranEntryStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTtFortranLabelledStatement',
	#classTraits : 'FASTFortranTtFortranLabelledStatement classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranEntryStatement class >> annotation [

	<FMClass: #EntryStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
