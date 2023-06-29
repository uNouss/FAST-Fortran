"
I represent Fortran Write statement
"
Class {
	#name : #FASTFortranWriteStatement,
	#superclass : #FASTFortranStatement,
	#instVars : [
		'#format => FMProperty',
		'#iolist => FMMany type: #FASTFortranVariable opposite: #parentStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranWriteStatement class >> annotation [

	<FMClass: #WriteStatement super: #FASTFortranStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranWriteStatement >> addIolist: anObject [
	<generated>
	^ self iolist add: anObject
]

{ #category : #accessing }
FASTFortranWriteStatement >> format [

	<FMProperty: #format type: #String>
	<generated>
	<FMComment: 'Format identifier. '>
	^ format
]

{ #category : #accessing }
FASTFortranWriteStatement >> format: anObject [
	<generated>
	format := anObject
]

{ #category : #accessing }
FASTFortranWriteStatement >> iolist [
	"Relation named: #iolist type: #FASTFortranVariable opposite: #parentStatement"

	<generated>
	<FMComment: 'List of variables, substrings, arrays, records and more. see documentation for more details'>
	<derived>
	^ iolist
]

{ #category : #accessing }
FASTFortranWriteStatement >> iolist: anObject [

	<generated>
	iolist value: anObject
]

{ #category : #navigation }
FASTFortranWriteStatement >> iolistGroup [
	<generated>
	<navigation: 'Iolist'>
	^ MooseSpecializedGroup withAll: self iolist asSet
]
