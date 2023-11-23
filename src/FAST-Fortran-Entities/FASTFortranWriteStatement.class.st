"
I represent Fortran Write statement
"
Class {
	#name : #FASTFortranWriteStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithArguments + FASTFortranTWithFormatIdentifier',
	#classTraits : 'FASTFortranTWithArguments classTrait + FASTFortranTWithFormatIdentifier classTrait',
	#instVars : [
		'#format => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranWriteStatement class >> annotation [

	<FMClass: #WriteStatement super: #FASTFortranAbstractStatement>
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
