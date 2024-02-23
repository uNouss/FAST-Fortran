"
A Entity with an optional scope

Some statements are scopable because they allow to introduce local variables (e.g. for statement in Java)

## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : #FASTFortranTScopableEntity,
	#traits : 'FASTFortranTEntity',
	#classTraits : 'FASTFortranTEntity classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTScopableEntity classSide >> annotation [

	<FMClass: #TScopableEntity super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
