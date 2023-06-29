"
A fortran program unit is a sequence of statements, terminated by an END statement. Every program unit is either a main program or a subprogram. If a program is to be executable, it must have a main program
"
Class {
	#name : #FASTFortranProgramUnit,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTEntity + FASTFortranTNamedBehaviouralEntity',
	#classTraits : 'FASTFortranTEntity classTrait + FASTFortranTNamedBehaviouralEntity classTrait',
	#instVars : [
		'#parentProgramFile => FMOne type: #FASTFortranProgramFile opposite: #programUnit'
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

{ #category : #accessing }
FASTFortranProgramUnit >> parentProgramFile [
	"Relation named: #parentProgramFile type: #FASTFortranProgramFile opposite: #programUnit"

	<generated>
	<FMComment: 'Parent program file'>
	<container>
	^ parentProgramFile
]

{ #category : #accessing }
FASTFortranProgramUnit >> parentProgramFile: anObject [

	<generated>
	parentProgramFile := anObject
]

{ #category : #navigation }
FASTFortranProgramUnit >> parentProgramFileGroup [
	<generated>
	<navigation: 'ParentProgramFile'>
	^ MooseSpecializedGroup with: self parentProgramFile
]
