"
I represent an item that can be encountered in the iolist of certain statments (print)
"
Trait {
	#name : #FASTFortranTIOListMember,
	#instVars : [
		'#iolistParentStatement => FMOne type: #FASTFortranTWithIOList opposite: #iolist'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTIOListMember classSide >> annotation [

	<FMClass: #TIOListMember super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTIOListMember >> iolistParentStatement [
	"Relation named: #iolistParentStatement type: #FASTFortranTWithIOList opposite: #iolist"

	<generated>
	<FMComment: 'The owner of the iolist'>
	<container>
	^ iolistParentStatement
]

{ #category : #accessing }
FASTFortranTIOListMember >> iolistParentStatement: anObject [

	<generated>
	iolistParentStatement := anObject
]

{ #category : #navigation }
FASTFortranTIOListMember >> iolistParentStatementGroup [
	<generated>
	<navigation: 'IolistParentStatement'>
	^ MooseSpecializedGroup with: self iolistParentStatement
]
