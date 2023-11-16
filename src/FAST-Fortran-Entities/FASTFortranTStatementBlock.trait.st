"
A block of statements as ones in C-like langs with {}
"
Trait {
	#name : #FASTFortranTStatementBlock,
	#instVars : [
		'#fastBehaviouralParent => FMOne type: #FASTFortranTBehaviouralEntity opposite: #statementBlock',
		'#parentDoStatement => FMOne type: #FASTFortranDoStatement opposite: #statementBlock',
		'#parentIfBlock => FMOne type: #FASTFortranIfBlockStatement opposite: #thenStatementBlock',
		'#statements => FMMany type: #FASTFortranTStatement opposite: #statementContainer'
	],
	#traits : 'FASTFortranTStatement',
	#classTraits : 'FASTFortranTStatement classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTStatementBlock classSide >> annotation [

	<FMClass: #TStatementBlock super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FASTFortranTStatementBlock >> addStatement: anObject [
	<generated>
	^ self statements add: anObject
]

{ #category : #accessing }
FASTFortranTStatementBlock >> fastBehaviouralParent [
	"Relation named: #fastBehaviouralParent type: #FASTFortranTBehaviouralEntity opposite: #statementBlock"

	<generated>
	<FMComment: 'Behavioural entity containing the statement block.'>
	<container>
	<derived>
	^ fastBehaviouralParent
]

{ #category : #accessing }
FASTFortranTStatementBlock >> fastBehaviouralParent: anObject [

	<generated>
	fastBehaviouralParent := anObject
]

{ #category : #navigation }
FASTFortranTStatementBlock >> fastBehaviouralParentGroup [
	<generated>
	<navigation: 'FastBehaviouralParent'>
	^ MooseSpecializedGroup with: self fastBehaviouralParent
]

{ #category : #accessing }
FASTFortranTStatementBlock >> parentDoStatement [
	"Relation named: #parentDoStatement type: #FASTFortranDoStatement opposite: #statementBlock"

	<generated>
	<FMComment: 'Parent do statement'>
	<container>
	<derived>
	^ parentDoStatement
]

{ #category : #accessing }
FASTFortranTStatementBlock >> parentDoStatement: anObject [

	<generated>
	parentDoStatement := anObject
]

{ #category : #navigation }
FASTFortranTStatementBlock >> parentDoStatementGroup [
	<generated>
	<navigation: 'ParentDoStatement'>
	^ MooseSpecializedGroup with: self parentDoStatement
]

{ #category : #accessing }
FASTFortranTStatementBlock >> parentIfBlock [
	"Relation named: #parentIfBlock type: #FASTFortranIfBlockStatement opposite: #thenStatementBlock"

	<generated>
	<FMComment: 'Parent if block'>
	<container>
	<derived>
	^ parentIfBlock
]

{ #category : #accessing }
FASTFortranTStatementBlock >> parentIfBlock: anObject [

	<generated>
	parentIfBlock := anObject
]

{ #category : #navigation }
FASTFortranTStatementBlock >> parentIfBlockGroup [
	<generated>
	<navigation: 'ParentIfBlock'>
	^ MooseSpecializedGroup with: self parentIfBlock
]

{ #category : #accessing }
FASTFortranTStatementBlock >> statements [
	"Relation named: #statements type: #FASTFortranTStatement opposite: #statementContainer"

	<generated>
	<FMComment: 'Statements enclosed in this block'>
	<derived>
	^ statements
]

{ #category : #accessing }
FASTFortranTStatementBlock >> statements: anObject [

	<generated>
	statements value: anObject
]

{ #category : #navigation }
FASTFortranTStatementBlock >> statementsGroup [
	<generated>
	<navigation: 'Statements'>
	^ MooseSpecializedGroup withAll: self statements asSet
]
