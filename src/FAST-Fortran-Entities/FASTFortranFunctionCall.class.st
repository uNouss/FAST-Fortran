"
I represent a call to a function (or function statement)
"
Class {
	#name : #FASTFortranFunctionCall,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTExpression + FASTFortranTWithArguments',
	#classTraits : 'FASTFortranTExpression classTrait + FASTFortranTWithArguments classTrait',
	#instVars : [
		'#function => FMOne type: #FASTFortranTCallable opposite: #parentFunctionCall'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranFunctionCall class >> annotation [

	<FMClass: #FunctionCall super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranFunctionCall >> function [
	"Relation named: #function type: #FASTFortranTCallable opposite: #parentFunctionCall"

	<generated>
	<FMComment: 'Function or function statement being called'>
	^ function
]

{ #category : #accessing }
FASTFortranFunctionCall >> function: anObject [

	<generated>
	function := anObject
]

{ #category : #navigation }
FASTFortranFunctionCall >> functionGroup [
	<generated>
	<navigation: 'Function'>
	^ MooseSpecializedGroup with: self function
]
