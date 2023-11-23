"
I represent Fortran Pause statement
"
Class {
	#name : #FASTFortranPauseStatement,
	#superclass : #FASTFortranAbstractStatement,
	#instVars : [
		'#displayArgument => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranPauseStatement class >> annotation [

	<FMClass: #PauseStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranPauseStatement >> displayArgument [

	<FMProperty: #displayArgument type: #String>
	<generated>
	<FMComment: 'Optional. Displayed when the program pauses. String of no more that 5 digits or a character constant'>
	^ displayArgument
]

{ #category : #accessing }
FASTFortranPauseStatement >> displayArgument: anObject [
	<generated>
	displayArgument := anObject
]
