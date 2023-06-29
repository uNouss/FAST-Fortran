"
an abstract Fortran Variable, could be an array or a scalar
"
Class {
	#name : #FASTFortranVariable,
	#superclass : #FASTFortranExpression,
	#instVars : [
		'#name => FMProperty',
		'#parentDeclaration => FMOne type: #FASTFortranDeclarationStatement opposite: #declarators',
		'#parentStatement => FMOne type: #FASTFortranWriteStatement opposite: #iolist'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranVariable class >> annotation [

	<FMClass: #Variable super: #FASTFortranExpression>
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

{ #category : #accessing }
FASTFortranVariable >> parentStatement [
	"Relation named: #parentStatement type: #FASTFortranWriteStatement opposite: #iolist"

	<generated>
	<FMComment: 'Parent write or print statement'>
	<container>
	^ parentStatement
]

{ #category : #accessing }
FASTFortranVariable >> parentStatement: anObject [

	<generated>
	parentStatement := anObject
]

{ #category : #navigation }
FASTFortranVariable >> parentStatementGroup [
	<generated>
	<navigation: 'ParentStatement'>
	^ MooseSpecializedGroup with: self parentStatement
]
