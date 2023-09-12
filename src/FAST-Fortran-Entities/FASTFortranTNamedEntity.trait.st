"
A entity with a name
"
Trait {
	#name : #FASTFortranTNamedEntity,
	#instVars : [
		'#name => FMProperty',
		'#invokedIn => FMOne type: #FASTFortranTInvocation opposite: #invoked'
	],
	#traits : 'FASTFortranTEntity',
	#classTraits : 'FASTFortranTEntity classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTNamedEntity classSide >> annotation [

	<FMClass: #TNamedEntity super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTNamedEntity >> invokedIn [
	"Relation named: #invokedIn type: #FASTFortranTInvocation opposite: #invoked"

	<generated>
	<FMComment: 'Optional invocation where this name is used'>
	<derived>
	^ invokedIn
]

{ #category : #accessing }
FASTFortranTNamedEntity >> invokedIn: anObject [

	<generated>
	invokedIn := anObject
]

{ #category : #accessing }
FASTFortranTNamedEntity >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
FASTFortranTNamedEntity >> name: anObject [
	<generated>
	name := anObject
]
