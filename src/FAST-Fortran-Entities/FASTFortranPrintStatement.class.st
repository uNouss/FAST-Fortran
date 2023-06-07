"
I represent Fortran Print statement
"
Class {
	#name : #FASTFortranPrintStatement,
	#superclass : #FASTFortranStatement,
	#traits : 'FASTFortranTWithFormatIdentifier + FASTFortranTWithIOList',
	#classTraits : 'FASTFortranTWithFormatIdentifier classTrait + FASTFortranTWithIOList classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranPrintStatement class >> annotation [

	<FMClass: #PrintStatement super: #FASTFortranStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
