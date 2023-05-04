"
A Entity with an optional scope

Statements are scopable because many statements allow to introduce local variables (e.g. for statement in Java)
"
Class {
	#name : #FASTFortranScopableEntity,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#parentProgramUnit => FMOne type: #FASTFortranProgramUnit opposite: #statements'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranScopableEntity class >> annotation [

	<FMClass: #ScopableEntity super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranScopableEntity >> parentProgramUnit [
	"Relation named: #parentProgramUnit type: #FASTFortranProgramUnit opposite: #statements"

	<generated>
	<FMComment: 'Parent program unit'>
	<container>
	^ parentProgramUnit
]

{ #category : #accessing }
FASTFortranScopableEntity >> parentProgramUnit: anObject [

	<generated>
	parentProgramUnit := anObject
]

{ #category : #navigation }
FASTFortranScopableEntity >> parentProgramUnitGroup [
	<generated>
	<navigation: 'ParentProgramUnit'>
	^ MooseSpecializedGroup with: self parentProgramUnit
]
