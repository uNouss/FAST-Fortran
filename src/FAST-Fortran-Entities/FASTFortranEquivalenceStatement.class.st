"
I represent a Fortran Equivalence statement

## Relations
======================

### Children
- Relation: #variableGroups Type: #FASTFortranTVariableGroup Opposite: #withVariableGroups


"
Class {
	#name : #FASTFortranEquivalenceStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithVariableGroups',
	#classTraits : 'FASTFortranTWithVariableGroups classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranEquivalenceStatement class >> annotation [

	<FMClass: #EquivalenceStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
