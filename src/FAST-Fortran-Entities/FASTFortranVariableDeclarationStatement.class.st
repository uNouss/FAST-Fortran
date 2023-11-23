"
I represent a type declaration for one or many scalar variables or arrays
"
Class {
	#name : #FASTFortranVariableDeclarationStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithDeclarators',
	#classTraits : 'FASTFortranTWithDeclarators classTrait',
	#instVars : [
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
