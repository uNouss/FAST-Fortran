"
A fortran comment
"
Class {
	#name : #FASTFortranComment,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTEntity',
	#classTraits : 'FASTFortranTEntity classTrait',
	#instVars : [
		'#content => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranComment class >> annotation [

	<FMClass: #Comment super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranComment >> content [

	<FMProperty: #content type: #String>
	<generated>
	<FMComment: 'Determines a content of a comment'>
	^ content
]

{ #category : #accessing }
FASTFortranComment >> content: anObject [
	<generated>
	content := anObject
]
