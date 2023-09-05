"
I represent Fortran assignment made without ASSIGN statement
"
Class {
	#name : #FASTFortranAssignmentStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTAssignment + FASTFortranTLabelledStatement',
	#classTraits : 'FASTFortranTAssignment classTrait + FASTFortranTLabelledStatement classTrait',
	#instVars : [
		'#expression => FMOne type: #FASTFortranTExpression opposite: #assignementExpressionOwner'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAssignmentStatement class >> annotation [

	<FMClass: #AssignmentStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranAssignmentStatement >> expression [
	"Relation named: #expression type: #FASTFortranTExpression opposite: #assignementExpressionOwner"

	<generated>
	<FMComment: 'Expression thats being assigned upon declaration to the var'>
	^ expression
]

{ #category : #accessing }
FASTFortranAssignmentStatement >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTFortranAssignmentStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
