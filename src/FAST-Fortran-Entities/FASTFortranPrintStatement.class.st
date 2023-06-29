"
I represent Fortran Print statement
"
Class {
	#name : #FASTFortranPrintStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTWithArguments + FASTFortranTWithFormatIdentifier + FASTFortranTtFortranLabelledStatement',
	#classTraits : 'FASTFortranTWithArguments classTrait + FASTFortranTWithFormatIdentifier classTrait + FASTFortranTtFortranLabelledStatement classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranPrintStatement class >> annotation [

	<FMClass: #PrintStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
