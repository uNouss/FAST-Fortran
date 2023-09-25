"
I represent an assignment expression as a part of assignment statement
"
Class {
	#name : #FASTFortranAssignmentExpression,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTExpression',
	#classTraits : 'FASTFortranTExpression classTrait',
	#instVars : [
		'#leftPart => FMOne type: #FASTFortranVariable opposite: #parentAssignmentExpression',
		'#rightPart => FMOne type: #FASTFortranVariable opposite: #parentAssignmentExpression',
		'#parentLoopControlExpresison => FMOne type: #FASTFortranLoopControlExpression opposite: #init'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAssignmentExpression class >> annotation [

	<FMClass: #AssignmentExpression super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranAssignmentExpression >> leftPart [
	"Relation named: #leftPart type: #FASTFortranVariable opposite: #parentAssignmentExpression"

	<generated>
	<FMComment: 'assignee'>
	^ leftPart
]

{ #category : #accessing }
FASTFortranAssignmentExpression >> leftPart: anObject [

	<generated>
	leftPart := anObject
]

{ #category : #navigation }
FASTFortranAssignmentExpression >> leftPartGroup [
	<generated>
	<navigation: 'LeftPart'>
	^ MooseSpecializedGroup with: self leftPart
]

{ #category : #accessing }
FASTFortranAssignmentExpression >> parentLoopControlExpresison [
	"Relation named: #parentLoopControlExpresison type: #FASTFortranLoopControlExpression opposite: #init"

	<generated>
	<FMComment: 'Parent loop control expresison'>
	<container>
	<derived>
	^ parentLoopControlExpresison
]

{ #category : #accessing }
FASTFortranAssignmentExpression >> parentLoopControlExpresison: anObject [

	<generated>
	parentLoopControlExpresison := anObject
]

{ #category : #navigation }
FASTFortranAssignmentExpression >> parentLoopControlExpresisonGroup [
	<generated>
	<navigation: 'ParentLoopControlExpresison'>
	^ MooseSpecializedGroup with: self parentLoopControlExpresison
]

{ #category : #accessing }
FASTFortranAssignmentExpression >> rightPart [
	"Relation named: #rightPart type: #FASTFortranVariable opposite: #parentAssignmentExpression"

	<generated>
	<FMComment: 'assigned'>
	^ rightPart
]

{ #category : #accessing }
FASTFortranAssignmentExpression >> rightPart: anObject [

	<generated>
	rightPart := anObject
]

{ #category : #navigation }
FASTFortranAssignmentExpression >> rightPartGroup [
	<generated>
	<navigation: 'RightPart'>
	^ MooseSpecializedGroup with: self rightPart
]
