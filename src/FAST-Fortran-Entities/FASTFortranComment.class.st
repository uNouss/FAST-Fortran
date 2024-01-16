"
A fortran comment

## Relations
======================

### Other
- Relation: #container Type: #FASTFortranTWithComments Opposite: #comments Comment: Source code entity containing the comment

## Properties
======================

- Named: #content Type: String Comment: Content of the comment as a String
- Named: #content Type: String Comment: Determines a content of a comment
- Named: #endPos Type: Number
- Named: #endPos Type: Number
- Named: #startPos Type: Number
- Named: #startPos Type: Number

"
Class {
	#name : #FASTFortranComment,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTComment + FASTFortranTEntity',
	#classTraits : 'FASTFortranTComment classTrait + FASTFortranTEntity classTrait',
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
