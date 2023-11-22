"
I represent Fortran If (Arithmetic) statement
"
Class {
	#name : #FASTFortranIfArithmeticStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTConditionalStatement + FASTFortranTLabelledStatement',
	#classTraits : 'FASTFortranTConditionalStatement classTrait + FASTFortranTLabelledStatement classTrait',
	#instVars : [
		'#equalLabel => FMOne type: #FASTFortranLabelReference opposite: #parentIfArithmeticEqualBranch',
		'#lessLabel => FMOne type: #FASTFortranLabelReference opposite: #parentIfArithmeticLessBranch',
		'#moreLabel => FMOne type: #FASTFortranLabelReference opposite: #parentIfArithmeticMoreBranch'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranIfArithmeticStatement class >> annotation [

	<FMClass: #IfArithmeticStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranIfArithmeticStatement >> equalLabel [
	"Relation named: #equalLabel type: #FASTFortranLabelReference opposite: #parentIfArithmeticEqualBranch"

	<generated>
	^ equalLabel
]

{ #category : #accessing }
FASTFortranIfArithmeticStatement >> equalLabel: anObject [

	<generated>
	equalLabel := anObject
]

{ #category : #navigation }
FASTFortranIfArithmeticStatement >> equalLabelGroup [
	<generated>
	<navigation: 'EqualLabel'>
	^ MooseSpecializedGroup with: self equalLabel
]

{ #category : #accessing }
FASTFortranIfArithmeticStatement >> lessLabel [
	"Relation named: #lessLabel type: #FASTFortranLabelReference opposite: #parentIfArithmeticLessBranch"

	<generated>
	^ lessLabel
]

{ #category : #accessing }
FASTFortranIfArithmeticStatement >> lessLabel: anObject [

	<generated>
	lessLabel := anObject
]

{ #category : #navigation }
FASTFortranIfArithmeticStatement >> lessLabelGroup [
	<generated>
	<navigation: 'LessLabel'>
	^ MooseSpecializedGroup with: self lessLabel
]

{ #category : #accessing }
FASTFortranIfArithmeticStatement >> moreLabel [
	"Relation named: #moreLabel type: #FASTFortranLabelReference opposite: #parentIfArithmeticMoreBranch"

	<generated>
	^ moreLabel
]

{ #category : #accessing }
FASTFortranIfArithmeticStatement >> moreLabel: anObject [

	<generated>
	moreLabel := anObject
]

{ #category : #navigation }
FASTFortranIfArithmeticStatement >> moreLabelGroup [
	<generated>
	<navigation: 'MoreLabel'>
	^ MooseSpecializedGroup with: self moreLabel
]
