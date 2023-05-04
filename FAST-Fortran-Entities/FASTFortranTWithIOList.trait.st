"
I represent a statement with iolist (print, write, ...)
"
Trait {
	#name : #FASTFortranTWithIOList,
	#instVars : [
		'#iolist => FMMany type: #FASTFortranTIOListMember opposite: #iolistParentStatement'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTWithIOList classSide >> annotation [

	<FMClass: #TWithIOList super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranTWithIOList >> addIolist: anObject [
	<generated>
	^ self iolist add: anObject
]

{ #category : #accessing }
FASTFortranTWithIOList >> iolist [
	"Relation named: #iolist type: #FASTFortranTIOListMember opposite: #iolistParentStatement"

	<generated>
	<FMComment: 'iolist'>
	<derived>
	^ iolist
]

{ #category : #accessing }
FASTFortranTWithIOList >> iolist: anObject [

	<generated>
	iolist value: anObject
]

{ #category : #navigation }
FASTFortranTWithIOList >> iolistGroup [
	<generated>
	<navigation: 'Iolist'>
	^ MooseSpecializedGroup withAll: self iolist asSet
]
