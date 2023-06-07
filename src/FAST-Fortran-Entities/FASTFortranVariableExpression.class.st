"
a Fortran Variable Expression
"
Class {
	#name : #FASTFortranVariableExpression,
	#superclass : #FASTFortranExpression,
	#instVars : [
		'#type => FMProperty',
		'#value => FMProperty',
		'#defined => FMProperty',
		'#parentDeclaration => FMOne type: #FASTFortranDeclarationStatement opposite: #declarators'
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
	"Relation named: #parentDeclaration type: #FASTFortranDeclarationStatement opposite: #declarators"

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
