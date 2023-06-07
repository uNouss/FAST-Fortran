"
I represent Fortran Array
"
Class {
	#name : #FASTFortranArray,
	#superclass : #FASTFortranExpression,
	#traits : 'FASTFortranTAssigneable',
	#classTraits : 'FASTFortranTAssigneable classTrait',
	#instVars : [
		'#name => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranArray class >> annotation [

	<FMClass: #Array super: #FASTFortranExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranArray >> name [

	<FMProperty: #name type: #String>
	<generated>
	<FMComment: 'Determines the array name'>
	^ name
]

{ #category : #accessing }
FASTFortranArray >> name: anObject [
	<generated>
	name := anObject
]
