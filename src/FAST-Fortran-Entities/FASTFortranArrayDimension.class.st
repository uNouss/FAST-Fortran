"
I represent an array lower/upper bounds declaration
"
Class {
	#name : #FASTFortranArrayDimension,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#upperBound => FMOne type: #FASTFortranTNumericalLiteral opposite: #parentArrayDimensionDeclarator',
		'#lowerBound => FMOne type: #FASTFortranTNumericalLiteral opposite: #parentArrayDimensionDeclarator',
		'#parentVariableDeclarator => FMOne type: #FASTFortranVariableDeclarator opposite: #dimensions'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranArrayDimension class >> annotation [

	<FMClass: #ArrayDimension super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranArrayDimension >> lowerBound [
	"Relation named: #lowerBound type: #FASTFortranTNumericalLiteral opposite: #parentArrayDimensionDeclarator"

	<generated>
	<FMComment: 'A lower bound of an array dimension'>
	^ lowerBound
]

{ #category : #accessing }
FASTFortranArrayDimension >> lowerBound: anObject [

	<generated>
	lowerBound := anObject
]

{ #category : #navigation }
FASTFortranArrayDimension >> lowerBoundGroup [
	<generated>
	<navigation: 'LowerBound'>
	^ MooseSpecializedGroup with: self lowerBound
]

{ #category : #accessing }
FASTFortranArrayDimension >> parentVariableDeclarator [
	"Relation named: #parentVariableDeclarator type: #FASTFortranVariableDeclarator opposite: #dimensions"

	<generated>
	<FMComment: 'The variable declarator I am part of'>
	<container>
	^ parentVariableDeclarator
]

{ #category : #accessing }
FASTFortranArrayDimension >> parentVariableDeclarator: anObject [

	<generated>
	parentVariableDeclarator := anObject
]

{ #category : #navigation }
FASTFortranArrayDimension >> parentVariableDeclaratorGroup [
	<generated>
	<navigation: 'ParentVariableDeclarator'>
	^ MooseSpecializedGroup with: self parentVariableDeclarator
]

{ #category : #accessing }
FASTFortranArrayDimension >> upperBound [
	"Relation named: #upperBound type: #FASTFortranTNumericalLiteral opposite: #parentArrayDimensionDeclarator"

	<generated>
	<FMComment: 'An upper bound of an array dimension'>
	^ upperBound
]

{ #category : #accessing }
FASTFortranArrayDimension >> upperBound: anObject [

	<generated>
	upperBound := anObject
]

{ #category : #navigation }
FASTFortranArrayDimension >> upperBoundGroup [
	<generated>
	<navigation: 'UpperBound'>
	^ MooseSpecializedGroup with: self upperBound
]
