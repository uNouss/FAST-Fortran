"
A node of a statement which is representing a single expression. 
"
Class {
	#name : #FASTFortranExpressionStatement,
	#superclass : #FASTFortranStatement,
	#instVars : [
		'#expression => FMOne type: #FASTFortranExpression opposite: #expressionStatementOwner'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranExpressionStatement class >> annotation [

	<FMClass: #ExpressionStatement super: #FASTFortranStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranExpressionStatement >> expression [
	"Relation named: #expression type: #FASTFortranExpression opposite: #expressionStatementOwner"

	<generated>
	<FMComment: 'The expression of the statement'>
	^ expression
]

{ #category : #accessing }
FASTFortranExpressionStatement >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTFortranExpressionStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
