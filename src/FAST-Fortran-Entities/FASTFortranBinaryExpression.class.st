"
a Fortran Binary Expression (arithmetic, logical)
"
Class {
	#name : #FASTFortranBinaryExpression,
	#superclass : #FASTFortranExpression,
	#instVars : [
		'#left => FMOne type: #FASTFortranTAssigneable opposite: #parentExpression',
		'#right => FMOne type: #FASTFortranTAssigneable opposite: #parentExpression'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranBinaryExpression class >> annotation [

	<FMClass: #BinaryExpression super: #FASTFortranExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranBinaryExpression >> left [
	"Relation named: #left type: #FASTFortranTAssigneable opposite: #parentExpression"

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
FASTFortranBinaryExpression >> right [
	"Relation named: #right type: #FASTFortranTAssigneable opposite: #parentExpression"

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
