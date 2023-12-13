"
I represent a specifier in an inquire-statement
"
Trait {
	#name : #FASTFortranTInquireSpecifier,
	#instVars : [
		'#parentInquireStatement => FMOne type: #FASTFortranInquireStatement opposite: #specifiers'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTInquireSpecifier classSide >> annotation [

	<FMClass: #TInquireSpecifier super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTInquireSpecifier >> parentInquireStatement [
	"Relation named: #parentInquireStatement type: #FASTFortranInquireStatement opposite: #specifiers"

	<generated>
	<container>
	^ parentInquireStatement
]

{ #category : #accessing }
FASTFortranTInquireSpecifier >> parentInquireStatement: anObject [

	<generated>
	parentInquireStatement := anObject
]

{ #category : #navigation }
FASTFortranTInquireSpecifier >> parentInquireStatementGroup [
	<generated>
	<navigation: 'ParentInquireStatement'>
	^ MooseSpecializedGroup with: self parentInquireStatement
]
