"
a Fortran Binary Expression (arithmetic, logical)
"
Class {
	#name : #FASTFortranBinaryExpression,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTBinaryExpression + FASTFortranTExpression',
	#classTraits : 'FASTFortranTBinaryExpression classTrait + FASTFortranTExpression classTrait',
	#instVars : [
		'#left => FMOne type: #FASTFortranTExpression opposite: #parentExpression',
		'#operator => FMProperty',
		'#right => FMOne type: #FASTFortranTExpression opposite: #parentExpression'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranBinaryExpression class >> annotation [

	<FMClass: #BinaryExpression super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranBinaryExpression >> left [
	"Relation named: #left type: #FASTFortranTExpression opposite: #parentExpression"

	<generated>
	<FMComment: 'left part of a binary expression'>
	^ left
]

{ #category : #accessing }
FASTFortranBinaryExpression >> left: anObject [

	<generated>
	left := anObject
]

{ #category : #navigation }
FASTFortranBinaryExpression >> leftGroup [
	<generated>
	<navigation: 'Left'>
	^ MooseSpecializedGroup with: self left
]

{ #category : #accessing }
FASTFortranBinaryExpression >> operator [

	<FMProperty: #operator type: #String>
	<generated>
	<FMComment: 'Binary expression operator'>
	^ operator
]

{ #category : #accessing }
FASTFortranBinaryExpression >> operator: anObject [
	<generated>
	operator := anObject
]

{ #category : #accessing }
FASTFortranBinaryExpression >> right [
	"Relation named: #right type: #FASTFortranTExpression opposite: #parentExpression"

	<generated>
	<FMComment: 'left part of the expression'>
	^ right
]

{ #category : #accessing }
FASTFortranBinaryExpression >> right: anObject [

	<generated>
	right := anObject
]

{ #category : #navigation }
FASTFortranBinaryExpression >> rightGroup [
	<generated>
	<navigation: 'Right'>
	^ MooseSpecializedGroup with: self right
]
