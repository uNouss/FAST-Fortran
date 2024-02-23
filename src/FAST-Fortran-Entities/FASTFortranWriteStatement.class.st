"
I represent Fortran Write statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FASTFortranTWithArguments` | `argumentOwner` | `FASTFortranTExpression` | My arguments|
| `ioParameters` | `FASTFortranTWithIOParameters` | `parentIOStatement` | `FASTFortranTIOParameter` | I represent a statement with IO-parameters (read or write)|



"
Class {
	#name : #FASTFortranWriteStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithArguments + FASTFortranTWithIOParameters',
	#classTraits : 'FASTFortranTWithArguments classTrait + FASTFortranTWithIOParameters classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranWriteStatement class >> annotation [

	<FMClass: #WriteStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
