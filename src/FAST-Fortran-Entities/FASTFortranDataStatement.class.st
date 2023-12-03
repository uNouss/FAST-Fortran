"
I represent a Fortran Data statement
"
Class {
	#name : #FASTFortranDataStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithVariableGroups',
	#classTraits : 'FASTFortranTWithVariableGroups classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranDataStatement class >> annotation [

	<FMClass: #DataStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
