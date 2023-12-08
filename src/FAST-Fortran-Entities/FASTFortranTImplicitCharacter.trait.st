"
I represent a character or a character range in an IMPLICIT statement
"
Trait {
	#name : #FASTFortranTImplicitCharacter,
	#instVars : [
		'#parentImplicitRule => FMOne type: #FASTFortranImplicitTypingRule opposite: #implicitCharacter'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTImplicitCharacter classSide >> annotation [

	<FMClass: #TImplicitCharacter super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTImplicitCharacter >> parentImplicitRule [
	"Relation named: #parentImplicitRule type: #FASTFortranImplicitTypingRule opposite: #implicitCharacter"

	<generated>
	<container>
	<derived>
	^ parentImplicitRule
]

{ #category : #accessing }
FASTFortranTImplicitCharacter >> parentImplicitRule: anObject [

	<generated>
	parentImplicitRule := anObject
]

{ #category : #navigation }
FASTFortranTImplicitCharacter >> parentImplicitRuleGroup [
	<generated>
	<navigation: 'ParentImplicitRule'>
	^ MooseSpecializedGroup with: self parentImplicitRule
]
