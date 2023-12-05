Trait {
	#name : #FASTFortranTWithIOParameters,
	#instVars : [
		'#iOParameter => FMMany type: #FASTFortranTIOParameter opposite: #parentIOStatement'
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
FASTFortranTWithIOParameters >> addIOParameter: anObject [
	<generated>
	^ self iOParameter add: anObject
]

{ #category : #accessing }
FASTFortranTWithIOParameters >> iOParameter [
	"Relation named: #iOParameter type: #FASTFortranTIOParameter opposite: #parentIOStatement"

	<generated>
	<derived>
	^ iOParameter
]

{ #category : #accessing }
FASTFortranTWithIOParameters >> iOParameter: anObject [

	<generated>
	iOParameter value: anObject
]

{ #category : #navigation }
FASTFortranTWithIOParameters >> iOParameterGroup [
	<generated>
	<navigation: 'IOParameter'>
	^ MooseSpecializedGroup withAll: self iOParameter asSet
]
