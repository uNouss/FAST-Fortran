"
I represent a fortran subroutine or a function

## Relations
======================

### Children
- Relation: #parameters Type: #FASTFortranTVariableEntity Opposite: #parameterOwner Comment: My parameters


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
