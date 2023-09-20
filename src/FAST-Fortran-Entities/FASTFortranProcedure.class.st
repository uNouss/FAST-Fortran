"
I represent a fortran subroutine or a function
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
