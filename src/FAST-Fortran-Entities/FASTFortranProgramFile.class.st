"
An entity that can contain fortran program units and comments

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `programUnit` | `FASTFortranProgramFile` | `parentProgramFile` | `FASTFortranProgramUnit` | Program Units in a program file|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FASTFortranTWithComments` | `container` | `FASTFortranTComment` | list of comments defined in the entity|



"
Class {
	#name : #FASTFortranProgramFile,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTWithComments',
	#classTraits : 'FASTFortranTWithComments classTrait',
	#instVars : [
		'#programUnit => FMMany type: #FASTFortranProgramUnit opposite: #parentProgramFile'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranProgramFile class >> annotation [

	<FMClass: #ProgramFile super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranProgramFile >> addProgramUnit: anObject [
	<generated>
	^ self programUnit add: anObject
]

{ #category : #accessing }
FASTFortranProgramFile >> programUnit [
	"Relation named: #programUnit type: #FASTFortranProgramUnit opposite: #parentProgramFile"

	<generated>
	<FMComment: 'Program Units in a program file'>
	<derived>
	^ programUnit
]

{ #category : #accessing }
FASTFortranProgramFile >> programUnit: anObject [

	<generated>
	programUnit value: anObject
]

{ #category : #navigation }
FASTFortranProgramFile >> programUnitGroup [
	<generated>
	<navigation: 'ProgramUnit'>
	^ MooseSpecializedGroup withAll: self programUnit asSet
]
