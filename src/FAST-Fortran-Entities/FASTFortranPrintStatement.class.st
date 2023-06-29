"
I represent Fortran Print statement
"
Class {
	#name : #FASTFortranPrintStatement,
	#superclass : #FASTFortranStatement,
	#traits : 'FASTFortranTWithFormatIdentifier',
	#classTraits : 'FASTFortranTWithFormatIdentifier classTrait',
	#instVars : [
		'#iolist => FMMany type: #FASTFortranVariable opposite: #parentStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranPrintStatement class >> annotation [

	<FMClass: #PrintStatement super: #FASTFortranStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranPrintStatement >> addIolist: anObject [
	<generated>
	^ self iolist add: anObject
]

{ #category : #accessing }
FASTFortranPrintStatement >> iolist [
	"Relation named: #iolist type: #FASTFortranVariable opposite: #parentStatement"

	<generated>
	<FMComment: 'List of variables, substrings, arrays, records and more. see documentation for more details'>
	<derived>
	^ iolist
]

{ #category : #accessing }
FASTFortranPrintStatement >> iolist: anObject [

	<generated>
	iolist value: anObject
]

{ #category : #navigation }
FASTFortranPrintStatement >> iolistGroup [
	<generated>
	<navigation: 'Iolist'>
	^ MooseSpecializedGroup withAll: self iolist asSet
]
