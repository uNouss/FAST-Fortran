"
A invocation of a behavioural entity
"
Trait {
	#name : #FASTFortranTInvocation,
	#instVars : [
		'#invoked => FMOne type: #FASTFortranTNamedEntity opposite: #invokedIn'
	],
	#traits : 'FASTFortranTExpression + FASTFortranTWithArguments',
	#classTraits : 'FASTFortranTExpression classTrait + FASTFortranTWithArguments classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTInvocation classSide >> annotation [

	<FMClass: #TInvocation super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTInvocation >> invoked [
	"Relation named: #invoked type: #FASTFortranTNamedEntity opposite: #invokedIn"

	<generated>
	<FMComment: 'The name of the behavioural invoked'>
	^ invoked
]

{ #category : #accessing }
FASTFortranTInvocation >> invoked: anObject [

	<generated>
	invoked := anObject
]
