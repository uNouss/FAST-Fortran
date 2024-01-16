"
A return statement node. Contains a reference to the expression which is returned.  

## Relations
======================

### Parents
- Relation: #parentIfStatement Type: #FASTFortranIfLogicalStatement Opposite: #statement Comment: Parent if statement
- Relation: #statementContainer Type: #FASTFortranTStatementBlock Opposite: #statements Comment: Block containing this statement.
### Children
- Relation: #expression Type: #FASTFortranTExpression Opposite: #returnOwner Comment: The expression returned

## Properties
======================

- Named: #endPos Type: Number
- Named: #endPos Type: Number
- Named: #label Type: String Comment: Determines the statement label which consists of 1 to 5 digits, with at least one nonzero
- Named: #startPos Type: Number
- Named: #startPos Type: Number

"
Trait {
	#name : #FASTFortranTReturnStatement,
	#instVars : [
		'#expression => FMOne type: #FASTFortranTExpression opposite: #returnOwner'
	],
	#traits : 'FASTFortranTStatement',
	#classTraits : 'FASTFortranTStatement classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTReturnStatement classSide >> annotation [

	<FMClass: #TReturnStatement super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTReturnStatement >> expression [
	"Relation named: #expression type: #FASTFortranTExpression opposite: #returnOwner"

	<generated>
	<FMComment: 'The expression returned'>
	^ expression
]

{ #category : #accessing }
FASTFortranTReturnStatement >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTFortranTReturnStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
