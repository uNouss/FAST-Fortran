"
I represent a parameter to an IO-statement (read or write)
"
Trait {
	#name : #FASTFortranTIOParameter,
	#instVars : [
		'#parentIOStatement => FMOne type: #FASTFortranTWithIOParameters opposite: #iOParameter'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTIOParameter classSide >> annotation [

	<FMClass: #TIOParameter super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTIOParameter >> parentIOStatement [
	"Relation named: #parentIOStatement type: #FASTFortranTWithIOParameters opposite: #iOParameter"

	<generated>
	<container>
	^ parentIOStatement
]

{ #category : #accessing }
FASTFortranTIOParameter >> parentIOStatement: anObject [

	<generated>
	parentIOStatement := anObject
]

{ #category : #navigation }
FASTFortranTIOParameter >> parentIOStatementGroup [
	<generated>
	<navigation: 'ParentIOStatement'>
	^ MooseSpecializedGroup with: self parentIOStatement
]
