"
a Fortran Loop Control Expression
"
Class {
	#name : #FASTFortranLoopControlExpression,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTExpression',
	#classTraits : 'FASTFortranTExpression classTrait',
	#instVars : [
		'#init => FMProperty',
		'#increment => FMProperty',
		'#limit => FMProperty',
		'#parentLoop => FMOne type: #FASTFortranDoStatement opposite: #loopControl'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #'as yet unclassified' }
FASTFortranLoopControlExpression class >> annotation [

	<FMClass: #LoopControlExpression super: #FASTFortranEntity>
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

	<FMProperty: #init type: #String>
	<generated>
	<FMComment: 'Loop control initial value'>
	^ init
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> init: anObject [
	<generated>
	init := anObject
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
