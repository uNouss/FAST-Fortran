"
I represent a group of variables in an Equivalence statement
"
Class {
	#name : #FASTFortranEquivalenceGroup,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#parentEquivalenceStatement => FMOne type: #FASTFortranEquivalenceStatement opposite: #equivalenceGroup',
		'#variables => FMMany type: #FASTFortranTVariableExpression opposite: #parentEquivalenceGroup'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranEquivalenceGroup class >> annotation [

	<FMClass: #EquivalenceGroup super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranEquivalenceGroup >> addVariable: anObject [
	<generated>
	^ self variables add: anObject
]

{ #category : #accessing }
FASTFortranEquivalenceGroup >> parentEquivalenceStatement [
	"Relation named: #parentEquivalenceStatement type: #FASTFortranEquivalenceStatement opposite: #equivalenceGroup"

	<generated>
	<container>
	^ parentEquivalenceStatement
]

{ #category : #accessing }
FASTFortranEquivalenceGroup >> parentEquivalenceStatement: anObject [

	<generated>
	parentEquivalenceStatement := anObject
]

{ #category : #navigation }
FASTFortranEquivalenceGroup >> parentEquivalenceStatementGroup [
	<generated>
	<navigation: 'ParentEquivalenceStatement'>
	^ MooseSpecializedGroup with: self parentEquivalenceStatement
]

{ #category : #accessing }
FASTFortranEquivalenceGroup >> variables [
	"Relation named: #variables type: #FASTFortranTVariableExpression opposite: #parentEquivalenceGroup"

	<generated>
	<derived>
	^ variables
]

{ #category : #accessing }
FASTFortranEquivalenceGroup >> variables: anObject [

	<generated>
	variables value: anObject
]

{ #category : #navigation }
FASTFortranEquivalenceGroup >> variablesGroup [
	<generated>
	<navigation: 'Variables'>
	^ MooseSpecializedGroup withAll: self variables asSet
]
