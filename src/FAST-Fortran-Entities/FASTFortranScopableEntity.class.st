"
a Fortran Scopable Entity (syntetic entity, not presented in the syntax)
"
Class {
	#name : #FASTFortranScopableEntity,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#parentProgramUnit => FMOne type: #FASTFortranProgramUnit opposite: #statements',
		'#parentDoStatement => FMOne type: #FASTFortranDoStatement opposite: #statements',
		'#parentIfBlock => FMOne type: #FASTFortranIfBlockStatement opposite: #thenStatements'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranScopableEntity class >> annotation [

	<FMClass: #ScopableEntity super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranScopableEntity >> parentDoStatement [
	"Relation named: #parentDoStatement type: #FASTFortranDoStatement opposite: #statements"

	<generated>
	<FMComment: 'Parent do statement'>
	<container>
	^ parentDoStatement
]

{ #category : #accessing }
FASTFortranScopableEntity >> parentDoStatement: anObject [

	<generated>
	parentDoStatement := anObject
]

{ #category : #navigation }
FASTFortranScopableEntity >> parentDoStatementGroup [
	<generated>
	<navigation: 'ParentDoStatement'>
	^ MooseSpecializedGroup with: self parentDoStatement
]

{ #category : #accessing }
FASTFortranScopableEntity >> parentIfBlock [
	"Relation named: #parentIfBlock type: #FASTFortranIfBlockStatement opposite: #thenStatements"

	<generated>
	<FMComment: 'Parent if block'>
	<container>
	^ parentIfBlock
]

{ #category : #accessing }
FASTFortranScopableEntity >> parentIfBlock: anObject [

	<generated>
	parentIfBlock := anObject
]

{ #category : #navigation }
FASTFortranScopableEntity >> parentIfBlockGroup [
	<generated>
	<navigation: 'ParentIfBlock'>
	^ MooseSpecializedGroup with: self parentIfBlock
]

{ #category : #accessing }
FASTFortranScopableEntity >> parentProgramUnit [
	"Relation named: #parentProgramUnit type: #FASTFortranProgramUnit opposite: #statements"

	<generated>
	<FMComment: 'Parent program unit'>
	<container>
	^ parentProgramUnit
]

{ #category : #accessing }
FASTFortranScopableEntity >> parentProgramUnit: anObject [

	<generated>
	parentProgramUnit := anObject
]

{ #category : #navigation }
FASTFortranScopableEntity >> parentProgramUnitGroup [
	<generated>
	<navigation: 'ParentProgramUnit'>
	^ MooseSpecializedGroup with: self parentProgramUnit
]
