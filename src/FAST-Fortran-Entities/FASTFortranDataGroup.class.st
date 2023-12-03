"
I represent a Fortran Data group in a Data statement
"
Class {
	#name : #FASTFortranDataGroup,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTVariableGroup',
	#classTraits : 'FASTFortranTVariableGroup classTrait',
	#instVars : [
		'#dataConstants => FMMany type: #FASTFortranTExpression opposite: #parentDataStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranDataGroup class >> annotation [

	<FMClass: #DataGroup super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranDataGroup >> addDataConstant: anObject [
	<generated>
	^ self dataConstants add: anObject
]

{ #category : #accessing }
FASTFortranDataGroup >> dataConstants [
	"Relation named: #dataConstants type: #FASTFortranTExpression opposite: #parentDataStatement"

	<generated>
	<derived>
	^ dataConstants
]

{ #category : #accessing }
FASTFortranDataGroup >> dataConstants: anObject [

	<generated>
	dataConstants value: anObject
]
