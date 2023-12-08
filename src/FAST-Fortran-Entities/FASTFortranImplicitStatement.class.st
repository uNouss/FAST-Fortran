"
I represent Fortran Implicit statement
"
Class {
	#name : #FASTFortranImplicitStatement,
	#superclass : #FASTFortranAbstractStatement,
	#instVars : [
		'#implicitTypingRule => FMMany type: #FASTFortranImplicitTypingRule opposite: #parentImplicitStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranImplicitStatement class >> annotation [

	<FMClass: #ImplicitStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranImplicitStatement >> addImplicitTypingRule: anObject [
	<generated>
	^ self implicitTypingRule add: anObject
]

{ #category : #accessing }
FASTFortranImplicitStatement >> implicitTypingRule [
	"Relation named: #implicitTypingRule type: #FASTFortranImplicitTypingRule opposite: #parentImplicitStatement"

	<generated>
	<derived>
	^ implicitTypingRule
]

{ #category : #accessing }
FASTFortranImplicitStatement >> implicitTypingRule: anObject [

	<generated>
	implicitTypingRule value: anObject
]

{ #category : #navigation }
FASTFortranImplicitStatement >> implicitTypingRuleGroup [
	<generated>
	<navigation: 'ImplicitTypingRule'>
	^ MooseSpecializedGroup withAll: self implicitTypingRule asSet
]
