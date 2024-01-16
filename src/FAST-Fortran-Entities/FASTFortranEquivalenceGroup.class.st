"
I represent a group of variables in an Equivalence statement

## Relations
======================

### Parents
- Relation: #withVariableGroups Type: #FASTFortranTWithVariableGroups Opposite: #variableGroups
### Other
- Relation: #variables Type: #FASTFortranVariable Opposite: #parentVariableGroup


"
Class {
	#name : #FASTFortranEquivalenceGroup,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTVariableGroup',
	#classTraits : 'FASTFortranTVariableGroup classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranEquivalenceGroup class >> annotation [

	<FMClass: #EquivalenceGroup super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
