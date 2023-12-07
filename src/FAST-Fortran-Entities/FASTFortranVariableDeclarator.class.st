"
Part of a variable declaration: name of the variable + optional initial value
"
Class {
	#name : #FASTFortranVariableDeclarator,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTVariableDeclarator',
	#classTraits : 'FASTFortranTVariableDeclarator classTrait',
	#instVars : [
		'#dimensions => FMMany type: #FASTFortranArrayRange opposite: #parentVariableDeclarator'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranVariableDeclarator class >> annotation [

	<FMClass: #VariableDeclarator super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranVariableDeclarator >> addDimension: anObject [
	<generated>
	^ self dimensions add: anObject
]

{ #category : #accessing }
FASTFortranVariableDeclarator >> dimensions [
	"Relation named: #dimensions type: #FASTFortranArrayDimension opposite: #parentVariableDeclarator"

	<generated>
	<FMComment: 'Possible dimensions in case this is an array declaration'>
	<derived>
	^ dimensions
]

{ #category : #accessing }
FASTFortranVariableDeclarator >> dimensions: anObject [

	<generated>
	dimensions value: anObject
]

{ #category : #navigation }
FASTFortranVariableDeclarator >> dimensionsGroup [
	<generated>
	<navigation: 'Dimensions'>
	^ MooseSpecializedGroup withAll: self dimensions asSet
]
