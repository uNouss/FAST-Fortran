"
I represent Fortran Call statement
"
Class {
	#name : #FASTFortranCallStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTWithArguments + FASTFortranTLabelledStatement',
	#classTraits : 'FASTFortranTWithArguments classTrait + FASTFortranTLabelledStatement classTrait',
	#instVars : [
		'#name => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #'as yet unclassified' }
FASTFortranCallStatement class >> annotation [

	<FMClass: #CallStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranCallStatement >> name [

	<FMProperty: #name type: #String>
	<generated>
	<FMComment: 'Name of called entity (a subroutine)'>
	^ name
]

{ #category : #accessing }
FASTFortranCallStatement >> name: anObject [
	<generated>
	name := anObject
]
