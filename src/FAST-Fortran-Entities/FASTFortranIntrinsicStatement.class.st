"
I represent Fortran Intrinsic statement

## Relations
======================

### Parents
- Relation: #withVariableGroups Type: #FASTFortranTWithVariableGroups Opposite: #variableGroups
### Other
- Relation: #variables Type: #FASTFortranVariable Opposite: #parentVariableGroup


"
Class {
	#name : #FASTFortranIntrinsicStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTVariableGroup',
	#classTraits : 'FASTFortranTVariableGroup classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranIntrinsicStatement class >> annotation [

	<FMClass: #IntrinsicStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
