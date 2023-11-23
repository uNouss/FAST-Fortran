"
I represent Fortran Print statement
"
Class {
	#name : #FASTFortranPrintStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithArguments + FASTFortranTWithFormatIdentifier',
	#classTraits : 'FASTFortranTWithArguments classTrait + FASTFortranTWithFormatIdentifier classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranPrintStatement class >> annotation [

	<FMClass: #PrintStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
