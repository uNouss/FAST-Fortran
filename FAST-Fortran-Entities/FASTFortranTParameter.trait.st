"
I can be a parameter
"
Trait {
	#name : #FASTFortranTParameter,
	#instVars : [
		'#parameterOwner => FMOne type: #FASTFortranTWithParameters opposite: #parameters'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTParameter classSide >> annotation [

	<FMClass: #TParameter super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTParameter >> parameterOwner [
	"Relation named: #parameterOwner type: #FASTFortranTWithParameters opposite: #parameters"

	<generated>
	<FMComment: 'parameterOwner'>
	<container>
	^ parameterOwner
]

{ #category : #accessing }
FASTFortranTParameter >> parameterOwner: anObject [

	<generated>
	parameterOwner := anObject
]

{ #category : #navigation }
FASTFortranTParameter >> parameterOwnerGroup [
	<generated>
	<navigation: 'ParameterOwner'>
	^ MooseSpecializedGroup with: self parameterOwner
]
