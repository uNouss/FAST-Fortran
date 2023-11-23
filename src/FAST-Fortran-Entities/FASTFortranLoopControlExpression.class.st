"
a Fortran Loop Control Expression
"
Class {
	#name : #FASTFortranLoopControlExpression,
	#superclass : #FASTFortranAbstractExpression,
	#instVars : [
		'#increment => FMProperty',
		'#init => FMOne type: #FASTFortranAssignmentExpression opposite: #parentLoopControlExpresison',
		'#limit => FMProperty',
		'#parentLoop => FMOne type: #FASTFortranDoStatement opposite: #loopControl'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranLoopControlExpression class >> annotation [

	<FMClass: #LoopControlExpression super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> increment [

	<FMProperty: #increment type: #String>
	<generated>
	<FMComment: 'Loop control increment value'>
	^ increment
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> increment: anObject [
	<generated>
	increment := anObject
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> init [
	"Relation named: #init type: #FASTFortranAssignmentExpression opposite: #parentLoopControlExpresison"

	<generated>
	<FMComment: 'initial assignment'>
	^ init
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> init: anObject [

	<generated>
	init := anObject
]

{ #category : #navigation }
FASTFortranLoopControlExpression >> initGroup [
	<generated>
	<navigation: 'Init'>
	^ MooseSpecializedGroup with: self init
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> limit [

	<FMProperty: #limit type: #String>
	<generated>
	<FMComment: 'Loop control limit value'>
	^ limit
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> limit: anObject [
	<generated>
	limit := anObject
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> parentLoop [
	"Relation named: #parentLoop type: #FASTFortranDoStatement opposite: #loopControl"

	<generated>
	<FMComment: 'Parent loop'>
	<container>
	<derived>
	^ parentLoop
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> parentLoop: anObject [

	<generated>
	parentLoop := anObject
]

{ #category : #navigation }
FASTFortranLoopControlExpression >> parentLoopGroup [
	<generated>
	<navigation: 'ParentLoop'>
	^ MooseSpecializedGroup with: self parentLoop
]
