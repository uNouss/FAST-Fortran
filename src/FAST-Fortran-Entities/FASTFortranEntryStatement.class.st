"
I represent Fortran Entry statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
| `entryArguments` | `FASTFortranEntryStatement` | `entryStatement` | `FASTFortranTEntryStatement` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
| `invokedIn` | `FASTFortranTNamedEntity` | `invoked` | `FASTFortranTInvocation` | Optional invocation where this name is used|


## Properties
======================

| Name | Type | Default value | Comment |
| `endPos` | `Number` | nil | |
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranEntryStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTNamedEntity',
	#classTraits : 'FASTFortranTNamedEntity classTrait',
	#instVars : [
		'#entryArguments => FMMany type: #FASTFortranTEntryStatement opposite: #entryStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranEntryStatement class >> annotation [

	<FMClass: #EntryStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranEntryStatement >> addEntryArgument: anObject [
	<generated>
	^ self entryArguments add: anObject
]

{ #category : #accessing }
FASTFortranEntryStatement >> entryArguments [
	"Relation named: #entryArguments type: #FASTFortranTEntryStatement opposite: #entryStatement"

	<generated>
	<derived>
	^ entryArguments
]

{ #category : #accessing }
FASTFortranEntryStatement >> entryArguments: anObject [

	<generated>
	entryArguments value: anObject
]

{ #category : #navigation }
FASTFortranEntryStatement >> entryArgumentsGroup [
	<generated>
	<navigation: 'EntryArguments'>
	^ MooseSpecializedGroup withAll: self entryArguments asSet
]
