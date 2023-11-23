"
I represent Fortran Call statement
"
Class {
	#name : #FASTFortranCallStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithArguments',
	#classTraits : 'FASTFortranTWithArguments classTrait',
	#instVars : [
		'#name => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranCallStatement class >> annotation [

	<FMClass: #CallStatement super: #FASTFortranAbstractStatement>
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
