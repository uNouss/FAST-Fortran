"
I represent FortranData statement
"
Class {
	#name : #FASTFortranDataStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTLabelledStatement',
	#classTraits : 'FASTFortranTLabelledStatement classTrait',
	#instVars : [
		'#dataConstants => FMMany type: #FASTFortranTExpression opposite: #parentDataStatement',
		'#dataVariables => FMMany type: #FASTFortranVariable opposite: #parentDataStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranDataStatement class >> annotation [

	<FMClass: #DataStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranDataStatement >> addDataConstant: anObject [
	<generated>
	^ self dataConstants add: anObject
]

{ #category : #adding }
FASTFortranDataStatement >> addDataVariable: anObject [
	<generated>
	^ self dataVariables add: anObject
]

{ #category : #accessing }
FASTFortranDataStatement >> dataConstants [
	"Relation named: #dataConstants type: #FASTFortranTExpression opposite: #parentDataStatement"

	<generated>
	<derived>
	^ dataConstants
]

{ #category : #accessing }
FASTFortranDataStatement >> dataConstants: anObject [

	<generated>
	dataConstants value: anObject
]

{ #category : #accessing }
FASTFortranDataStatement >> dataVariables [
	"Relation named: #dataVariables type: #FASTFortranVariable opposite: #parentDataStatement"

	<generated>
	<derived>
	^ dataVariables
]

{ #category : #accessing }
FASTFortranDataStatement >> dataVariables: anObject [

	<generated>
	dataVariables value: anObject
]
