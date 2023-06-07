"
The PROGRAM statement identifies the program unit as a main program. program. For the loader, the main program is always named MAIN. The PROGRAM statement serves only the person who reads the program
"
Class {
	#name : #FASTFortranProgramMain,
	#superclass : #FASTFortranProgramUnit,
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranProgramMain class >> annotation [

	<FMClass: #ProgramMain super: #FASTFortranProgramUnit>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
