"
I represent Fortran Go To (Computed) statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
| `labelReferences` | `FASTFortranTWithLabelReferences` | `referencer` | `FASTFortranLabelReference` | the label(s) referenced|

### Other
| Relation | Origin | Opposite | Type | Comment |
| `selectorExpression` | `FASTFortranGoToComputedStatement` | `parentGotoComputedStatement` | `FASTFortranTExpression` | The expression which value selects the label to go to|



"
Class {
	#name : #FASTFortranGoToComputedStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithLabelReferences',
	#classTraits : 'FASTFortranTWithLabelReferences classTrait',
	#instVars : [
		'#selectorExpression => FMOne type: #FASTFortranTExpression opposite: #parentGotoComputedStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranGoToComputedStatement class >> annotation [

	<FMClass: #GoToComputedStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranGoToComputedStatement >> selectorExpression [
	"Relation named: #selectorExpression type: #FASTFortranTExpression opposite: #parentGotoComputedStatement"

	<generated>
	<FMComment: 'The expression which value selects the label to go to'>
	^ selectorExpression
]

{ #category : #accessing }
FASTFortranGoToComputedStatement >> selectorExpression: anObject [

	<generated>
	selectorExpression := anObject
]
