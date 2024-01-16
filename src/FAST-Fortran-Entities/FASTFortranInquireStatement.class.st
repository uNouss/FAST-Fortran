"
I represent Fortran Inquire statement

## Relations
======================

### Children
- Relation: #ioParameters Type: #FASTFortranTIOParameter Opposite: #parentIOStatement Comment: I represent a statement with IO-parameters (read or write)


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
