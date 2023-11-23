"
I represent Fortran Common statement
"
Class {
	#name : #FASTFortranCommonStatement,
	#superclass : #FASTFortranAbstractStatement,
	#instVars : [
		'#name => FMProperty',
		'#variables => FMOne type: #FASTFortranVariable opposite: #parentCommonStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranCommonStatement class >> annotation [

	<FMClass: #CommonStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranCommonStatement >> name [

	<FMProperty: #name type: #String>
	<generated>
	<FMComment: 'Determines a Common block name, might be ommited'>
	^ name
]

{ #category : #accessing }
FASTFortranCommonStatement >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
FASTFortranCommonStatement >> variables [
	"Relation named: #variables type: #FASTFortranVariable opposite: #parentCommonStatement"

	<generated>
	<FMComment: 'List of variable names, array names, and array declarators '>
	^ variables
]

{ #category : #accessing }
FASTFortranCommonStatement >> variables: anObject [

	<generated>
	variables := anObject
]

{ #category : #navigation }
FASTFortranCommonStatement >> variablesGroup [
	<generated>
	<navigation: 'Variables'>
	^ MooseSpecializedGroup with: self variables
]
