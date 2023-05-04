"
A node that wraps around structural entity
"
Class {
	#name : #FASTFortranVariableExpression,
	#superclass : #FASTFortranExpression,
	#traits : 'FASTFortranTParameter + FamixTNamedEntity',
	#classTraits : 'FASTFortranTParameter classTrait + FamixTNamedEntity classTrait',
	#instVars : [
		'#type => FMProperty',
		'#value => FMProperty',
		'#defined => FMProperty',
		'#parentDeclaration => FMOne type: #FASTFortranVariablesDeclaration opposite: #variables'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranVariableExpression class >> annotation [

	<FMClass: #VariableExpression super: #FASTFortranExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranVariableExpression >> defined [

	<FMProperty: #defined type: #Boolean>
	<generated>
	<FMComment: 'Determines if the variableis defined (stores a value)'>
	^ defined
]

{ #category : #accessing }
FASTFortranVariableExpression >> defined: anObject [
	<generated>
	defined := anObject
]

{ #category : #accessing }
FASTFortranVariableExpression >> parentDeclaration [
	"Relation named: #parentDeclaration type: #FASTFortranVariablesDeclaration opposite: #variables"

	<generated>
	<FMComment: 'Parent declaration'>
	<container>
	^ parentDeclaration
]

{ #category : #accessing }
FASTFortranVariableExpression >> parentDeclaration: anObject [

	<generated>
	parentDeclaration := anObject
]

{ #category : #navigation }
FASTFortranVariableExpression >> parentDeclarationGroup [
	<generated>
	<navigation: 'ParentDeclaration'>
	^ MooseSpecializedGroup with: self parentDeclaration
]

{ #category : #accessing }
FASTFortranVariableExpression >> type [

	<FMProperty: #type type: #String>
	<generated>
	<FMComment: 'Determines the variable type'>
	^ type
]

{ #category : #accessing }
FASTFortranVariableExpression >> type: anObject [
	<generated>
	type := anObject
]

{ #category : #accessing }
FASTFortranVariableExpression >> value [

	<FMProperty: #value type: #String>
	<generated>
	<FMComment: 'Determines the variable value'>
	^ value
]

{ #category : #accessing }
FASTFortranVariableExpression >> value: anObject [
	<generated>
	value := anObject
]
