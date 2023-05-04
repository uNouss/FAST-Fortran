"
I represent a Fortran Function
"
Class {
	#name : #FASTFortranFunction,
	#superclass : #FASTFortranProcedure,
	#traits : 'FASTFortranTWithParameters',
	#classTraits : 'FASTFortranTWithParameters classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranFunction class >> annotation [

	<FMClass: #Function super: #FASTFortranProcedure>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
