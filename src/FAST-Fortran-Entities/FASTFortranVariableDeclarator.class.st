"
Part of a variable declaration: name of the variable + optional initial value

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
| `parentDeclaration` | `FASTFortranTVariableDeclarator` | `declarators` | `FASTFortranTWithDeclarators` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
| `dimensions` | `FASTFortranVariableDeclarator` | `parentVariableDeclarator` | `FASTFortranArrayRange` | Possible dimensions in case this is an array declaration|
| `expression` | `FASTFortranTVariableDeclarator` | `variableDeclaratorOwner` | `FASTFortranTExpression` | Expression assigned to the variable declared|


## Properties
======================

| Name | Type | Default value | Comment |
| `variable` | `String` | nil | The name of the variable being declared|

"
Class {
	#name : #FASTFortranVariableDeclarator,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTVariableDeclarator',
	#classTraits : 'FASTFortranTVariableDeclarator classTrait',
	#instVars : [
		'#dimensions => FMMany type: #FASTFortranArrayRange opposite: #parentVariableDeclarator'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranVariableDeclarator class >> annotation [

	<FMClass: #VariableDeclarator super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranVariableDeclarator >> addDimension: anObject [
	<generated>
	^ self dimensions add: anObject
]

{ #category : #accessing }
FASTFortranVariableDeclarator >> dimensions [
	"Relation named: #dimensions type: #FASTFortranArrayRange opposite: #parentVariableDeclarator"

	<generated>
	<FMComment: 'Possible dimensions in case this is an array declaration'>
	<derived>
	^ dimensions
]

{ #category : #accessing }
FASTFortranVariableDeclarator >> dimensions: anObject [

	<generated>
	dimensions value: anObject
]

{ #category : #navigation }
FASTFortranVariableDeclarator >> dimensionsGroup [
	<generated>
	<navigation: 'Dimensions'>
	^ MooseSpecializedGroup withAll: self dimensions asSet
]
