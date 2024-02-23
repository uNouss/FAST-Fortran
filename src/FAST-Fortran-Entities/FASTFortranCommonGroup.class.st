"
I represent Common group inside a Common statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentCommonStatement` | `FASTFortranCommonGroup` | `groups` | `FASTFortranCommonStatement` | Parent common statement I belong to|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declarators` | `FASTFortranTWithDeclarators` | `parentDeclaration` | `FASTFortranTVariableDeclarator` | variables declared|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTFortranTNamedEntity` | `invoked` | `FASTFortranTInvocation` | Optional invocation where this name is used|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranCommonGroup,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTNamedEntity + FASTFortranTWithDeclarators',
	#classTraits : 'FASTFortranTNamedEntity classTrait + FASTFortranTWithDeclarators classTrait',
	#instVars : [
		'#parentCommonStatement => FMOne type: #FASTFortranCommonStatement opposite: #groups'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranCommonGroup class >> annotation [

	<FMClass: #CommonGroup super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranCommonGroup >> parentCommonStatement [
	"Relation named: #parentCommonStatement type: #FASTFortranCommonStatement opposite: #groups"

	<generated>
	<FMComment: 'Parent common statement I belong to'>
	<container>
	^ parentCommonStatement
]

{ #category : #accessing }
FASTFortranCommonGroup >> parentCommonStatement: anObject [

	<generated>
	parentCommonStatement := anObject
]

{ #category : #navigation }
FASTFortranCommonGroup >> parentCommonStatementGroup [
	<generated>
	<navigation: 'ParentCommonStatement'>
	^ MooseSpecializedGroup with: self parentCommonStatement
]
