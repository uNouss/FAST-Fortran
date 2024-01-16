"
Part of a variable declaration: name of the variable + optional initial value

## Relations
======================

### Parents
- Relation: #parentDeclaration Type: #FASTFortranTWithDeclarators Opposite: #declarators
### Children
- Relation: #dimensions Type: #FASTFortranArrayRange Opposite: #parentVariableDeclarator Comment: Possible dimensions in case this is an array declaration
- Relation: #expression Type: #FASTFortranTExpression Opposite: #variableDeclaratorOwner Comment: Expression assigned to the variable declared

## Properties
======================

- Named: #variable Type: String Comment: The name of the variable being declared

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
	"Relation named: #dimensions type: #FASTFortranArrayRange opposite: #parentVariableDeclarator"

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
