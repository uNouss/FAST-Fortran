"
I represent a function statement - a function-like declaration, made in a single statement
"
Class {
	#name : #FASTFortranFunctionStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTLabelledStatement + FASTFortranTWithArguments',
	#classTraits : 'FASTFortranTLabelledStatement classTrait + FASTFortranTWithArguments classTrait',
	#instVars : [
		'#expression => FMOne type: #FASTFortranTExpression opposite: #assignementExpressionOwner',
		'#name => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranFunctionStatement class >> annotation [

	<FMClass: #FunctionStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranFunctionStatement >> expression [
	"Relation named: #expression type: #FASTFortranTExpression opposite: #assignementExpressionOwner"

	<generated>
	<FMComment: 'Expression thats being assigned upon declaration to the var'>
	^ expression
]

{ #category : #accessing }
FASTFortranFunctionStatement >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTFortranFunctionStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

{ #category : #accessing }
FASTFortranFunctionStatement >> name [

	<FMProperty: #name type: #String>
	<generated>
	<FMComment: 'Name of a function statement'>
	^ name
]

{ #category : #accessing }
FASTFortranFunctionStatement >> name: anObject [
	<generated>
	name := anObject
]
