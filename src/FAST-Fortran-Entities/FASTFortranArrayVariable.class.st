"
an array Fortran Variable, used in declarations
"
Class {
	#name : #FASTFortranArrayVariable,
	#superclass : #FASTFortranVariable,
	#instVars : [
		'#arrayDimensionDeclarator => FMMany type: #FASTFortranArrayDimensionDeclarator opposite: #parentArray'
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
FASTFortranArrayVariable >> addArrayDimensionDeclarator: anObject [
	<generated>
	^ self arrayDimensionDeclarator add: anObject
]

{ #category : #accessing }
FASTFortranArrayVariable >> arrayDimensionDeclarator [
	"Relation named: #arrayDimensionDeclarator type: #FASTFortranArrayDimensionDeclarator opposite: #parentArray"

	<generated>
	<FMComment: 'An array dimension declarator specifies lower and upper dimension bounds of an array'>
	<derived>
	^ arrayDimensionDeclarator
]

{ #category : #accessing }
FASTFortranArrayVariable >> arrayDimensionDeclarator: anObject [

	<generated>
	arrayDimensionDeclarator value: anObject
]

{ #category : #navigation }
FASTFortranArrayVariable >> arrayDimensionDeclaratorGroup [
	<generated>
	<navigation: 'ArrayDimensionDeclarator'>
	^ MooseSpecializedGroup withAll: self arrayDimensionDeclarator asSet
]
