"
a Fortran Return Statement
"
Class {
	#name : #FASTFortranReturnStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTReturnStatement + FASTFortranTLabelledStatement',
	#classTraits : 'FASTFortranTReturnStatement classTrait + FASTFortranTLabelledStatement classTrait',
	#instVars : [
		'#alternateReturnLable => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranReturnStatement class >> annotation [

	<FMClass: #ReturnStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranReturnStatement >> alternateReturnLable [

	<FMProperty: #alternateReturnLable type: #String>
	<generated>
	<FMComment: 'Optional. Expression of type INTEGER or REAL'>
	^ alternateReturnLable
]

{ #category : #accessing }
FASTFortranReturnStatement >> alternateReturnLable: anObject [
	<generated>
	alternateReturnLable := anObject
]
