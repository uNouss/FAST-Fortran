"
I represent Fortran Format statement
"
Class {
	#name : #FASTFortranFormatStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTFormatIdentifier + FASTFortranTLabelledStatement',
	#classTraits : 'FASTFortranTFormatIdentifier classTrait + FASTFortranTLabelledStatement classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #'as yet unclassified' }
FASTFortranFormatStatement class >> annotation [

	<FMClass: #FormatStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
