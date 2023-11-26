"
I represent Common group inside a Common statement
"
Class {
	#name : #FASTFortranCommonGroup,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#name => FMProperty',
		'#variables => FMMany type: #FASTFortranVariableDeclarator opposite: #parentCommonGroup',
		'#parentCommonStatement => FMOne type: #FASTFortranCommonStatement opposite: #groups'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranCommonGroup class >> annotation [

	<FMClass: #CommonGroup super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranCommonGroup >> addVariable: anObject [
	<generated>
	^ self variables add: anObject
]

{ #category : #accessing }
FASTFortranCommonGroup >> name [

	<FMProperty: #name type: #String>
	<generated>
	<FMComment: 'The name of this Common group, might be ommited'>
	^ name
]

{ #category : #accessing }
FASTFortranCommonGroup >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
FASTFortranCommonGroup >> parentCommonStatement [
	"Relation named: #parentCommonStatement type: #FASTFortranCommonStatement opposite: #groups"

	<generated>
	<FMComment: 'Parent common statement I belong to'>
	<container>
	^ parentCommonStatement
]

{ #category : #accessing }
FASTFortranCommonGroup >> parentCommonStatement: anObject [

	<generated>
	parentCommonStatement := anObject
]

{ #category : #navigation }
FASTFortranCommonGroup >> parentCommonStatementGroup [
	<generated>
	<navigation: 'ParentCommonStatement'>
	^ MooseSpecializedGroup with: self parentCommonStatement
]

{ #category : #accessing }
FASTFortranCommonGroup >> variables [
	"Relation named: #variables type: #FASTFortranVariableDeclarator opposite: #parentCommonGroup"

	<generated>
	<FMComment: 'List of variable name in this commonGroup'>
	<derived>
	^ variables
]

{ #category : #accessing }
FASTFortranCommonGroup >> variables: anObject [

	<generated>
	variables value: anObject
]

{ #category : #navigation }
FASTFortranCommonGroup >> variablesGroup [
	<generated>
	<navigation: 'Variables'>
	^ MooseSpecializedGroup withAll: self variables asSet
]
