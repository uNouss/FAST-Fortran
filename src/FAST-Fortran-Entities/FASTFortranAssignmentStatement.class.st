"
I represent Fortran assignment made without ASSIGN statement
"
Class {
	#name : #FASTFortranAssignmentStatement,
	#superclass : #FASTFortranStatement,
	#traits : 'FASTFortranTWithAssigneable',
	#classTraits : 'FASTFortranTWithAssigneable classTrait',
	#instVars : [
		'#expression => FMOne type: #FASTFortranTAssigneable opposite: #assignementExpressionOwner'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAssignmentStatement class >> annotation [

	<FMClass: #AssignmentStatement super: #FASTFortranStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranAssignmentStatement >> expression [
	"Relation named: #expression type: #FASTFortranTAssigneable opposite: #assignementExpressionOwner"

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
