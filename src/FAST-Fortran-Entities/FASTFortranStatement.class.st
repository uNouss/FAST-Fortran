"
An abstract subclass which represents a source code statemnet 
"
Class {
	#name : #FASTFortranStatement,
	#superclass : #FASTFortranScopableEntity,
	#instVars : [
		'#label => FMProperty',
		'#statementContainer => FMOne type: #FASTFortranStatementBlock opposite: #statements'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranStatement class >> annotation [

	<FMClass: #Statement super: #FASTFortranScopableEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranStatement >> label [

	<FMProperty: #label type: #String>
	<generated>
	<FMComment: 'Determines the statement label which consists of 1 to 5 digits, with at least one nonzero'>
	^ label
]

{ #category : #accessing }
FASTFortranStatement >> label: anObject [
	<generated>
	label := anObject
]

{ #category : #accessing }
FASTFortranStatement >> parentIfBlock [
	"Relation named: #parentIfBlock type: #FASTFortranIfBlockStatement opposite: #elseStatements"

	<generated>
	<FMComment: 'Parent if block'>
	<container>
	^ parentIfBlock
]

{ #category : #accessing }
FASTFortranStatement >> parentIfBlock: anObject [

	<generated>
	parentIfBlock := anObject
]

{ #category : #navigation }
FASTFortranStatement >> parentIfBlockGroup [
	<generated>
	<navigation: 'ParentIfBlock'>
	^ MooseSpecializedGroup with: self parentIfBlock
]

{ #category : #accessing }
FASTFortranStatement >> statementContainer [
	"Relation named: #statementContainer type: #FASTFortranStatementBlock opposite: #statements"

	<generated>
	<FMComment: 'Block containing this statement.'>
	<container>
	^ statementContainer
]

{ #category : #accessing }
FASTFortranStatement >> statementContainer: anObject [

	<generated>
	statementContainer := anObject
]

{ #category : #navigation }
FASTFortranStatement >> statementContainerGroup [
	<generated>
	<navigation: 'StatementContainer'>
	^ MooseSpecializedGroup with: self statementContainer
]
