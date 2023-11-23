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
		'#parentCommonStatement => FMOne type: #FASTFortranCommonStatement opposite: #variables',
		'#parentDeclaration => FMOne type: #FASTFortranVariableDeclarationStatement opposite: #declarators'
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
FASTFortranVariable >> parentCommonStatement [
	"Relation named: #parentCommonStatement type: #FASTFortranCommonStatement opposite: #variables"

	<generated>
	<FMComment: 'Parent common expression'>
	<container>
	<derived>
	^ parentCommonStatement
]

{ #category : #accessing }
FASTFortranVariable >> parentCommonStatement: anObject [

	<generated>
	parentCommonStatement := anObject
]

{ #category : #navigation }
FASTFortranVariable >> parentCommonStatementGroup [
	<generated>
	<navigation: 'ParentCommonStatement'>
	^ MooseSpecializedGroup with: self parentCommonStatement
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

{ #category : #accessing }
FASTFortranVariable >> parentDeclaration [
	"Relation named: #parentDeclaration type: #FASTFortranVariableDeclarationStatement opposite: #declarators"

	<generated>
	<FMComment: 'Parent declaration'>
	<container>
	^ parentDeclaration
]

{ #category : #accessing }
FASTFortranVariable >> parentDeclaration: anObject [

	<generated>
	parentDeclaration := anObject
]

{ #category : #navigation }
FASTFortranVariable >> parentDeclarationGroup [
	<generated>
	<navigation: 'ParentDeclaration'>
	^ MooseSpecializedGroup with: self parentDeclaration
]
