"
A fortran comment
"
Class {
	#name : #FASTFortranComment,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#content => FMProperty',
		'#parentProgramFile => FMOne type: #FASTFortranProgramFile opposite: #comment'
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

{ #category : #accessing }
FASTFortranComment >> parentProgramFile [
	"Relation named: #parentProgramFile type: #FASTFortranProgramFile opposite: #comment"

	<generated>
	<FMComment: 'Parent program file'>
	<container>
	^ parentProgramFile
]

{ #category : #accessing }
FASTFortranComment >> parentProgramFile: anObject [

	<generated>
	parentProgramFile := anObject
]

{ #category : #navigation }
FASTFortranComment >> parentProgramFileGroup [
	<generated>
	<navigation: 'ParentProgramFile'>
	^ MooseSpecializedGroup with: self parentProgramFile
]
