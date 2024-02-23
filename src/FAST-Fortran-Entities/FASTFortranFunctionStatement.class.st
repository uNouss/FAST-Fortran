"
I represent a function statement - a function-like declaration, made in a single statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FASTFortranTWithArguments` | `argumentOwner` | `FASTFortranTExpression` | My arguments|
| `expression` | `FASTFortranFunctionStatement` | `assignementExpressionOwner` | `FASTFortranTExpression` | Expression thats being assigned upon declaration to the var|

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
	#name : #FASTFortranFunctionStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTNamedEntity + FASTFortranTWithArguments',
	#classTraits : 'FASTFortranTNamedEntity classTrait + FASTFortranTWithArguments classTrait',
	#instVars : [
		'#expression => FMOne type: #FASTFortranTExpression opposite: #assignementExpressionOwner'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranFunctionStatement class >> annotation [

	<FMClass: #FunctionStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranFunctionStatement >> expression [
	"Relation named: #expression type: #FASTFortranTExpression opposite: #assignementExpressionOwner"

	<generated>
	<FMComment: 'Expression thats being assigned upon declaration to the var'>
	^ expression
]

{ #category : #accessing }
FASTFortranFunctionStatement >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTFortranFunctionStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
