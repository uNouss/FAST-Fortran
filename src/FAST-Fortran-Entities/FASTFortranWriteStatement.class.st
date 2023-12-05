"
I represent Fortran Write statement
"
Class {
	#name : #FASTFortranWriteStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithArguments + FASTFortranTWithIOParameters',
	#classTraits : 'FASTFortranTWithArguments classTrait + FASTFortranTWithIOParameters classTrait',
	#instVars : [
		'#format => FMOne type: #FASTFortranTExpression opposite: #parentWriteFormat'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranWriteStatement class >> annotation [

	<FMClass: #WriteStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranWriteStatement >> format [
	"Relation named: #format type: #FASTFortranTExpression opposite: #parentWriteFormat"

	<generated>
	^ format
]

{ #category : #accessing }
FASTFortranWriteStatement >> format: anObject [

	<generated>
	format := anObject
]

{ #category : #navigation }
FASTFortranWriteStatement >> formatGroup [
	<generated>
	<navigation: 'Format'>
	^ MooseSpecializedGroup with: self format
]
