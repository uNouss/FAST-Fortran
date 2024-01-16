"
An array Fortran Variable, accessed in the code

## Relations
======================

### Other
- Relation: #indices Type: #FASTFortranTExpression Opposite: #parentArrayExpression Comment: Indices used in the array access


"
Class {
	#name : #FASTFortranArrayVariable,
	#superclass : #FASTFortranVariable,
	#instVars : [
		'#indices => FMMany type: #FASTFortranTExpression opposite: #parentArrayExpression'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranArrayVariable class >> annotation [

	<FMClass: #ArrayVariable super: #FASTFortranVariable>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranArrayVariable >> addIndice: anObject [
	<generated>
	^ self indices add: anObject
]

{ #category : #accessing }
FASTFortranArrayVariable >> indices [
	"Relation named: #indices type: #FASTFortranTExpression opposite: #parentArrayExpression"

	<generated>
	<FMComment: 'Indices used in the array access'>
	<derived>
	^ indices
]

{ #category : #accessing }
FASTFortranArrayVariable >> indices: anObject [

	<generated>
	indices value: anObject
]
