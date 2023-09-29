"
an abstract Fortran Variable, could be an array or a scalar
"
Class {
	#name : #FASTFortranVariable,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTExpression + FASTFortranTVariableEntity',
	#classTraits : 'FASTFortranTExpression classTrait + FASTFortranTVariableEntity classTrait',
	#instVars : [
		'#name => FMProperty',
		'#parentAssignmentExpression => FMOne type: #FASTFortranAssignmentExpression opposite: #leftPart',
		'#parentCommonStatement => FMOne type: #FASTFortranCommonStatement opposite: #variables',
		'#parentDeclaration => FMOne type: #FASTFortranDeclarationStatement opposite: #declarators'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranVariable class >> annotation [

	<FMClass: #Variable super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranVariable >> name [

	<FMProperty: #name type: #String>
	<generated>
	<FMComment: 'Determines the variable name'>
	^ name
]

{ #category : #accessing }
FASTFortranVariable >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
FASTFortranVariable >> parentAssignmentExpression [
	"Relation named: #parentAssignmentExpression type: #FASTFortranAssignmentExpression opposite: #leftPart"

	<generated>
	<FMComment: 'Parent assignment expression'>
	<container>
	<derived>
	^ parentAssignmentExpression
]

{ #category : #accessing }
FASTFortranVariable >> parentAssignmentExpression: anObject [

	<generated>
	parentAssignmentExpression := anObject
]

{ #category : #navigation }
FASTFortranVariable >> parentAssignmentExpressionGroup [
	<generated>
	<navigation: 'ParentAssignmentExpression'>
	^ MooseSpecializedGroup with: self parentAssignmentExpression
]

{ #category : #accessing }
FASTFortranVariable >> parentCommonStatement [
	"Relation named: #parentCommonStatement type: #FASTFortranCommonStatement opposite: #variables"

	<generated>
	<FMComment: 'Parent common expression'>
	<container>
	<derived>
	^ parentCommonStatement
]

{ #category : #accessing }
FASTFortranVariable >> parentCommonStatement: anObject [

	<generated>
	parentCommonStatement := anObject
]

{ #category : #navigation }
FASTFortranVariable >> parentCommonStatementGroup [
	<generated>
	<navigation: 'ParentCommonStatement'>
	^ MooseSpecializedGroup with: self parentCommonStatement
]

{ #category : #accessing }
FASTFortranVariable >> parentDeclaration [
	"Relation named: #parentDeclaration type: #FASTFortranDeclarationStatement opposite: #declarators"

	<generated>
	<FMComment: 'Parent declaration'>
	<container>
	^ parentDeclaration
]

{ #category : #accessing }
FASTFortranVariable >> parentDeclaration: anObject [

	<generated>
	parentDeclaration := anObject
]

{ #category : #navigation }
FASTFortranVariable >> parentDeclarationGroup [
	<generated>
	<navigation: 'ParentDeclaration'>
	^ MooseSpecializedGroup with: self parentDeclaration
]
