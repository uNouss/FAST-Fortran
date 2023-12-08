"
I represent a rule (ie. Type+letter range) in an Implicit statement
"
Class {
	#name : #FASTFortranImplicitTypingRule,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#parentImplicitStatement => FMOne type: #FASTFortranImplicitStatement opposite: #implicitTypingRule',
		'#type => FMOne type: #FASTFortranType opposite: #parentImplicitRule',
		'#implicitCharacter => FMOne type: #FASTFortranTImplicitCharacter opposite: #parentImplicitRule'
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
FASTFortranImplicitTypingRule >> implicitCharacter [
	"Relation named: #implicitCharacter type: #FASTFortranTImplicitCharacter opposite: #parentImplicitRule"

	<generated>
	^ implicitCharacter
]

{ #category : #accessing }
FASTFortranImplicitTypingRule >> implicitCharacter: anObject [

	<generated>
	implicitCharacter := anObject
]

{ #category : #navigation }
FASTFortranImplicitTypingRule >> implicitCharacterGroup [
	<generated>
	<navigation: 'ImplicitCharacter'>
	^ MooseSpecializedGroup with: self implicitCharacter
]

{ #category : #accessing }
FASTFortranImplicitTypingRule >> parentImplicitStatement [
	"Relation named: #parentImplicitStatement type: #FASTFortranImplicitStatement opposite: #implicitTypingRule"

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
