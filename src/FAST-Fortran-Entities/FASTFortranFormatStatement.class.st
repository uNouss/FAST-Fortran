"
I represent Fortran Format statement
"
Class {
	#name : #FASTFortranFormatStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTFormatIdentifier + FASTFortranTLabelledStatement',
	#classTraits : 'FASTFortranTFormatIdentifier classTrait + FASTFortranTLabelledStatement classTrait',
	#instVars : [
		'#formatDescription => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranFormatStatement class >> annotation [

	<FMClass: #FormatStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranFormatStatement >> formatDescription [

	<FMProperty: #formatDescription type: #String>
	<generated>
	^ formatDescription
]

{ #category : #accessing }
FASTFortranFormatStatement >> formatDescription: anObject [
	<generated>
	formatDescription := anObject
]
