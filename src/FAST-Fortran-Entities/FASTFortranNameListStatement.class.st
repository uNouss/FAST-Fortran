"
I represent Fortran NameList statement
"
Class {
	#name : #FASTFortranNameListStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTLabelledStatement',
	#classTraits : 'FASTFortranTLabelledStatement classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranNameListStatement class >> annotation [

	<FMClass: #NameListStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
