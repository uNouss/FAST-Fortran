"
a scalar Fortran Variable, used in declarations
"
Class {
	#name : #FASTFortranScalarVariable,
	#superclass : #FASTFortranVariable,
	#traits : 'FASTFortranTFormat',
	#classTraits : 'FASTFortranTFormat classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranScalarVariable class >> annotation [

	<FMClass: #ScalarVariable super: #FASTFortranVariable>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
