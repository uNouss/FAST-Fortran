"
I represent Fortran Print statement
"
Class {
	#name : #FASTFortranPrintStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTLabelledStatement + FASTFortranTWithArguments + FASTFortranTWithFormatIdentifier',
	#classTraits : 'FASTFortranTLabelledStatement classTrait + FASTFortranTWithArguments classTrait + FASTFortranTWithFormatIdentifier classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranPrintStatement class >> annotation [

	<FMClass: #PrintStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
