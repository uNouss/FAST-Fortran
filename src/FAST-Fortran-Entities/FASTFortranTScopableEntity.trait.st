"
A Entity with an optional scope

Some statements are scopable because they allow to introduce local variables (e.g. for statement in Java)

## Properties
======================

- Named: #endPos Type: Number
- Named: #endPos Type: Number
- Named: #startPos Type: Number
- Named: #startPos Type: Number

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
