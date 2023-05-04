"
any entity
"
Class {
	#name : #FASTFortranEntity,
	#superclass : #MooseEntity,
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#startPos => FMProperty',
		'#endPos => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #meta }
FASTFortranEntity class >> metamodel [

	<generated>
	^ FASTFortranModel metamodel
]

{ #category : #accessing }
FASTFortranEntity >> endPos [

	<FMProperty: #endPos type: #Number>
	<generated>
	^ endPos
]

{ #category : #accessing }
FASTFortranEntity >> endPos: anObject [
	<generated>
	endPos := anObject
]

{ #category : #accessing }
FASTFortranEntity >> startPos [

	<FMProperty: #startPos type: #Number>
	<generated>
	^ startPos
]

{ #category : #accessing }
FASTFortranEntity >> startPos: anObject [
	<generated>
	startPos := anObject
]
