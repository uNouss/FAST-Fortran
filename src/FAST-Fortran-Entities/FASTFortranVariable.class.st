"
an abstract Fortran Variable, could be an array or a scalar

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
| `entryStatement` | `FASTFortranTEntryStatement` | `entryArguments` | `FASTFortranEntryStatement` | |
| `parameterOwner` | `FASTFortranTVariableEntity` | `parameters` | `FASTFortranTWithParameters` | parameterOwner|
| `parentFormatedStatement` | `FASTFortranTFormat` | `format` | `FASTFortranTWithFormat` | A format description in a Format/Print/Read/Write statement|
| `parentIOStatement` | `FASTFortranTIOParameter` | `ioParameters` | `FASTFortranTWithIOParameters` | |
| `parentImpliedExpression` | `FASTFortranTVariableEntity` | `variables` | `FASTFortranImpliedDoExpression` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
| `invokedIn` | `FASTFortranTNamedEntity` | `invoked` | `FASTFortranTInvocation` | Optional invocation where this name is used|
| `parentAssignmentExpression` | `FASTFortranTVariableEntity` | `variable` | `FASTFortranTAssignment` | Optional assignment to the variable|
| `parentVariableGroup` | `FASTFortranVariable` | `variables` | `FASTFortranTVariableGroup` | |


## Properties
======================

| Name | Type | Default value | Comment |
| `endPos` | `Number` | nil | |
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | Determines the variable name|
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranVariable,
	#superclass : #FASTFortranAbstractExpression,
	#traits : 'FASTFortranTEntryStatement + FASTFortranTFormat + FASTFortranTVariableEntity',
	#classTraits : 'FASTFortranTEntryStatement classTrait + FASTFortranTFormat classTrait + FASTFortranTVariableEntity classTrait',
	#instVars : [
		'#name => FMProperty',
		'#parentVariableGroup => FMOne type: #FASTFortranTVariableGroup opposite: #variables'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranVariable class >> annotation [

	<FMClass: #Variable super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranVariable >> name [

	<FMProperty: #name type: #String>
	<generated>
	<FMComment: 'Determines the variable name'>
	^ name
]

{ #category : #accessing }
FASTFortranVariable >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
FASTFortranVariable >> parentVariableGroup [
	"Relation named: #parentVariableGroup type: #FASTFortranTVariableGroup opposite: #variables"

	<generated>
	^ parentVariableGroup
]

{ #category : #accessing }
FASTFortranVariable >> parentVariableGroup: anObject [

	<generated>
	parentVariableGroup := anObject
]
