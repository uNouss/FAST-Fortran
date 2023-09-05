"
I represent a declaration statement for one or many variables
"
Class {
	#name : #FASTFortranDeclarationStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTLabelledStatement',
	#classTraits : 'FASTFortranTLabelledStatement classTrait',
	#instVars : [
		'#declarators => FMMany type: #FASTFortranVariable opposite: #parentDeclaration',
		'#type => FMOne type: #FASTFortranType opposite: #parentDeclaration'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranDeclarationStatement class >> annotation [

	<FMClass: #DeclarationStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranDeclarationStatement >> addDeclarator: anObject [
	<generated>
	^ self declarators add: anObject
]

{ #category : #accessing }
FASTFortranDeclarationStatement >> declarators [
	"Relation named: #declarators type: #FASTFortranVariable opposite: #parentDeclaration"

	<generated>
	<FMComment: 'declarators'>
	<derived>
	^ declarators
]

{ #category : #accessing }
FASTFortranDeclarationStatement >> declarators: anObject [

	<generated>
	declarators value: anObject
]

{ #category : #navigation }
FASTFortranDeclarationStatement >> declaratorsGroup [
	<generated>
	<navigation: 'Declarators'>
	^ MooseSpecializedGroup withAll: self declarators asSet
]

{ #category : #accessing }
FASTFortranDeclarationStatement >> type [
	"Relation named: #type type: #FASTFortranType opposite: #parentDeclaration"

	<generated>
	<FMComment: 'type'>
	^ type
]

{ #category : #accessing }
FASTFortranDeclarationStatement >> type: anObject [

	<generated>
	type := anObject
]

{ #category : #navigation }
FASTFortranDeclarationStatement >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseSpecializedGroup with: self type
]
