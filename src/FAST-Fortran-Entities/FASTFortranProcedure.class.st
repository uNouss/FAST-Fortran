"
I represent a fortran subroutine or a function

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parameters` | `FASTFortranTWithParameters` | `parameterOwner` | `FASTFortranTVariableEntity` | My parameters|



"
Class {
	#name : #FASTFortranProcedure,
	#superclass : #FASTFortranSubprogram,
	#traits : 'FASTFortranTWithParameters',
	#classTraits : 'FASTFortranTWithParameters classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranProcedure class >> annotation [

	<FMClass: #Procedure super: #FASTFortranSubprogram>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
