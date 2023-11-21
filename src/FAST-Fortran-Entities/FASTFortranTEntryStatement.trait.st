"
I represent an argument in an entry statement: it can be a variable name, array name, formal procedure name, or an asterisk
"
Trait {
	#name : #FASTFortranTEntryStatement,
	#instVars : [
		'#entryStatement => FMOne type: #FASTFortranEntryStatement opposite: #entryArguments'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTEntryStatement classSide >> annotation [

	<FMClass: #TEntryStatement super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTEntryStatement >> entryStatement [
	"Relation named: #entryStatement type: #FASTFortranEntryStatement opposite: #entryArguments"

	<generated>
	<container>
	^ entryStatement
]

{ #category : #accessing }
FASTFortranTEntryStatement >> entryStatement: anObject [

	<generated>
	entryStatement := anObject
]

{ #category : #navigation }
FASTFortranTEntryStatement >> entryStatementGroup [
	<generated>
	<navigation: 'EntryStatement'>
	^ MooseSpecializedGroup with: self entryStatement
]
