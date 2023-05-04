"
A fortran program unit is a sequence of statements, terminated by an END statement. Every program unit is either a main program or a subprogram. If a program is to be executable, it must have a main program
"
Class {
	#name : #FASTFortranProgramUnit,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#name => FMProperty',
		'#statements => FMMany type: #FASTFortranScopableEntity opposite: #parentProgramUnit'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranProgramUnit class >> annotation [

	<FMClass: #ProgramUnit super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranProgramUnit >> addStatement: anObject [
	<generated>
	^ self statements add: anObject
]

{ #category : #accessing }
FASTFortranProgramUnit >> name [

	<FMProperty: #name type: #String>
	<generated>
	<FMComment: 'Symbolic name of a program unit'>
	^ name
]

{ #category : #accessing }
FASTFortranProgramUnit >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
FASTFortranProgramUnit >> statements [
	"Relation named: #statements type: #FASTFortranScopableEntity opposite: #parentProgramUnit"

	<generated>
	<FMComment: 'Statements of the program unit '>
	<derived>
	^ statements
]

{ #category : #accessing }
FASTFortranProgramUnit >> statements: anObject [

	<generated>
	statements value: anObject
]

{ #category : #navigation }
FASTFortranProgramUnit >> statementsGroup [
	<generated>
	<navigation: 'Statements'>
	^ MooseSpecializedGroup withAll: self statements asSet
]
