"
I represent Fortran Record statement
"
Class {
	#name : #FASTFortranRecord,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTExpression',
	#classTraits : 'FASTFortranTExpression classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranRecord class >> annotation [

	<FMClass: #Record super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
