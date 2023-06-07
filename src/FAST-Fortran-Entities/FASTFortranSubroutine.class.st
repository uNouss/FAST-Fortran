"
The SUBROUTINE statement identifies a subprogram, a named program unit as a subroutine, and specifies arguments for it
"
Class {
	#name : #FASTFortranSubroutine,
	#superclass : #FASTFortranProcedure,
	#traits : 'FASTFortranTAssigneable + FASTFortranTWithParameters',
	#classTraits : 'FASTFortranTAssigneable classTrait + FASTFortranTWithParameters classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranSubroutine class >> annotation [

	<FMClass: #Subroutine super: #FASTFortranProcedure>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
