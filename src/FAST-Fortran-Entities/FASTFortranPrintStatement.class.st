"
I represent Fortran Print statement
"
Class {
	#name : #FASTFortranPrintStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTWithArguments + FASTFortranTWithFormatIdentifier + FASTFortranTLabelledStatement',
	#classTraits : 'FASTFortranTWithArguments classTrait + FASTFortranTWithFormatIdentifier classTrait + FASTFortranTLabelledStatement classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #'as yet unclassified' }
FASTFortranPrintStatement class >> annotation [

	<FMClass: #PrintStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
