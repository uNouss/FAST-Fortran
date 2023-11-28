"
I am the super class of all Fortran statements
"
Class {
	#name : #FASTFortranAbstractStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTStatement',
	#classTraits : 'FASTFortranTStatement classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAbstractStatement class >> annotation [

	<FMClass: #AbstractStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
