"
I represent Fortran Read statement

## Relations
======================

### Children
- Relation: #arguments Type: #FASTFortranTExpression Opposite: #argumentOwner Comment: My arguments
- Relation: #ioParameters Type: #FASTFortranTIOParameter Opposite: #parentIOStatement Comment: I represent a statement with IO-parameters (read or write)


"
Class {
	#name : #FASTFortranReadStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithArguments + FASTFortranTWithIOParameters',
	#classTraits : 'FASTFortranTWithArguments classTrait + FASTFortranTWithIOParameters classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranReadStatement class >> annotation [

	<FMClass: #ReadStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
