"
a Fortran Arithmetic Expression
"
Class {
	#name : #FASTFortranArithmeticExpression,
	#superclass : #FASTFortranExpression,
	#traits : 'FASTFortranTBinaryExpression',
	#classTraits : 'FASTFortranTBinaryExpression classTrait',
	#instVars : [
		'#left => FMOne type: #FASTFortranExpression opposite: #parentExpression',
		'#right => FMOne type: #FASTFortranExpression opposite: #parentExpression'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranArithmeticExpression class >> annotation [

	<FMClass: #ArithmeticExpression super: #FASTFortranExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranArithmeticExpression >> left [
	"Relation named: #left type: #FASTFortranExpression opposite: #parentExpression"

	<generated>
	<FMComment: 'left part of the expression'>
	^ left
]

{ #category : #accessing }
FASTFortranArithmeticExpression >> left: anObject [

	<generated>
	left := anObject
]

{ #category : #navigation }
FASTFortranArithmeticExpression >> leftGroup [
	<generated>
	<navigation: 'Left'>
	^ MooseSpecializedGroup with: self left
]

{ #category : #accessing }
FASTFortranArithmeticExpression >> right [
	"Relation named: #right type: #FASTFortranExpression opposite: #parentExpression"

	<generated>
	<FMComment: 'left part of the expression'>
	^ right
]

{ #category : #accessing }
FASTFortranArithmeticExpression >> right: anObject [

	<generated>
	right := anObject
]

{ #category : #navigation }
FASTFortranArithmeticExpression >> rightGroup [
	<generated>
	<navigation: 'Right'>
	^ MooseSpecializedGroup with: self right
]
