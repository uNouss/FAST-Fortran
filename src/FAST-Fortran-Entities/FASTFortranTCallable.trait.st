"
I represent a callable entity (function or function statement)
"
Trait {
	#name : #FASTFortranTCallable,
	#instVars : [
		'#parentFunctionCall => FMOne type: #FASTFortranFunctionCall opposite: #function'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTCallable classSide >> annotation [

	<FMClass: #TCallable super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTCallable >> parentFunctionCall [
	"Relation named: #parentFunctionCall type: #FASTFortranFunctionCall opposite: #function"

	<generated>
	<FMComment: 'a parent function call'>
	<container>
	<derived>
	^ parentFunctionCall
]

{ #category : #accessing }
FASTFortranTCallable >> parentFunctionCall: anObject [

	<generated>
	parentFunctionCall := anObject
]

{ #category : #navigation }
FASTFortranTCallable >> parentFunctionCallGroup [
	<generated>
	<navigation: 'ParentFunctionCall'>
	^ MooseSpecializedGroup with: self parentFunctionCall
]
