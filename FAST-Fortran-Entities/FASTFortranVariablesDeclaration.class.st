"
I represent a declaration statement for one or many variables
"
Class {
	#name : #FASTFortranVariablesDeclaration,
	#superclass : #FASTFortranScopableEntity,
	#instVars : [
		'#variables => FMMany type: #FASTFortranVariableExpression opposite: #parentDeclaration'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranVariablesDeclaration class >> annotation [

	<FMClass: #VariablesDeclaration super: #FASTFortranScopableEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranVariablesDeclaration >> addVariable: anObject [
	<generated>
	^ self variables add: anObject
]

{ #category : #accessing }
FASTFortranVariablesDeclaration >> variables [
	"Relation named: #variables type: #FASTFortranVariableExpression opposite: #parentDeclaration"

	<generated>
	<FMComment: 'variables'>
	<derived>
	^ variables
]

{ #category : #accessing }
FASTFortranVariablesDeclaration >> variables: anObject [

	<generated>
	variables value: anObject
]

{ #category : #navigation }
FASTFortranVariablesDeclaration >> variablesGroup [
	<generated>
	<navigation: 'Variables'>
	^ MooseSpecializedGroup withAll: self variables asSet
]
