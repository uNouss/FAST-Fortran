"
A fortran comment

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `container` | `FASTFortranTComment` | `comments` | `FASTFortranTWithComments` | Source code entity containing the comment|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `content` | `String` | nil | Determines a content of a comment|
| `content` | `String` | nil | Content of the comment as a String|
| `endPos` | `Number` | nil | |
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

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
