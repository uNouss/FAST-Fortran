"
a Fortran Loop Control Expression

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
| `parentLoop` | `FASTFortranLoopControlExpression` | `loopControl` | `FASTFortranTWithLoopControl` | Parent loop|

### Children
| Relation | Origin | Opposite | Type | Comment |
| `increment` | `FASTFortranLoopControlExpression` | `parentLoopControlIncrement` | `FASTFortranTExpression` | Loop control increment value|
| `init` | `FASTFortranLoopControlExpression` | `parentLoopControlInitialization` | `FASTFortranAssignmentExpression` | initial assignment|
| `limit` | `FASTFortranLoopControlExpression` | `parentLoopControlLimit` | `FASTFortranTExpression` | Loop control limit value|



"
Class {
	#name : #FASTFortranLoopControlExpression,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#parentLoop => FMOne type: #FASTFortranTWithLoopControl opposite: #loopControl',
		'#init => FMOne type: #FASTFortranAssignmentExpression opposite: #parentLoopControlInitialization',
		'#increment => FMOne type: #FASTFortranTExpression opposite: #parentLoopControlIncrement',
		'#limit => FMOne type: #FASTFortranTExpression opposite: #parentLoopControlLimit'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranLoopControlExpression class >> annotation [

	<FMClass: #LoopControlExpression super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> increment [
	"Relation named: #increment type: #FASTFortranTExpression opposite: #parentLoopControlIncrement"

	<generated>
	<FMComment: 'Loop control increment value'>
	^ increment
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> increment: anObject [

	<generated>
	increment := anObject
]

{ #category : #navigation }
FASTFortranLoopControlExpression >> incrementGroup [
	<generated>
	<navigation: 'Increment'>
	^ MooseSpecializedGroup with: self increment
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> init [
	"Relation named: #init type: #FASTFortranAssignmentExpression opposite: #parentLoopControlInitialization"

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
	"Relation named: #limit type: #FASTFortranTExpression opposite: #parentLoopControlLimit"

	<generated>
	<FMComment: 'Loop control limit value'>
	^ limit
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> limit: anObject [

	<generated>
	limit := anObject
]

{ #category : #navigation }
FASTFortranLoopControlExpression >> limitGroup [
	<generated>
	<navigation: 'Limit'>
	^ MooseSpecializedGroup with: self limit
]

{ #category : #accessing }
FASTFortranLoopControlExpression >> parentLoop [
	"Relation named: #parentLoop type: #FASTFortranTWithLoopControl opposite: #loopControl"

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
