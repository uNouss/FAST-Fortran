"
A node of a statement which is representing a single expression. 
"
Trait {
	#name : #FASTFortranTExpressionStatement,
	#instVars : [
		'#expression => FMOne type: #FASTFortranTExpression opposite: #expressionStatementOwner'
	],
	#traits : 'FASTFortranTStatement',
	#classTraits : 'FASTFortranTStatement classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTExpressionStatement classSide >> annotation [

	<FMClass: #TExpressionStatement super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTExpressionStatement >> expression [
	"Relation named: #expression type: #FASTFortranTExpression opposite: #expressionStatementOwner"

	<generated>
	<FMComment: 'The expression of the statement'>
	^ expression
]

{ #category : #accessing }
FASTFortranTExpressionStatement >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTFortranTExpressionStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
