"
A literal node.

Contains a value for the literal.

FLAG: should refactor some literals to core-model
    e.g.: character, int, float, string, boolean 
"
Class {
	#name : #FASTFortranLiteral,
	#superclass : #FASTFortranExpression,
	#instVars : [
		'#value => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranLiteral class >> annotation [

	<FMClass: #Literal super: #FASTFortranExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranLiteral >> value [

	<FMProperty: #value type: #String>
	<generated>
	<FMComment: 'The literal itself as found in the source code'>
	^ value
]

{ #category : #accessing }
FASTFortranLiteral >> value: anObject [
	<generated>
	value := anObject
]
