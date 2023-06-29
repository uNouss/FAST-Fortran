"
I represent Fortran Type statement
"
Class {
	#name : #FASTFortranType,
	#superclass : #FASTFortranScopableEntity,
	#instVars : [
		'#size => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranType class >> annotation [

	<FMClass: #Type super: #FASTFortranScopableEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranType >> size [

	<FMProperty: #size type: #Number>
	<generated>
	<FMComment: 'a data size in bytes'>
	^ size
]

{ #category : #accessing }
FASTFortranType >> size: anObject [
	<generated>
	size := anObject
]
