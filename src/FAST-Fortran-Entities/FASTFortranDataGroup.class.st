"
I represent a Fortran Data group in a Data statement
"
Class {
	#name : #FASTFortranDataGroup,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#dataVariables => FMMany type: #FASTFortranVariable opposite: #parentDataStatement',
		'#dataConstants => FMMany type: #FASTFortranTExpression opposite: #parentDataStatement',
		'#dataStatement => FMOne type: #FASTFortranDataStatement opposite: #dataGroups'
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

{ #category : #adding }
FASTFortranDataGroup >> addDataVariable: anObject [
	<generated>
	^ self dataVariables add: anObject
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

{ #category : #accessing }
FASTFortranDataGroup >> dataStatement [
	"Relation named: #dataStatement type: #FASTFortranDataStatement opposite: #dataGroups"

	<generated>
	<container>
	^ dataStatement
]

{ #category : #accessing }
FASTFortranDataGroup >> dataStatement: anObject [

	<generated>
	dataStatement := anObject
]

{ #category : #navigation }
FASTFortranDataGroup >> dataStatementGroup [
	<generated>
	<navigation: 'DataStatement'>
	^ MooseSpecializedGroup with: self dataStatement
]

{ #category : #accessing }
FASTFortranDataGroup >> dataVariables [
	"Relation named: #dataVariables type: #FASTFortranVariable opposite: #parentDataStatement"

	<generated>
	<derived>
	^ dataVariables
]

{ #category : #accessing }
FASTFortranDataGroup >> dataVariables: anObject [

	<generated>
	dataVariables value: anObject
]
