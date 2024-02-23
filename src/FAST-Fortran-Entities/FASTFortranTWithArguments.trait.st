"
I have arguments

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FASTFortranTWithArguments` | `argumentOwner` | `FASTFortranTExpression` | My arguments|



"
Trait {
	#name : #FASTFortranTWithArguments,
	#instVars : [
		'#arguments => FMMany type: #FASTFortranTExpression opposite: #argumentOwner'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTWithArguments classSide >> annotation [

	<FMClass: #TWithArguments super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranTWithArguments >> addArgument: anObject [
	<generated>
	^ self arguments add: anObject
]

{ #category : #accessing }
FASTFortranTWithArguments >> arguments [
	"Relation named: #arguments type: #FASTFortranTExpression opposite: #argumentOwner"

	<generated>
	<FMComment: 'My arguments'>
	<derived>
	^ arguments
]

{ #category : #accessing }
FASTFortranTWithArguments >> arguments: anObject [

	<generated>
	arguments value: anObject
]

{ #category : #navigation }
FASTFortranTWithArguments >> argumentsGroup [
	<generated>
	<navigation: 'Arguments'>
	^ MooseSpecializedGroup withAll: self arguments asSet
]
