"
A return statement node. Contains a reference to the expression which is returned.  
"
Class {
	#name : #FASTFortranReturnStatement,
	#superclass : #FASTFortranStatement,
	#instVars : [
		'#alternateReturnLable => FMProperty',
		'#expression => FMOne type: #FASTFortranExpression opposite: #returnOwner'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranReturnStatement class >> annotation [

	<FMClass: #ReturnStatement super: #FASTFortranStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranReturnStatement >> alternateReturnLable [

	<FMProperty: #alternateReturnLable type: #String>
	<generated>
	<FMComment: 'Optional. Expression of type INTEGER or REAL'>
	^ alternateReturnLable
]

{ #category : #accessing }
FASTFortranReturnStatement >> alternateReturnLable: anObject [
	<generated>
	alternateReturnLable := anObject
]

{ #category : #accessing }
FASTFortranReturnStatement >> expression [
	"Relation named: #expression type: #FASTFortranExpression opposite: #returnOwner"

	<generated>
	<FMComment: 'The expression returned'>
	^ expression
]

{ #category : #accessing }
FASTFortranReturnStatement >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTFortranReturnStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
