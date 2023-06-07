"
For entities with comments. In FAST, they are called containers. 
"
Trait {
	#name : #FASTFortranTWithComments,
	#instVars : [
		'#comments => FMMany type: #FASTFortranTComment opposite: #container'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTWithComments classSide >> annotation [

	<FMClass: #TWithComments super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranTWithComments >> addComment: anObject [
	<generated>
	^ self comments add: anObject
]

{ #category : #accessing }
FASTFortranTWithComments >> comments [
	"Relation named: #comments type: #FASTFortranTComment opposite: #container"

	<generated>
	<FMComment: 'list of comments defined in the entity'>
	<derived>
	^ comments
]

{ #category : #accessing }
FASTFortranTWithComments >> comments: anObject [

	<generated>
	comments value: anObject
]
