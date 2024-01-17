"
I represent Common group inside a Common statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
| `parentCommonStatement` | `FASTFortranCommonGroup` | `groups` | `FASTFortranCommonStatement` | Parent common statement I belong to|

### Children
| Relation | Origin | Opposite | Type | Comment |
| `declarators` | `FASTFortranTWithDeclarators` | `parentDeclaration` | `FASTFortranTVariableDeclarator` | variables declared|


## Properties
======================

| Name | Type | Default value | Comment |
| `name` | `String` | nil | The name of this Common group, might be ommited|

"
Class {
	#name : #FASTFortranCommonGroup,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTWithDeclarators',
	#classTraits : 'FASTFortranTWithDeclarators classTrait',
	#instVars : [
		'#name => FMProperty',
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
FASTFortranCommonGroup >> name [

	<FMProperty: #name type: #String>
	<generated>
	<FMComment: 'The name of this Common group, might be ommited'>
	^ name
]

{ #category : #accessing }
FASTFortranCommonGroup >> name: anObject [
	<generated>
	name := anObject
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
