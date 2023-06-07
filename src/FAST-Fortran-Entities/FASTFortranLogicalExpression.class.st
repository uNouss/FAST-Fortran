"
a Fortran Logical Expression
"
Class {
	#name : #FASTFortranLogicalExpression,
	#superclass : #FASTFortranExpression,
	#traits : 'FASTFortranTBinaryExpression',
	#classTraits : 'FASTFortranTBinaryExpression classTrait',
	#instVars : [
		'#left => FMOne type: #FASTFortranTAssigneable opposite: #parentExpression',
		'#right => FMOne type: #FASTFortranTAssigneable opposite: #parentExpression'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranLogicalExpression class >> annotation [

	<FMClass: #LogicalExpression super: #FASTFortranExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranLogicalExpression >> left [
	"Relation named: #left type: #FASTFortranTAssigneable opposite: #parentExpression"

	<generated>
	<FMComment: 'left part of the expression'>
	^ left
]

{ #category : #accessing }
FASTFortranLogicalExpression >> left: anObject [

	<generated>
	left := anObject
]

{ #category : #navigation }
FASTFortranLogicalExpression >> leftGroup [
	<generated>
	<navigation: 'Left'>
	^ MooseSpecializedGroup with: self left
]

{ #category : #accessing }
FASTFortranLogicalExpression >> right [
	"Relation named: #right type: #FASTFortranTAssigneable opposite: #parentExpression"

	<generated>
	<FMComment: 'left part of the expression'>
	^ right
]

{ #category : #accessing }
FASTFortranLogicalExpression >> right: anObject [

	<generated>
	right := anObject
]

{ #category : #navigation }
FASTFortranLogicalExpression >> rightGroup [
	<generated>
	<navigation: 'Right'>
	^ MooseSpecializedGroup with: self right
]
