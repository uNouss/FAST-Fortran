"
I represent a rule (ie. Type+letter range) in an Implicit statement
"
Class {
	#name : #FASTFortranImplicitTypingRule,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#characters => FMMany type: #FASTFortranTImplicitCharacter opposite: #parentImplicitRule',
		'#parentImplicitStatement => FMOne type: #FASTFortranImplicitStatement opposite: #typingRules',
		'#type => FMOne type: #FASTFortranType opposite: #parentImplicitRule'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranImplicitTypingRule class >> annotation [

	<FMClass: #ImplicitTypingRule super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranImplicitTypingRule >> addCharacter: anObject [
	<generated>
	^ self characters add: anObject
]

{ #category : #accessing }
FASTFortranImplicitTypingRule >> characters [
	"Relation named: #characters type: #FASTFortranTImplicitCharacter opposite: #parentImplicitRule"

	<generated>
	<derived>
	^ characters
]

{ #category : #accessing }
FASTFortranImplicitTypingRule >> characters: anObject [

	<generated>
	characters value: anObject
]

{ #category : #navigation }
FASTFortranImplicitTypingRule >> charactersGroup [
	<generated>
	<navigation: 'Characters'>
	^ MooseSpecializedGroup withAll: self characters asSet
]

{ #category : #accessing }
FASTFortranImplicitTypingRule >> parentImplicitStatement [
	"Relation named: #parentImplicitStatement type: #FASTFortranImplicitStatement opposite: #typingRules"

	<generated>
	<container>
	^ parentImplicitStatement
]

{ #category : #accessing }
FASTFortranImplicitTypingRule >> parentImplicitStatement: anObject [

	<generated>
	parentImplicitStatement := anObject
]

{ #category : #navigation }
FASTFortranImplicitTypingRule >> parentImplicitStatementGroup [
	<generated>
	<navigation: 'ParentImplicitStatement'>
	^ MooseSpecializedGroup with: self parentImplicitStatement
]

{ #category : #accessing }
FASTFortranImplicitTypingRule >> type [
	"Relation named: #type type: #FASTFortranType opposite: #parentImplicitRule"

	<generated>
	^ type
]

{ #category : #accessing }
FASTFortranImplicitTypingRule >> type: anObject [

	<generated>
	type := anObject
]

{ #category : #navigation }
FASTFortranImplicitTypingRule >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseSpecializedGroup with: self type
]
