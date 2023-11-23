"
I represent a type declaration for one or many scalar variables or arrays
"
Class {
	#name : #FASTFortranDeclarationStatement,
	#superclass : #FASTFortranAbstractStatement,
	#instVars : [
		'#declarators => FMMany type: #FASTFortranVariable opposite: #parentDeclaration',
		'#type => FMOne type: #FASTFortranType opposite: #parentDeclaration'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranDeclarationStatement class >> annotation [

	<FMClass: #DeclarationStatement super: #FASTFortranAbstractStatement>
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
