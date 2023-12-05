"
I represent Fortran Read statement
"
Class {
	#name : #FASTFortranReadStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithFormatIdentifier + FASTFortranTWithIOParameters',
	#classTraits : 'FASTFortranTWithFormatIdentifier classTrait + FASTFortranTWithIOParameters classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranReadStatement class >> annotation [

	<FMClass: #ReadStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
