"
I represent Fortran Do statement
"
Class {
	#name : #FASTFortranDoStatement,
	#superclass : #FASTFortranStatement,
	#instVars : [
		'#loopControl => FMOne type: #FASTFortranLoopControlExpression opposite: #parentLoop'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranDoStatement class >> annotation [

	<FMClass: #DoStatement super: #FASTFortranStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranDoStatement >> loopControl [
	"Relation named: #loopControl type: #FASTFortranLoopControlExpression opposite: #parentLoop"

	<generated>
	<FMComment: 'loop control'>
	^ loopControl
]

{ #category : #accessing }
FASTFortranDoStatement >> loopControl: anObject [

	<generated>
	loopControl := anObject
]

{ #category : #navigation }
FASTFortranDoStatement >> loopControlGroup [
	<generated>
	<navigation: 'LoopControl'>
	^ MooseSpecializedGroup with: self loopControl
]
