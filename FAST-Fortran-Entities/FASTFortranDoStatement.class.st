"
I represent Fortran Do statement
"
Class {
	#name : #FASTFortranDoStatement,
	#superclass : #FASTFortranStatement,
	#instVars : [
		'#loopControl => FMOne type: #FASTFortranLoopControlExpression opposite: #parentLoop',
		'#statements => FMMany type: #FASTFortranScopableEntity opposite: #parentDoStatement'
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

{ #category : #adding }
FASTFortranDoStatement >> addStatement: anObject [
	<generated>
	^ self statements add: anObject
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

{ #category : #accessing }
FASTFortranDoStatement >> statements [
	"Relation named: #statements type: #FASTFortranScopableEntity opposite: #parentDoStatement"

	<generated>
	<FMComment: 'Statements of the do body '>
	<derived>
	^ statements
]

{ #category : #accessing }
FASTFortranDoStatement >> statements: anObject [

	<generated>
	statements value: anObject
]

{ #category : #navigation }
FASTFortranDoStatement >> statementsGroup [
	<generated>
	<navigation: 'Statements'>
	^ MooseSpecializedGroup withAll: self statements asSet
]
