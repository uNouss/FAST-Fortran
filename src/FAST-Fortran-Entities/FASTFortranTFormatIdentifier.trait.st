"
I represent a format identifier
"
Trait {
	#name : #FASTFortranTFormatIdentifier,
	#instVars : [
		'#formatParentStatement => FMOne type: #FASTFortranTWithFormatIdentifier opposite: #format'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTFormatIdentifier classSide >> annotation [

	<FMClass: #TFormatIdentifier super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTFormatIdentifier >> formatParentStatement [
	"Relation named: #formatParentStatement type: #FASTFortranTWithFormatIdentifier opposite: #format"

	<generated>
	<FMComment: 'The owner of the format identifier'>
	<container>
	<derived>
	^ formatParentStatement
]

{ #category : #accessing }
FASTFortranTFormatIdentifier >> formatParentStatement: anObject [

	<generated>
	formatParentStatement := anObject
]

{ #category : #navigation }
FASTFortranTFormatIdentifier >> formatParentStatementGroup [
	<generated>
	<navigation: 'FormatParentStatement'>
	^ MooseSpecializedGroup with: self formatParentStatement
]
