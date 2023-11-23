"
I represent FortranDimension statement
"
Class {
	#name : #FASTFortranDimensionStatement,
	#superclass : #FASTFortranAbstractStatement,
	#instVars : [
		'#arrays => FMMany type: #FASTFortranType opposite: #parentDimensionStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranDimensionStatement class >> annotation [

	<FMClass: #DimensionStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranDimensionStatement >> addArray: anObject [
	<generated>
	^ self arrays add: anObject
]

{ #category : #accessing }
FASTFortranDimensionStatement >> arrays [
	"Relation named: #arrays type: #FASTFortranType opposite: #parentDimensionStatement"

	<generated>
	<FMComment: 'Specifies the name and dimensions of the arrays'>
	<derived>
	^ arrays
]

{ #category : #accessing }
FASTFortranDimensionStatement >> arrays: anObject [

	<generated>
	arrays value: anObject
]

{ #category : #navigation }
FASTFortranDimensionStatement >> arraysGroup [
	<generated>
	<navigation: 'Arrays'>
	^ MooseSpecializedGroup withAll: self arrays asSet
]
