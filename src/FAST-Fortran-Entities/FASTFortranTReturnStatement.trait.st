"
A return statement node. Contains a reference to the expression which is returned.  

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
| `parentIfStatement` | `FASTFortranTStatement` | `statement` | `FASTFortranIfLogicalStatement` | Parent if statement|
| `statementContainer` | `FASTFortranTStatement` | `statements` | `FASTFortranTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
| `expression` | `FASTFortranTReturnStatement` | `returnOwner` | `FASTFortranTExpression` | The expression returned|


## Properties
======================

| Name | Type | Default value | Comment |
| `endPos` | `Number` | nil | |
| `endPos` | `Number` | nil | |
| `label` | `String` | nil | Determines the statement label which consists of 1 to 5 digits, with at least one nonzero|
| `startPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : #FASTFortranTReturnStatement,
	#instVars : [
		'#expression => FMOne type: #FASTFortranTExpression opposite: #returnOwner'
	],
	#traits : 'FASTFortranTStatement',
	#classTraits : 'FASTFortranTStatement classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTReturnStatement classSide >> annotation [

	<FMClass: #TReturnStatement super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTReturnStatement >> expression [
	"Relation named: #expression type: #FASTFortranTExpression opposite: #returnOwner"

	<generated>
	<FMComment: 'The expression returned'>
	^ expression
]

{ #category : #accessing }
FASTFortranTReturnStatement >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTFortranTReturnStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
