"
An abstract subclass which represents a source code statemnet 
"
Trait {
	#name : #FASTFortranTStatement,
	#instVars : [
		'#statementContainer => FMOne type: #FASTFortranTStatementBlock opposite: #statements'
	],
	#traits : 'FASTFortranTEntity',
	#classTraits : 'FASTFortranTEntity classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTStatement classSide >> annotation [

	<FMClass: #TStatement super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #testing }
FASTFortranTStatement >> isStatement [

	<generated>
	^ true
]

{ #category : #accessing }
FASTFortranTStatement >> statementContainer [
	"Relation named: #statementContainer type: #FASTFortranTStatementBlock opposite: #statements"

	<generated>
	<FMComment: 'Block containing this statement.'>
	<container>
	^ statementContainer
]

{ #category : #accessing }
FASTFortranTStatement >> statementContainer: anObject [

	<generated>
	statementContainer := anObject
]

{ #category : #navigation }
FASTFortranTStatement >> statementContainerGroup [
	<generated>
	<navigation: 'StatementContainer'>
	^ MooseSpecializedGroup with: self statementContainer
]
