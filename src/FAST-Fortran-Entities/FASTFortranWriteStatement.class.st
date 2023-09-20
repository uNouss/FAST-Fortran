"
I represent Fortran Write statement
"
Class {
	#name : #FASTFortranWriteStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTLabelledStatement + FASTFortranTWithArguments + FASTFortranTWithFormatIdentifier',
	#classTraits : 'FASTFortranTLabelledStatement classTrait + FASTFortranTWithArguments classTrait + FASTFortranTWithFormatIdentifier classTrait',
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
