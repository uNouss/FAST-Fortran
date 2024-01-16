"
I represent a declaration with several variable declarators

## Relations
======================

### Children
- Relation: #declarators Type: #FASTFortranTVariableDeclarator Opposite: #parentDeclaration Comment: variables declared


"
Trait {
	#name : #FASTFortranTWithDeclarators,
	#instVars : [
		'#declarators => FMMany type: #FASTFortranTVariableDeclarator opposite: #parentDeclaration'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTWithDeclarators classSide >> annotation [

	<FMClass: #TWithDeclarators super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranTWithDeclarators >> addDeclarator: anObject [
	<generated>
	^ self declarators add: anObject
]

{ #category : #accessing }
FASTFortranTWithDeclarators >> declarators [
	"Relation named: #declarators type: #FASTFortranTVariableDeclarator opposite: #parentDeclaration"

	<generated>
	<FMComment: 'variables declared'>
	<derived>
	^ declarators
]

{ #category : #accessing }
FASTFortranTWithDeclarators >> declarators: anObject [

	<generated>
	declarators value: anObject
]

{ #category : #navigation }
FASTFortranTWithDeclarators >> declaratorsGroup [
	<generated>
	<navigation: 'Declarators'>
	^ MooseSpecializedGroup withAll: self declarators asSet
]
