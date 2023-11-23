"
I represent Fortran Go To statement
"
Class {
	#name : #FASTFortranGoToStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTLabelledStatement',
	#classTraits : 'FASTFortranTLabelledStatement classTrait',
	#instVars : [
		'#label => FMOne type: #FASTFortranLabelReference opposite: #parentGotoStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranGoToStatement class >> annotation [

	<FMClass: #GoToStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranGoToStatement >> label [
	"Relation named: #label type: #FASTFortranLabelReference opposite: #parentGotoStatement"

	<generated>
	^ label
]

{ #category : #accessing }
FASTFortranGoToStatement >> label: anObject [

	<generated>
	label := anObject
]

{ #category : #navigation }
FASTFortranGoToStatement >> labelGroup [
	<generated>
	<navigation: 'Label'>
	^ MooseSpecializedGroup with: self label
]
