"
I represent Fortran Intrinsic statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
| `withVariableGroups` | `FASTFortranTVariableGroup` | `variableGroups` | `FASTFortranTWithVariableGroups` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
| `variables` | `FASTFortranTVariableGroup` | `parentVariableGroup` | `FASTFortranVariable` | |



"
Class {
	#name : #FASTFortranIntrinsicStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTVariableGroup',
	#classTraits : 'FASTFortranTVariableGroup classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranIntrinsicStatement class >> annotation [

	<FMClass: #IntrinsicStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
