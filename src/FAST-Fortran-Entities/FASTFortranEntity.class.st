"
any entity

## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranEntity,
	#superclass : #MooseEntity,
	#traits : 'FASTFortranTEntity',
	#classTraits : 'FASTFortranTEntity classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FASTFortranEntity class >> isAbstract [

	<generated>
	^ self == FASTFortranEntity
]

{ #category : #meta }
FASTFortranEntity class >> metamodel [

	<generated>
	^ FASTFortranModel metamodel
]

{ #category : #testing }
FASTFortranEntity >> isQueryable [

	<generated>
	^ false
]

{ #category : #testing }
FASTFortranEntity >> isStatement [

	<generated>
	^ false
]
