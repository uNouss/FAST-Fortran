"
I represent a reference to a Fortran label, like in a GoTo statement.
I contain the value of the label referred to
"
Class {
	#name : #FASTFortranLabelReference,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#label => FMProperty',
		'#parentGotoStatement => FMOne type: #FASTFortranGoToStatement opposite: #label',
		'#parentIfArithmeticEqualBranch => FMOne type: #FASTFortranIfArithmeticStatement opposite: #equalLabel',
		'#parentIfArithmeticLessBranch => FMOne type: #FASTFortranIfArithmeticStatement opposite: #lessLabel',
		'#parentIfArithmeticMoreBranch => FMOne type: #FASTFortranIfArithmeticStatement opposite: #greaterLabel'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranLabelReference class >> annotation [

	<FMClass: #LabelReference super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranLabelReference >> label [

	<FMProperty: #label type: #String>
	<generated>
	<FMComment: 'The value of the label. The value is an integer literal, stored in a String'>
	^ label
]

{ #category : #accessing }
FASTFortranLabelReference >> label: anObject [
	<generated>
	label := anObject
]

{ #category : #accessing }
FASTFortranLabelReference >> parentGotoStatement [
	"Relation named: #parentGotoStatement type: #FASTFortranGoToStatement opposite: #label"

	<generated>
	<container>
	<derived>
	^ parentGotoStatement
]

{ #category : #accessing }
FASTFortranLabelReference >> parentGotoStatement: anObject [

	<generated>
	parentGotoStatement := anObject
]

{ #category : #navigation }
FASTFortranLabelReference >> parentGotoStatementGroup [
	<generated>
	<navigation: 'ParentGotoStatement'>
	^ MooseSpecializedGroup with: self parentGotoStatement
]

{ #category : #accessing }
FASTFortranLabelReference >> parentIfArithmeticEqualBranch [
	"Relation named: #parentIfArithmeticEqualBranch type: #FASTFortranIfArithmeticStatement opposite: #equalLabel"

	<generated>
	<container>
	<derived>
	^ parentIfArithmeticEqualBranch
]

{ #category : #accessing }
FASTFortranLabelReference >> parentIfArithmeticEqualBranch: anObject [

	<generated>
	parentIfArithmeticEqualBranch := anObject
]

{ #category : #navigation }
FASTFortranLabelReference >> parentIfArithmeticEqualBranchGroup [
	<generated>
	<navigation: 'ParentIfArithmeticEqualBranch'>
	^ MooseSpecializedGroup with: self parentIfArithmeticEqualBranch
]

{ #category : #accessing }
FASTFortranLabelReference >> parentIfArithmeticLessBranch [
	"Relation named: #parentIfArithmeticLessBranch type: #FASTFortranIfArithmeticStatement opposite: #lessLabel"

	<generated>
	<container>
	<derived>
	^ parentIfArithmeticLessBranch
]

{ #category : #accessing }
FASTFortranLabelReference >> parentIfArithmeticLessBranch: anObject [

	<generated>
	parentIfArithmeticLessBranch := anObject
]

{ #category : #navigation }
FASTFortranLabelReference >> parentIfArithmeticLessBranchGroup [
	<generated>
	<navigation: 'ParentIfArithmeticLessBranch'>
	^ MooseSpecializedGroup with: self parentIfArithmeticLessBranch
]

{ #category : #accessing }
FASTFortranLabelReference >> parentIfArithmeticMoreBranch [
	"Relation named: #parentIfArithmeticMoreBranch type: #FASTFortranIfArithmeticStatement opposite: #greaterLabel"

	<generated>
	<container>
	<derived>
	^ parentIfArithmeticMoreBranch
]

{ #category : #accessing }
FASTFortranLabelReference >> parentIfArithmeticMoreBranch: anObject [

	<generated>
	parentIfArithmeticMoreBranch := anObject
]

{ #category : #navigation }
FASTFortranLabelReference >> parentIfArithmeticMoreBranchGroup [
	<generated>
	<navigation: 'ParentIfArithmeticMoreBranch'>
	^ MooseSpecializedGroup with: self parentIfArithmeticMoreBranch
]
