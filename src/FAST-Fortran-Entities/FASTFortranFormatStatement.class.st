"
I represent Fortran Format statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
| `format` | `FASTFortranTWithFormat` | `parentFormatedStatement` | `FASTFortranTFormat` | The description of the format|


## Properties
======================

| Name | Type | Default value | Comment |
| `formatDescription` | `String` | nil | |

"
Class {
	#name : #FASTFortranFormatStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithFormat',
	#classTraits : 'FASTFortranTWithFormat classTrait',
	#instVars : [
		'#formatDescription => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranFormatStatement class >> annotation [

	<FMClass: #FormatStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranFormatStatement >> formatDescription [

	<FMProperty: #formatDescription type: #String>
	<generated>
	^ formatDescription
]

{ #category : #accessing }
FASTFortranFormatStatement >> formatDescription: anObject [
	<generated>
	formatDescription := anObject
]
