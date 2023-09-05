"
I represent Fortran Include statement
"
Class {
	#name : #FASTFortranIncludeStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTLabelledStatement',
	#classTraits : 'FASTFortranTLabelledStatement classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranIncludeStatement class >> annotation [

	<FMClass: #IncludeStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
