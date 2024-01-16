"
I represent Fortran Go To (unconditional) statement

## Relations
======================

### Children
- Relation: #labelReferences Type: #FASTFortranLabelReference Opposite: #referencer Comment: the label(s) referenced


"
Class {
	#name : #FASTFortranGoToStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithLabelReferences',
	#classTraits : 'FASTFortranTWithLabelReferences classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranGoToStatement class >> annotation [

	<FMClass: #GoToStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
