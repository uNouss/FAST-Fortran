"
I represent a declaration statement for one or many variables
"
Class {
	#name : #FASTFortranDeclarationStatement,
	#superclass : #FASTFortranScopableEntity,
	#instVars : [
		'#attributes => FMMany type: #FASTFortranVariableExpression opposite: #parentDeclaration',
		'#declarators => FMMany type: #FASTFortranVariableExpression opposite: #parentDeclaration',
		'#type => FMOne type: #FASTFortranVariableExpression opposite: #parentDeclaration'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranDeclarationStatement class >> annotation [

	<FMClass: #DeclarationStatement super: #FASTFortranScopableEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranDeclarationStatement >> addAttribute: anObject [
	<generated>
	^ self attributes add: anObject
]

{ #category : #adding }
FASTFortranDeclarationStatement >> addDeclarator: anObject [
	<generated>
	^ self declarators add: anObject
]

{ #category : #accessing }
FASTFortranDeclarationStatement >> attributes [
	"Relation named: #attributes type: #FASTFortranVariableExpression opposite: #parentDeclaration"

	<generated>
	<FMComment: 'attributes'>
	<derived>
	^ attributes
]

{ #category : #accessing }
FASTFortranDeclarationStatement >> attributes: anObject [

	<generated>
	attributes value: anObject
]

{ #category : #navigation }
FASTFortranDeclarationStatement >> attributesGroup [
	<generated>
	<navigation: 'Attributes'>
	^ MooseSpecializedGroup withAll: self attributes asSet
]

{ #category : #accessing }
FASTFortranDeclarationStatement >> declarators [
	"Relation named: #declarators type: #FASTFortranVariableExpression opposite: #parentDeclaration"

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
	"Relation named: #type type: #FASTFortranVariableExpression opposite: #parentDeclaration"

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
