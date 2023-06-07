"
a Fortran Expression
"
Class {
	#name : #FASTFortranExpression,
	#superclass : #FASTFortranScopableEntity,
	#traits : 'FASTFortranTAssigneable + FASTFortranTIOListMember',
	#classTraits : 'FASTFortranTAssigneable classTrait + FASTFortranTIOListMember classTrait',
	#instVars : [
		'#parentExpression => FMOne type: #FASTFortranArithmeticExpression opposite: #left'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranExpression class >> annotation [

	<FMClass: #Expression super: #FASTFortranScopableEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranExpression >> parentExpression [
	"Relation named: #parentExpression type: #FASTFortranArithmeticExpression opposite: #left"

	<generated>
	<FMComment: 'Parent expression (if possible)'>
	<container>
	<derived>
	^ parentExpression
]

{ #category : #accessing }
FASTFortranExpression >> parentExpression: anObject [

	<generated>
	parentExpression := anObject
]

{ #category : #navigation }
FASTFortranExpression >> parentExpressionGroup [
	<generated>
	<navigation: 'ParentExpression'>
	^ MooseSpecializedGroup with: self parentExpression
]

{ #category : #accessing }
FASTFortranExpression >> parentIfBlock [
	"Relation named: #parentIfBlock type: #FASTFortranIfBlockStatement opposite: #condition"

	<generated>
	<FMComment: 'Parent if block'>
	<container>
	<derived>
	^ parentIfBlock
]

{ #category : #accessing }
FASTFortranExpression >> parentIfBlock: anObject [

	<generated>
	parentIfBlock := anObject
]

{ #category : #navigation }
FASTFortranExpression >> parentIfBlockGroup [
	<generated>
	<navigation: 'ParentIfBlock'>
	^ MooseSpecializedGroup with: self parentIfBlock
]
