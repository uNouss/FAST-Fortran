Trait {
	#name : #FASTFortranTWithIOParameters,
	#instVars : [
		'#ioParameters => FMMany type: #FASTFortranTIOParameter opposite: #parentIOStatement'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTWithIOParameters classSide >> annotation [

	<FMClass: #TWithIOParameters super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranTWithIOParameters >> addIoParameter: anObject [
	<generated>
	^ self ioParameters add: anObject
]

{ #category : #accessing }
FASTFortranTWithIOParameters >> ioParameters [
	"Relation named: #ioParameters type: #FASTFortranTIOParameter opposite: #parentIOStatement"

	<generated>
	<FMComment: 'I represent a statement with IO-parameters (read or write)'>
	<derived>
	^ ioParameters
]

{ #category : #accessing }
FASTFortranTWithIOParameters >> ioParameters: anObject [

	<generated>
	ioParameters value: anObject
]

{ #category : #navigation }
FASTFortranTWithIOParameters >> ioParametersGroup [
	<generated>
	<navigation: 'IoParameters'>
	^ MooseSpecializedGroup withAll: self ioParameters asSet
]
