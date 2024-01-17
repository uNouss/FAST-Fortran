"
I represent Fortran Implicit statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
| `typingRules` | `FASTFortranImplicitStatement` | `parentImplicitStatement` | `FASTFortranImplicitTypingRule` | |



"
Class {
	#name : #FASTFortranImplicitStatement,
	#superclass : #FASTFortranAbstractStatement,
	#instVars : [
		'#typingRules => FMMany type: #FASTFortranImplicitTypingRule opposite: #parentImplicitStatement'
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
FASTFortranImplicitStatement >> addTypingRule: anObject [
	<generated>
	^ self typingRules add: anObject
]

{ #category : #accessing }
FASTFortranImplicitStatement >> typingRules [
	"Relation named: #typingRules type: #FASTFortranImplicitTypingRule opposite: #parentImplicitStatement"

	<generated>
	<derived>
	^ typingRules
]

{ #category : #accessing }
FASTFortranImplicitStatement >> typingRules: anObject [

	<generated>
	typingRules value: anObject
]

{ #category : #navigation }
FASTFortranImplicitStatement >> typingRulesGroup [
	<generated>
	<navigation: 'TypingRules'>
	^ MooseSpecializedGroup withAll: self typingRules asSet
]
