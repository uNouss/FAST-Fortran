"
an abstract Fortran Variable, could be an array or a scalar
"
Class {
	#name : #FASTFortranVariable,
	#superclass : #FASTFortranAbstractExpression,
	#traits : 'FASTFortranTEntryStatement + FASTFortranTVariableEntity',
	#classTraits : 'FASTFortranTEntryStatement classTrait + FASTFortranTVariableEntity classTrait',
	#instVars : [
		'#name => FMProperty',
		'#parentCommonGroup => FMOne type: #FASTFortranCommonGroup opposite: #variables'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranVariable class >> annotation [

	<FMClass: #Variable super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranVariable >> name [

	<FMProperty: #name type: #String>
	<generated>
	<FMComment: 'Determines the variable name'>
	^ name
]

{ #category : #accessing }
FASTFortranVariable >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
FASTFortranVariable >> parentCommonGroup [
	"Relation named: #parentCommonGroup type: #FASTFortranCommonGroup opposite: #variables"

	<generated>
	<FMComment: 'Parent common group'>
	<container>
	^ parentCommonGroup
]

{ #category : #accessing }
FASTFortranVariable >> parentCommonGroup: anObject [

	<generated>
	parentCommonGroup := anObject
]

{ #category : #navigation }
FASTFortranVariable >> parentCommonGroupGroup [
	<generated>
	<navigation: 'ParentCommonGroup'>
	^ MooseSpecializedGroup with: self parentCommonGroup
]

{ #category : #accessing }
FASTFortranVariable >> parentDataStatement [
	"Relation named: #parentDataStatement type: #FASTFortranDataGroup opposite: #dataVariables"

	<generated>
	^ parentDataStatement
]

{ #category : #accessing }
FASTFortranVariable >> parentDataStatement: anObject [

	<generated>
	parentDataStatement := anObject
]
