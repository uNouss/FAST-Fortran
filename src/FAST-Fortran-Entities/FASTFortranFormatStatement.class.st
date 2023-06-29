"
I represent Fortran Format statement
"
Class {
	#name : #FASTFortranFormatStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTFormatIdentifier + FASTFortranTtFortranLabelledStatement',
	#classTraits : 'FASTFortranTFormatIdentifier classTrait + FASTFortranTtFortranLabelledStatement classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranFormatStatement class >> annotation [

	<FMClass: #FormatStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
