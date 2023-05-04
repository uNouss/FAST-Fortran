"
Represents a generic behavioural entity which has parameters and local variables, as well as statements. 

Can represent a SmalltalkBlock, or a JavaLambda
Subclassed for NamedBehavioural as methods/functions

Has parameters , and a body (StatementBlock).
Local variables are intended to be stored in the local entities of the body
"
Class {
	#name : #FASTFortranBehaviouralEntity,
	#superclass : #FASTFortranScopableEntity,
	#traits : 'FASTFortranTWithParameters',
	#classTraits : 'FASTFortranTWithParameters classTrait',
	#instVars : [
		'#statementBlock => FMOne type: #FASTFortranStatementBlock opposite: #fastBehaviouralParent'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranBehaviouralEntity class >> annotation [

	<FMClass: #BehaviouralEntity super: #FASTFortranScopableEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranBehaviouralEntity >> statementBlock [
	"Relation named: #statementBlock type: #FASTFortranStatementBlock opposite: #fastBehaviouralParent"

	<generated>
	<FMComment: 'Statements block of the behavioural entity'>
	^ statementBlock
]

{ #category : #accessing }
FASTFortranBehaviouralEntity >> statementBlock: anObject [

	<generated>
	statementBlock := anObject
]

{ #category : #navigation }
FASTFortranBehaviouralEntity >> statementBlockGroup [
	<generated>
	<navigation: 'StatementBlock'>
	^ MooseSpecializedGroup with: self statementBlock
]
