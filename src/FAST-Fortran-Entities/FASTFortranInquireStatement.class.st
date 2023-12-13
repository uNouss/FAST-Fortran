"
I represent Fortran Inquire statement
"
Class {
	#name : #FASTFortranInquireStatement,
	#superclass : #FASTFortranAbstractStatement,
	#instVars : [
		'#specifiers => FMMany type: #FASTFortranTInquireSpecifier opposite: #parentInquireStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranInquireStatement class >> annotation [

	<FMClass: #InquireStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranInquireStatement >> addSpecifier: anObject [
	<generated>
	^ self specifiers add: anObject
]

{ #category : #accessing }
FASTFortranInquireStatement >> specifiers [
	"Relation named: #specifiers type: #FASTFortranTInquireSpecifier opposite: #parentInquireStatement"

	<generated>
	<derived>
	^ specifiers
]

{ #category : #accessing }
FASTFortranInquireStatement >> specifiers: anObject [

	<generated>
	specifiers value: anObject
]

{ #category : #navigation }
FASTFortranInquireStatement >> specifiersGroup [
	<generated>
	<navigation: 'Specifiers'>
	^ MooseSpecializedGroup withAll: self specifiers asSet
]
