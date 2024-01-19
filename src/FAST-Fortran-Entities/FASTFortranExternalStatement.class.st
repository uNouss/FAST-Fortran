"
I represent Fortran External statement

## Properties
======================

| Name | Type | Default value | Comment |
| `name` | `String` | nil | Name of external procedure, dummy procedure, or block data routine|

"
Class {
	#name : #FASTFortranExternalStatement,
	#superclass : #FASTFortranAbstractStatement,
	#instVars : [
		'#name => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranExternalStatement class >> annotation [

	<FMClass: #ExternalStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranExternalStatement >> name [

	<FMProperty: #name type: #String>
	<generated>
	<FMComment: 'Name of external procedure, dummy procedure, or block data routine'>
	^ name
]

{ #category : #accessing }
FASTFortranExternalStatement >> name: anObject [
	<generated>
	name := anObject
]
