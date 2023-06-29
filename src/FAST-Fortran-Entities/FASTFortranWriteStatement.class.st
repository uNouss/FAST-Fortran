"
I represent Fortran Write statement
"
Class {
	#name : #FASTFortranWriteStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTWithArguments + FASTFortranTWithFormatIdentifier + FASTFortranTtFortranLabelledStatement',
	#classTraits : 'FASTFortranTWithArguments classTrait + FASTFortranTWithFormatIdentifier classTrait + FASTFortranTtFortranLabelledStatement classTrait',
	#instVars : [
		'#format => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranWriteStatement class >> annotation [

	<FMClass: #WriteStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranWriteStatement >> format [

	<FMProperty: #format type: #String>
	<generated>
	<FMComment: 'Format identifier. '>
	^ format
]

{ #category : #accessing }
FASTFortranWriteStatement >> format: anObject [
	<generated>
	format := anObject
]
