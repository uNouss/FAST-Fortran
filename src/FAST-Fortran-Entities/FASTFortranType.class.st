"
I represent Fortran Type statement
"
Class {
	#name : #FASTFortranType,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#parentDeclaration => FMOne type: #FASTFortranDeclarationStatement opposite: #type',
		'#parentDimensionStatement => FMOne type: #FASTFortranDimensionStatement opposite: #arrays',
		'#size => FMProperty',
		'#typedFunctions => FMMany type: #FASTFortranFunction opposite: #returnType'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranType class >> annotation [

	<FMClass: #Type super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranType >> addTypedFunction: anObject [
	<generated>
	^ self typedFunctions add: anObject
]

{ #category : #accessing }
FASTFortranType >> parentDeclaration [
	"Relation named: #parentDeclaration type: #FASTFortranDeclarationStatement opposite: #type"

	<generated>
	<FMComment: 'Parent declaration'>
	<container>
	<derived>
	^ parentDeclaration
]

{ #category : #accessing }
FASTFortranType >> parentDeclaration: anObject [

	<generated>
	parentDeclaration := anObject
]

{ #category : #navigation }
FASTFortranType >> parentDeclarationGroup [
	<generated>
	<navigation: 'ParentDeclaration'>
	^ MooseSpecializedGroup with: self parentDeclaration
]

{ #category : #accessing }
FASTFortranType >> parentDimensionStatement [
	"Relation named: #parentDimensionStatement type: #FASTFortranDimensionStatement opposite: #arrays"

	<generated>
	<FMComment: 'Parent dimension statement'>
	<container>
	^ parentDimensionStatement
]

{ #category : #accessing }
FASTFortranType >> parentDimensionStatement: anObject [

	<generated>
	parentDimensionStatement := anObject
]

{ #category : #navigation }
FASTFortranType >> parentDimensionStatementGroup [
	<generated>
	<navigation: 'ParentDimensionStatement'>
	^ MooseSpecializedGroup with: self parentDimensionStatement
]

{ #category : #accessing }
FASTFortranType >> size [

	<FMProperty: #size type: #Number>
	<generated>
	<FMComment: 'a data size in bytes'>
	^ size
]

{ #category : #accessing }
FASTFortranType >> size: anObject [
	<generated>
	size := anObject
]

{ #category : #accessing }
FASTFortranType >> typedFunctions [
	"Relation named: #typedFunctions type: #FASTFortranFunction opposite: #returnType"

	<generated>
	<derived>
	^ typedFunctions
]

{ #category : #accessing }
FASTFortranType >> typedFunctions: anObject [

	<generated>
	typedFunctions value: anObject
]
