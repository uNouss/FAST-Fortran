"
I represent a rule (ie. Type+letter range) in an Implicit statement
"
Class {
	#name : #FASTFortranImplicitTypingRule,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#parentImplicitStatement => FMOne type: #FASTFortranImplicitStatement opposite: #typingRules',
		'#type => FMOne type: #FASTFortranType opposite: #parentImplicitRule',
		'#characters => FMOne type: #FASTFortranTImplicitCharacter opposite: #parentImplicitRule'
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

{ #category : #accessing }
FASTFortranImplicitTypingRule >> characters [
	"Relation named: #characters type: #FASTFortranTImplicitCharacter opposite: #parentImplicitRule"

	<generated>
	^ characters
]

{ #category : #accessing }
FASTFortranImplicitTypingRule >> characters: anObject [

	<generated>
	characters := anObject
]

{ #category : #navigation }
FASTFortranImplicitTypingRule >> charactersGroup [
	<generated>
	<navigation: 'Characters'>
	^ MooseSpecializedGroup with: self characters
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
