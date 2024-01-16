"
@FLAG: May be could be removed to have a simpler core model.
Each language would have to implement it correctly then

A behavioural entity that can be referenced with a name.

Assumed to correspond to a function or a method

## Relations
======================

### Children
- Relation: #parameters Type: #FASTFortranTVariableEntity Opposite: #parameterOwner Comment: My parameters
- Relation: #statementBlock Type: #FASTFortranTStatementBlock Opposite: #fastBehaviouralParent Comment: Statements block of the behavioural entity
### Other
- Relation: #invokedIn Type: #FASTFortranTInvocation Opposite: #invoked Comment: Optional invocation where this name is used

## Properties
======================

- Named: #endPos Type: Number
- Named: #endPos Type: Number
- Named: #name Type: String
- Named: #startPos Type: Number
- Named: #startPos Type: Number

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
