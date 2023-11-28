"
I represent Fortran Do statement
"
Class {
	#name : #FASTFortranDoStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithLabelReferences',
	#classTraits : 'FASTFortranTWithLabelReferences classTrait',
	#instVars : [
		'#loopControl => FMOne type: #FASTFortranLoopControlExpression opposite: #parentLoop',
		'#statementBlock => FMOne type: #FASTFortranTStatementBlock opposite: #parentDoStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranDoStatement class >> annotation [

	<FMClass: #DoStatement super: #FASTFortranAbstractStatement>
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

{ #category : #accessing }
FASTFortranDoStatement >> statementBlock [
	"Relation named: #statementBlock type: #FASTFortranTStatementBlock opposite: #parentDoStatement"

	<generated>
	<FMComment: 'Statement block containing statements of the do body '>
	^ statementBlock
]

{ #category : #accessing }
FASTFortranDoStatement >> statementBlock: anObject [

	<generated>
	statementBlock := anObject
]

{ #category : #navigation }
FASTFortranDoStatement >> statementBlockGroup [
	<generated>
	<navigation: 'StatementBlock'>
	^ MooseSpecializedGroup with: self statementBlock
]
