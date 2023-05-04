"
I have an assigneable
"
Trait {
	#name : #FASTFortranTWithAssigneable,
	#instVars : [
		'#variable => FMOne type: #FASTFortranTAssigneable opposite: #variableAssignementOwner'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTWithAssigneable classSide >> annotation [

	<FMClass: #TWithAssigneable super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTWithAssigneable >> variable [
	"Relation named: #variable type: #FASTFortranTAssigneable opposite: #variableAssignementOwner"

	<generated>
	<FMComment: 'My variable'>
	^ variable
]

{ #category : #accessing }
FASTFortranTWithAssigneable >> variable: anObject [

	<generated>
	variable := anObject
]

{ #category : #navigation }
FASTFortranTWithAssigneable >> variableGroup [
	<generated>
	<navigation: 'Variable'>
	^ MooseSpecializedGroup with: self variable
]
