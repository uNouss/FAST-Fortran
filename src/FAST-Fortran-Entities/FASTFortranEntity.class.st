"
any entity

## Properties
======================

- Named: #endPos Type: Number
- Named: #endPos Type: Number
- Named: #startPos Type: Number
- Named: #startPos Type: Number

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
FASTFortranEntity >> isStatement [

	<generated>
	^ false
]
