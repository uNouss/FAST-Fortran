"
a Fortran Unary Expression (arithmetic, logical, character)
"
Class {
	#name : #FASTFortranUnaryExpression,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTExpression + FASTFortranTFortranUnaryExpression',
	#classTraits : 'FASTFortranTExpression classTrait + FASTFortranTFortranUnaryExpression classTrait',
	#instVars : [
		'#operator => FMProperty',
		'#expression => FMOne type: #FASTFortranTExpression opposite: #parentExpression'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranUnaryExpression class >> annotation [

	<FMClass: #UnaryExpression super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranUnaryExpression >> expression [
	"Relation named: #expression type: #FASTFortranTExpression opposite: #parentExpression"

	<generated>
	<FMComment: 'expression'>
	^ expression
]

{ #category : #accessing }
FASTFortranUnaryExpression >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTFortranUnaryExpression >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

{ #category : #accessing }
FASTFortranUnaryExpression >> operator [

	<FMProperty: #operator type: #String>
	<generated>
	<FMComment: 'Unary expression operator'>
	^ operator
]

{ #category : #accessing }
FASTFortranUnaryExpression >> operator: anObject [
	<generated>
	operator := anObject
]
