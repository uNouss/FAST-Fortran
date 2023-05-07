"
I represent Fortran If (BLock) statement
"
Class {
	#name : #FASTFortranIfBlockStatement,
	#superclass : #FASTFortranStatement,
	#instVars : [
		'#thenStatements => FMMany type: #FASTFortranScopableEntity opposite: #parentIfBlock',
		'#elseStatements => FMMany type: #FASTFortranStatement opposite: #parentIfBlock',
		'#condition => FMOne type: #FASTFortranExpression opposite: #parentIfBlock'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranIfBlockStatement class >> annotation [

	<FMClass: #IfBlockStatement super: #FASTFortranStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranIfBlockStatement >> addElseStatement: anObject [
	<generated>
	^ self elseStatements add: anObject
]

{ #category : #adding }
FASTFortranIfBlockStatement >> addThenStatement: anObject [
	<generated>
	^ self thenStatements add: anObject
]

{ #category : #accessing }
FASTFortranIfBlockStatement >> condition [
	"Relation named: #condition type: #FASTFortranExpression opposite: #parentIfBlock"

	<generated>
	<FMComment: 'Condition'>
	^ condition
]

{ #category : #accessing }
FASTFortranIfBlockStatement >> condition: anObject [

	<generated>
	condition := anObject
]

{ #category : #navigation }
FASTFortranIfBlockStatement >> conditionGroup [
	<generated>
	<navigation: 'Condition'>
	^ MooseSpecializedGroup with: self condition
]

{ #category : #accessing }
FASTFortranIfBlockStatement >> elseStatements [
	"Relation named: #elseStatements type: #FASTFortranStatement opposite: #parentIfBlock"

	<generated>
	<FMComment: 'Statements of the then branch '>
	<derived>
	^ elseStatements
]

{ #category : #accessing }
FASTFortranIfBlockStatement >> elseStatements: anObject [

	<generated>
	elseStatements value: anObject
]

{ #category : #navigation }
FASTFortranIfBlockStatement >> elseStatementsGroup [
	<generated>
	<navigation: 'ElseStatements'>
	^ MooseSpecializedGroup withAll: self elseStatements asSet
]

{ #category : #accessing }
FASTFortranIfBlockStatement >> thenStatements [
	"Relation named: #thenStatements type: #FASTFortranScopableEntity opposite: #parentIfBlock"

	<generated>
	<FMComment: 'Statements of the then branch '>
	<derived>
	^ thenStatements
]

{ #category : #accessing }
FASTFortranIfBlockStatement >> thenStatements: anObject [

	<generated>
	thenStatements value: anObject
]

{ #category : #navigation }
FASTFortranIfBlockStatement >> thenStatementsGroup [
	<generated>
	<navigation: 'ThenStatements'>
	^ MooseSpecializedGroup withAll: self thenStatements asSet
]
