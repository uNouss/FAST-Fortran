"
I represent Fortran Type statement
"
Class {
	#name : #FASTFortranType,
	#superclass : #FASTFortranEntity,
	#instVars : [
		'#size => FMProperty',
		'#parentDeclaration => FMOne type: #FASTFortranDeclarationStatement opposite: #type'
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
