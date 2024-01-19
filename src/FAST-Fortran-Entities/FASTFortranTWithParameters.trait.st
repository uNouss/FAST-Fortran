"
I have parameters

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
| `parameters` | `FASTFortranTWithParameters` | `parameterOwner` | `FASTFortranTVariableEntity` | My parameters|



"
Trait {
	#name : #FASTFortranTWithParameters,
	#instVars : [
		'#parameters => FMMany type: #FASTFortranTVariableEntity opposite: #parameterOwner'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTWithParameters classSide >> annotation [

	<FMClass: #TWithParameters super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranTWithParameters >> addParameter: anObject [
	<generated>
	^ self parameters add: anObject
]

{ #category : #accessing }
FASTFortranTWithParameters >> parameters [
	"Relation named: #parameters type: #FASTFortranTVariableEntity opposite: #parameterOwner"

	<generated>
	<FMComment: 'My parameters'>
	<derived>
	^ parameters
]

{ #category : #accessing }
FASTFortranTWithParameters >> parameters: anObject [

	<generated>
	parameters value: anObject
]

{ #category : #navigation }
FASTFortranTWithParameters >> parametersGroup [
	<generated>
	<navigation: 'Parameters'>
	^ MooseSpecializedGroup withAll: self parameters asSet
]
