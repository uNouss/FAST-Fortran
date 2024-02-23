"
@FLAG: May be could be removed to have a simpler core model.
Each language would have to implement it correctly then

A behavioural entity that can be referenced with a name.

Assumed to correspond to a function or a method

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parameters` | `FASTFortranTWithParameters` | `parameterOwner` | `FASTFortranTVariableEntity` | My parameters|
| `statementBlock` | `FASTFortranTBehaviouralEntity` | `fastBehaviouralParent` | `FASTFortranTStatementBlock` | Statements block of the behavioural entity|

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
Trait {
	#name : #FASTFortranTNamedBehaviouralEntity,
	#traits : 'FASTFortranTBehaviouralEntity + FASTFortranTNamedEntity',
	#classTraits : 'FASTFortranTBehaviouralEntity classTrait + FASTFortranTNamedEntity classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTNamedBehaviouralEntity classSide >> annotation [

	<FMClass: #TNamedBehaviouralEntity super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
