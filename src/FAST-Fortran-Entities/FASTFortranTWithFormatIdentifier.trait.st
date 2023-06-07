"
I represent a statement with format identifier (print, write, ...)
"
Trait {
	#name : #FASTFortranTWithFormatIdentifier,
	#instVars : [
		'#format => FMOne type: #FASTFortranTFormatIdentifier opposite: #formatParentStatement'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTWithFormatIdentifier classSide >> annotation [

	<FMClass: #TWithFormatIdentifier super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTWithFormatIdentifier >> format [
	"Relation named: #format type: #FASTFortranTFormatIdentifier opposite: #formatParentStatement"

	<generated>
	<FMComment: 'format identifier'>
	^ format
]

{ #category : #accessing }
FASTFortranTWithFormatIdentifier >> format: anObject [

	<generated>
	format := anObject
]

{ #category : #navigation }
FASTFortranTWithFormatIdentifier >> formatGroup [
	<generated>
	<navigation: 'Format'>
	^ MooseSpecializedGroup with: self format
]
