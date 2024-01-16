"
An entity that can contain fortran program units and comments

## Relations
======================

### Children
- Relation: #programUnit Type: #FASTFortranProgramUnit Opposite: #parentProgramFile Comment: Program Units in a program file
### Other
- Relation: #comments Type: #FASTFortranTComment Opposite: #container Comment: list of comments defined in the entity


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
