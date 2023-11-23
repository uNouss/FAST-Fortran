"
a Fortran Return Statement
"
Class {
	#name : #FASTFortranReturnStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTReturnStatement',
	#classTraits : 'FASTFortranTReturnStatement classTrait',
	#instVars : [
		'#alternateReturnLable => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranReturnStatement class >> annotation [

	<FMClass: #ReturnStatement super: #FASTFortranAbstractStatement>
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
