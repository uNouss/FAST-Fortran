"
I represent a call to a function (or function statement)
"
Class {
	#name : #FASTFortranFunctionCall,
	#superclass : #FASTFortranExpression,
	#traits : 'FASTFortranTAssigneable + FASTFortranTWithArguments',
	#classTraits : 'FASTFortranTAssigneable classTrait + FASTFortranTWithArguments classTrait',
	#instVars : [
		'#function => FMOne type: #FASTFortranTCallable opposite: #parentFunctionCall'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranFunctionCall class >> annotation [

	<FMClass: #FunctionCall super: #FASTFortranExpression>
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
