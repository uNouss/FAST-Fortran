"
I represent Fortran Open statement

## Relations
======================

### Children
- Relation: #ioParameters Type: #FASTFortranTIOParameter Opposite: #parentIOStatement Comment: I represent a statement with IO-parameters (read or write)


"
Class {
	#name : #FASTFortranOpenStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithIOParameters',
	#classTraits : 'FASTFortranTWithIOParameters classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranOpenStatement class >> annotation [

	<FMClass: #OpenStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
