"
An entity that can contain fortran program units and comments
"
Class {
	#name : #FASTFortranProgramFile,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#comment => FMMany type: #FASTFortranComment opposite: #parentProgramFile',
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
FASTFortranProgramFile >> addComment: anObject [
	<generated>
	^ self comment add: anObject
]

{ #category : #adding }
FASTFortranProgramFile >> addProgramUnit: anObject [
	<generated>
	^ self programUnit add: anObject
]

{ #category : #accessing }
FASTFortranProgramFile >> comment [
	"Relation named: #comment type: #FASTFortranComment opposite: #parentProgramFile"

	<generated>
	<FMComment: 'Comments in a program file'>
	<derived>
	^ comment
]

{ #category : #accessing }
FASTFortranProgramFile >> comment: anObject [

	<generated>
	comment value: anObject
]

{ #category : #navigation }
FASTFortranProgramFile >> commentGroup [
	<generated>
	<navigation: 'Comment'>
	^ MooseSpecializedGroup withAll: self comment asSet
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
