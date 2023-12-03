"
I represent a Fortran Equivalence statement
"
Class {
	#name : #FASTFortranEquivalenceStatement,
	#superclass : #FASTFortranAbstractStatement,
	#instVars : [
		'#equivalenceGroup => FMMany type: #FASTFortranEquivalenceGroup opposite: #parentEquivalenceStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranEquivalenceStatement class >> annotation [

	<FMClass: #EquivalenceStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranEquivalenceStatement >> addEquivalenceGroup: anObject [
	<generated>
	^ self equivalenceGroup add: anObject
]

{ #category : #accessing }
FASTFortranEquivalenceStatement >> equivalenceGroup [
	"Relation named: #equivalenceGroup type: #FASTFortranEquivalenceGroup opposite: #parentEquivalenceStatement"

	<generated>
	<derived>
	^ equivalenceGroup
]

{ #category : #accessing }
FASTFortranEquivalenceStatement >> equivalenceGroup: anObject [

	<generated>
	equivalenceGroup value: anObject
]

{ #category : #navigation }
FASTFortranEquivalenceStatement >> equivalenceGroupGroup [
	<generated>
	<navigation: 'EquivalenceGroup'>
	^ MooseSpecializedGroup withAll: self equivalenceGroup asSet
]
