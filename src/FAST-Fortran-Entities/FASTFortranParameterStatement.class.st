"
I represent Fortran Parameter statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
| `declarators` | `FASTFortranTWithDeclarators` | `parentDeclaration` | `FASTFortranTVariableDeclarator` | variables declared|



"
Class {
	#name : #FASTFortranParameterStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithDeclarators',
	#classTraits : 'FASTFortranTWithDeclarators classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranParameterStatement class >> annotation [

	<FMClass: #ParameterStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
