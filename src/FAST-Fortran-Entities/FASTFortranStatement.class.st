"
a Fortran Statement
"
Class {
	#name : #FASTFortranStatement,
	#superclass : #FASTFortranScopableEntity,
	#instVars : [
		'#label => FMProperty'
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
