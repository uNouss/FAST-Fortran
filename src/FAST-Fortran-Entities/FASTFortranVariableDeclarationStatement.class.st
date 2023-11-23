"
I represent a type declaration for one or many scalar variables or arrays
"
Class {
	#name : #FASTFortranVariableDeclarationStatement,
	#superclass : #FASTFortranAbstractStatement,
	#instVars : [
		'#declarators => FMMany type: #FASTFortranVariable opposite: #parentDeclaration',
		'#type => FMOne type: #FASTFortranType opposite: #parentDeclaration'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranVariableDeclarationStatement class >> annotation [

	<FMClass: #VariableDeclarationStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranVariableDeclarationStatement >> addDeclarator: anObject [
	<generated>
	^ self declarators add: anObject
]

{ #category : #accessing }
FASTFortranVariableDeclarationStatement >> declarators [
	"Relation named: #declarators type: #FASTFortranVariable opposite: #parentDeclaration"

	<generated>
	<FMComment: 'declarators'>
	<derived>
	^ declarators
]

{ #category : #accessing }
FASTFortranVariableDeclarationStatement >> declarators: anObject [

	<generated>
	declarators value: anObject
]

{ #category : #navigation }
FASTFortranVariableDeclarationStatement >> declaratorsGroup [
	<generated>
	<navigation: 'Declarators'>
	^ MooseSpecializedGroup withAll: self declarators asSet
]

{ #category : #accessing }
FASTFortranVariableDeclarationStatement >> type [
	"Relation named: #type type: #FASTFortranType opposite: #parentDeclaration"

	<generated>
	<FMComment: 'type'>
	^ type
]

{ #category : #accessing }
FASTFortranVariableDeclarationStatement >> type: anObject [

	<generated>
	type := anObject
]

{ #category : #navigation }
FASTFortranVariableDeclarationStatement >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseSpecializedGroup with: self type
]
