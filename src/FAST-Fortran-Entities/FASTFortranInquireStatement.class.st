"
I represent Fortran Inquire statement
"
Class {
	#name : #FASTFortranInquireStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithIOParameters',
	#classTraits : 'FASTFortranTWithIOParameters classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranInquireStatement class >> annotation [

	<FMClass: #InquireStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
