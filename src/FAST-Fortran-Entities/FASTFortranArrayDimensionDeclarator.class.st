"
I represent Fortran Array dimension declaration
"
Class {
	#name : #FASTFortranArrayDimensionDeclarator,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#lb => FMProperty',
		'#ub => FMProperty',
		'#parentArray => FMOne type: #FASTFortranArrayVariable opposite: #arrayDimensionDeclarator'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranArrayDimensionDeclarator class >> annotation [

	<FMClass: #ArrayDimensionDeclarator super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranArrayDimensionDeclarator >> lb [

	<FMProperty: #lb type: #Number>
	<generated>
	<FMComment: 'Lower bound'>
	^ lb
]

{ #category : #accessing }
FASTFortranArrayDimensionDeclarator >> lb: anObject [
	<generated>
	lb := anObject
]

{ #category : #accessing }
FASTFortranArrayDimensionDeclarator >> parentArray [
	"Relation named: #parentArray type: #FASTFortranArrayVariable opposite: #arrayDimensionDeclarator"

	<generated>
	<FMComment: 'Parent array declaration'>
	<container>
	<derived>
	^ parentArray
]

{ #category : #accessing }
FASTFortranArrayDimensionDeclarator >> parentArray: anObject [

	<generated>
	parentArray := anObject
]

{ #category : #navigation }
FASTFortranArrayDimensionDeclarator >> parentArrayGroup [
	<generated>
	<navigation: 'ParentArray'>
	^ MooseSpecializedGroup with: self parentArray
]

{ #category : #accessing }
FASTFortranArrayDimensionDeclarator >> ub [

	<FMProperty: #ub type: #Number>
	<generated>
	<FMComment: 'Upper bound'>
	^ ub
]

{ #category : #accessing }
FASTFortranArrayDimensionDeclarator >> ub: anObject [
	<generated>
	ub := anObject
]
