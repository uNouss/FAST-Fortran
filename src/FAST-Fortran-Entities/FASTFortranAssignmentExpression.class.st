"
I represent an assignment expression as a part of assignment statement
"
Class {
	#name : #FASTFortranAssignmentExpression,
	#superclass : #FASTFortranAbstractExpression,
	#traits : 'FASTFortranTAssignment',
	#classTraits : 'FASTFortranTAssignment classTrait',
	#instVars : [
		'#parentLoopControlExpresison => FMOne type: #FASTFortranLoopControlExpression opposite: #init'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAssignmentExpression class >> annotation [

	<FMClass: #AssignmentExpression super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
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
