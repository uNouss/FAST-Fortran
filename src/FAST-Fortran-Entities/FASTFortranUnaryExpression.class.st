"
a Fortran Unary Expression (arithmetic, logical, character)
"
Class {
	#name : #FASTFortranUnaryExpression,
	#superclass : #FASTFortranExpression,
	#instVars : [
		'#expression => FMOne type: #FASTFortranTAssigneable opposite: #parentExpression'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranUnaryExpression class >> annotation [

	<FMClass: #UnaryExpression super: #FASTFortranExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranUnaryExpression >> expression [
	"Relation named: #expression type: #FASTFortranTAssigneable opposite: #parentExpression"

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
