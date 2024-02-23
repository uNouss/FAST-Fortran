"
I represent FortranDimension statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declarators` | `FASTFortranTWithDeclarators` | `parentDeclaration` | `FASTFortranTVariableDeclarator` | variables declared|



"
Class {
	#name : #FASTFortranDimensionStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithDeclarators',
	#classTraits : 'FASTFortranTWithDeclarators classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranDimensionStatement class >> annotation [

	<FMClass: #DimensionStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
