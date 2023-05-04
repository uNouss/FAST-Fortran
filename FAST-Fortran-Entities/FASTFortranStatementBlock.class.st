"
A block of statements as ones in C-like langs with {}
"
Class {
	#name : #FASTFortranStatementBlock,
	#superclass : #FASTFortranStatement,
	#instVars : [
		'#fastBehaviouralParent => FMOne type: #FASTFortranBehaviouralEntity opposite: #statementBlock',
		'#statements => FMMany type: #FASTFortranStatement opposite: #statementContainer'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranStatementBlock class >> annotation [

	<FMClass: #StatementBlock super: #FASTFortranStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranStatementBlock >> addStatement: anObject [
	<generated>
	^ self statements add: anObject
]

{ #category : #accessing }
FASTFortranStatementBlock >> fastBehaviouralParent [
	"Relation named: #fastBehaviouralParent type: #FASTFortranBehaviouralEntity opposite: #statementBlock"

	<generated>
	<FMComment: 'Behavioural entity containing the statement block.'>
	<container>
	<derived>
	^ fastBehaviouralParent
]

{ #category : #accessing }
FASTFortranStatementBlock >> fastBehaviouralParent: anObject [

	<generated>
	fastBehaviouralParent := anObject
]

{ #category : #navigation }
FASTFortranStatementBlock >> fastBehaviouralParentGroup [
	<generated>
	<navigation: 'FastBehaviouralParent'>
	^ MooseSpecializedGroup with: self fastBehaviouralParent
]

{ #category : #accessing }
FASTFortranStatementBlock >> statements [
	"Relation named: #statements type: #FASTFortranStatement opposite: #statementContainer"

	<generated>
	<FMComment: 'Statements enclosed in this block'>
	<derived>
	^ statements
]

{ #category : #accessing }
FASTFortranStatementBlock >> statements: anObject [

	<generated>
	statements value: anObject
]

{ #category : #navigation }
FASTFortranStatementBlock >> statementsGroup [
	<generated>
	<navigation: 'Statements'>
	^ MooseSpecializedGroup withAll: self statements asSet
]
