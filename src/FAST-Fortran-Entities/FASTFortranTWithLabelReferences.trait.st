"
I represent a statement (various kind of goto) that can have label references

## Relations
======================

### Children
- Relation: #labelReferences Type: #FASTFortranLabelReference Opposite: #referencer Comment: the label(s) referenced


"
Trait {
	#name : #FASTFortranTWithLabelReferences,
	#instVars : [
		'#labelReferences => FMMany type: #FASTFortranLabelReference opposite: #referencer'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTWithLabelReferences classSide >> annotation [

	<FMClass: #TWithLabelReferences super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranTWithLabelReferences >> addLabelReference: anObject [
	<generated>
	^ self labelReferences add: anObject
]

{ #category : #accessing }
FASTFortranTWithLabelReferences >> labelReferences [
	"Relation named: #labelReferences type: #FASTFortranLabelReference opposite: #referencer"

	<generated>
	<FMComment: 'the label(s) referenced'>
	<derived>
	^ labelReferences
]

{ #category : #accessing }
FASTFortranTWithLabelReferences >> labelReferences: anObject [

	<generated>
	labelReferences value: anObject
]

{ #category : #navigation }
FASTFortranTWithLabelReferences >> labelReferencesGroup [
	<generated>
	<navigation: 'LabelReferences'>
	^ MooseSpecializedGroup withAll: self labelReferences asSet
]
