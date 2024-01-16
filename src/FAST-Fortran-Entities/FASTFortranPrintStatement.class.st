"
I represent Fortran Print statement

## Relations
======================

### Children
- Relation: #arguments Type: #FASTFortranTExpression Opposite: #argumentOwner Comment: My arguments
- Relation: #format Type: #FASTFortranTFormat Opposite: #parentFormatedStatement Comment: The description of the format


"
Class {
	#name : #FASTFortranPrintStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithArguments + FASTFortranTWithFormat',
	#classTraits : 'FASTFortranTWithArguments classTrait + FASTFortranTWithFormat classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranPrintStatement class >> annotation [

	<FMClass: #PrintStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
