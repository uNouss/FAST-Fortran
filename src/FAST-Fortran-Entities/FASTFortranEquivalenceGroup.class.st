"
I represent a group of variables in an Equivalence statement

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
	#name : #FASTFortranEquivalenceGroup,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTVariableGroup',
	#classTraits : 'FASTFortranTVariableGroup classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranEquivalenceGroup class >> annotation [

	<FMClass: #EquivalenceGroup super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
