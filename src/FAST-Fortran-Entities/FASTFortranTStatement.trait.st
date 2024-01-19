"
An abstract subclass which represents a source code statemnet 

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
| `parentIfStatement` | `FASTFortranTStatement` | `statement` | `FASTFortranIfLogicalStatement` | Parent if statement|
| `statementContainer` | `FASTFortranTStatement` | `statements` | `FASTFortranTStatementBlock` | Block containing this statement.|


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
	#name : #FASTFortranTStatement,
	#instVars : [
		'#label => FMProperty',
		'#parentIfStatement => FMOne type: #FASTFortranIfLogicalStatement opposite: #statement',
		'#statementContainer => FMOne type: #FASTFortranTStatementBlock opposite: #statements'
	],
	#traits : 'FASTFortranTEntity',
	#classTraits : 'FASTFortranTEntity classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTStatement classSide >> annotation [

	<FMClass: #TStatement super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #testing }
FASTFortranTStatement >> isStatement [

	<generated>
	^ true
]

{ #category : #accessing }
FASTFortranTStatement >> label [

	<FMProperty: #label type: #String>
	<generated>
	<FMComment: 'Determines the statement label which consists of 1 to 5 digits, with at least one nonzero'>
	^ label
]

{ #category : #accessing }
FASTFortranTStatement >> label: anObject [
	<generated>
	label := anObject
]

{ #category : #accessing }
FASTFortranTStatement >> parentIfStatement [
	"Relation named: #parentIfStatement type: #FASTFortranIfLogicalStatement opposite: #statement"

	<generated>
	<FMComment: 'Parent if statement'>
	<container>
	<derived>
	^ parentIfStatement
]

{ #category : #accessing }
FASTFortranTStatement >> parentIfStatement: anObject [

	<generated>
	parentIfStatement := anObject
]

{ #category : #navigation }
FASTFortranTStatement >> parentIfStatementGroup [
	<generated>
	<navigation: 'ParentIfStatement'>
	^ MooseSpecializedGroup with: self parentIfStatement
]

{ #category : #accessing }
FASTFortranTStatement >> statementContainer [
	"Relation named: #statementContainer type: #FASTFortranTStatementBlock opposite: #statements"

	<generated>
	<FMComment: 'Block containing this statement.'>
	<container>
	^ statementContainer
]

{ #category : #accessing }
FASTFortranTStatement >> statementContainer: anObject [

	<generated>
	statementContainer := anObject
]

{ #category : #navigation }
FASTFortranTStatement >> statementContainerGroup [
	<generated>
	<navigation: 'StatementContainer'>
	^ MooseSpecializedGroup with: self statementContainer
]
