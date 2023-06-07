"
The logical IF statement executes one single statement, or does not execute it, depending on the value of a logical expression.
"
Class {
	#name : #FASTFortranIfLogicalStatement,
	#superclass : #FASTFortranStatement,
	#instVars : [
		'#statement => FMOne type: #FASTFortranStatement opposite: #parentIfBlock',
		'#condition => FMOne type: #FASTFortranExpression opposite: #parentIfBlock'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranIfLogicalStatement class >> annotation [

	<FMClass: #IfLogicalStatement super: #FASTFortranStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranIfLogicalStatement >> condition [
	"Relation named: #condition type: #FASTFortranExpression opposite: #parentIfBlock"

	<generated>
	<FMComment: 'Condition'>
	^ condition
]

{ #category : #accessing }
FASTFortranIfLogicalStatement >> condition: anObject [

	<generated>
	condition := anObject
]

{ #category : #navigation }
FASTFortranIfLogicalStatement >> conditionGroup [
	<generated>
	<navigation: 'Condition'>
	^ MooseSpecializedGroup with: self condition
]

{ #category : #accessing }
FASTFortranIfLogicalStatement >> statement [
	"Relation named: #statement type: #FASTFortranStatement opposite: #parentIfBlock"

	<generated>
	<FMComment: 'Statement of the logical if'>
	^ statement
]

{ #category : #accessing }
FASTFortranIfLogicalStatement >> statement: anObject [

	<generated>
	statement := anObject
]

{ #category : #navigation }
FASTFortranIfLogicalStatement >> statementGroup [
	<generated>
	<navigation: 'Statement'>
	^ MooseSpecializedGroup with: self statement
]
