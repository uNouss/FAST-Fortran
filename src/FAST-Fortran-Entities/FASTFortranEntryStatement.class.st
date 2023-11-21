"
I represent Fortran Entry statement
"
Class {
	#name : #FASTFortranEntryStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTLabelledStatement + FASTFortranTNamedEntity',
	#classTraits : 'FASTFortranTLabelledStatement classTrait + FASTFortranTNamedEntity classTrait',
	#instVars : [
		'#entryArguments => FMMany type: #FASTFortranTEntryStatement opposite: #entryStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranEntryStatement class >> annotation [

	<FMClass: #EntryStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranEntryStatement >> addEntryArgument: anObject [
	<generated>
	^ self entryArguments add: anObject
]

{ #category : #accessing }
FASTFortranEntryStatement >> entryArguments [
	"Relation named: #entryArguments type: #FASTFortranTEntryStatement opposite: #entryStatement"

	<generated>
	<derived>
	^ entryArguments
]

{ #category : #accessing }
FASTFortranEntryStatement >> entryArguments: anObject [

	<generated>
	entryArguments value: anObject
]

{ #category : #navigation }
FASTFortranEntryStatement >> entryArgumentsGroup [
	<generated>
	<navigation: 'EntryArguments'>
	^ MooseSpecializedGroup withAll: self entryArguments asSet
]
