"
I represent a Fortran Data statement
"
Class {
	#name : #FASTFortranDataStatement,
	#superclass : #FASTFortranAbstractStatement,
	#instVars : [
		'#dataGroups => FMMany type: #FASTFortranDataGroup opposite: #dataStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranDataStatement class >> annotation [

	<FMClass: #DataStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranDataStatement >> addDataGroup: anObject [
	<generated>
	^ self dataGroups add: anObject
]

{ #category : #accessing }
FASTFortranDataStatement >> dataGroups [
	"Relation named: #dataGroups type: #FASTFortranDataGroup opposite: #dataStatement"

	<generated>
	<derived>
	^ dataGroups
]

{ #category : #accessing }
FASTFortranDataStatement >> dataGroups: anObject [

	<generated>
	dataGroups value: anObject
]

{ #category : #navigation }
FASTFortranDataStatement >> dataGroupsGroup [
	<generated>
	<navigation: 'DataGroups'>
	^ MooseSpecializedGroup withAll: self dataGroups asSet
]
