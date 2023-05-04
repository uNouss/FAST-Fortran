"
A fortran comment
"
Class {
	#name : #FASTFortranComment,
	#superclass : #FASTFortranScopableEntity,
	#instVars : [
		'#content => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranComment class >> annotation [

	<FMClass: #Comment super: #FASTFortranScopableEntity>
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
