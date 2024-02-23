"
I represent Fortran Rewind statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `ioParameters` | `FASTFortranTWithIOParameters` | `parentIOStatement` | `FASTFortranTIOParameter` | I represent a statement with IO-parameters (read or write)|



"
Class {
	#name : #FASTFortranRewindStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithIOParameters',
	#classTraits : 'FASTFortranTWithIOParameters classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranRewindStatement class >> annotation [

	<FMClass: #RewindStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
