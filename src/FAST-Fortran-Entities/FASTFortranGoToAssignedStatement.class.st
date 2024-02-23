"
I represent Fortran Go To( Assigned) statement

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `labelReferences` | `FASTFortranTWithLabelReferences` | `referencer` | `FASTFortranLabelReference` | the label(s) referenced|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `selectorExpression` | `FASTFortranGoToAssignedStatement` | `parentGotoAssignedStatement` | `FASTFortranTExpression` | The expression which value selects the label to go to|



"
Class {
	#name : #FASTFortranGoToAssignedStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithLabelReferences',
	#classTraits : 'FASTFortranTWithLabelReferences classTrait',
	#instVars : [
		'#selectorExpression => FMOne type: #FASTFortranTExpression opposite: #parentGotoAssignedStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranGoToAssignedStatement class >> annotation [

	<FMClass: #GoToAssignedStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranGoToAssignedStatement >> selectorExpression [
	"Relation named: #selectorExpression type: #FASTFortranTExpression opposite: #parentGotoAssignedStatement"

	<generated>
	<FMComment: 'The expression which value selects the label to go to'>
	^ selectorExpression
]

{ #category : #accessing }
FASTFortranGoToAssignedStatement >> selectorExpression: anObject [

	<generated>
	selectorExpression := anObject
]
