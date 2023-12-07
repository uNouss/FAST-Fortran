"
I represent an array lower/upper bounds
"
Class {
	#name : #FASTFortranArrayRange,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTExpression',
	#classTraits : 'FASTFortranTExpression classTrait',
	#instVars : [
		'#upperBound => FMOne type: #FASTFortranTExpression opposite: #parentArrayDimensionDeclarator',
		'#lowerBound => FMOne type: #FASTFortranTExpression opposite: #parentArrayDimensionDeclarator',
		'#parentVariableDeclarator => FMOne type: #FASTFortranVariableDeclarator opposite: #dimensions'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranArrayRange class >> annotation [

	<FMClass: #ArrayRange super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranArrayRange >> lowerBound [
	"Relation named: #lowerBound type: #FASTFortranTExpression opposite: #parentArrayDimensionDeclarator"

	<generated>
	<FMComment: 'A lower bound of an array dimension'>
	^ lowerBound
]

{ #category : #accessing }
FASTFortranArrayRange >> lowerBound: anObject [

	<generated>
	lowerBound := anObject
]

{ #category : #navigation }
FASTFortranArrayRange >> lowerBoundGroup [
	<generated>
	<navigation: 'LowerBound'>
	^ MooseSpecializedGroup with: self lowerBound
]

{ #category : #accessing }
FASTFortranArrayRange >> parentVariableDeclarator [
	"Relation named: #parentVariableDeclarator type: #FASTFortranVariableDeclarator opposite: #dimensions"

	<generated>
	<FMComment: 'The variable declarator I am part of'>
	<container>
	^ parentVariableDeclarator
]

{ #category : #accessing }
FASTFortranArrayRange >> parentVariableDeclarator: anObject [

	<generated>
	parentVariableDeclarator := anObject
]

{ #category : #navigation }
FASTFortranArrayRange >> parentVariableDeclaratorGroup [
	<generated>
	<navigation: 'ParentVariableDeclarator'>
	^ MooseSpecializedGroup with: self parentVariableDeclarator
]

{ #category : #accessing }
FASTFortranArrayRange >> upperBound [
	"Relation named: #upperBound type: #FASTFortranTExpression opposite: #parentArrayDimensionDeclarator"

	<generated>
	<FMComment: 'An upper bound of an array dimension'>
	^ upperBound
]

{ #category : #accessing }
FASTFortranArrayRange >> upperBound: anObject [

	<generated>
	upperBound := anObject
]

{ #category : #navigation }
FASTFortranArrayRange >> upperBoundGroup [
	<generated>
	<navigation: 'UpperBound'>
	^ MooseSpecializedGroup with: self upperBound
]
