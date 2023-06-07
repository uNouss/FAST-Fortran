"
I can be an argument
"
Trait {
	#name : #FASTFortranTArgument,
	#instVars : [
		'#argumentOwner => FMOne type: #FASTFortranTWithArguments opposite: #arguments'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTArgument classSide >> annotation [

	<FMClass: #TArgument super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTArgument >> argumentOwner [
	"Relation named: #argumentOwner type: #FASTFortranTWithArguments opposite: #arguments"

	<generated>
	<FMComment: 'my owner'>
	<container>
	^ argumentOwner
]

{ #category : #accessing }
FASTFortranTArgument >> argumentOwner: anObject [

	<generated>
	argumentOwner := anObject
]

{ #category : #navigation }
FASTFortranTArgument >> argumentOwnerGroup [
	<generated>
	<navigation: 'ArgumentOwner'>
	^ MooseSpecializedGroup with: self argumentOwner
]
