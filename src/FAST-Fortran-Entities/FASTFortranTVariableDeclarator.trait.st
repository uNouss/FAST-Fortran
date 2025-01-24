"
I represent a variable declarator: variable declared + optional initial value

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentDeclaration` | `FASTFortranTVariableDeclarator` | `declarators` | `FASTFortranTWithDeclarators` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTFortranTVariableDeclarator` | `variableDeclaratorOwner` | `FASTFortranTExpression` | Expression assigned to the variable declared|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `variable` | `String` | nil | The name of the variable being declared|

"
Trait {
	#name : #FASTFortranTVariableDeclarator,
	#instVars : [
		'#variable => FMProperty',
		'#parentDeclaration => FMOne type: #FASTFortranTWithDeclarators opposite: #declarators',
		'#expression => FMOne type: #FASTFortranTExpression opposite: #variableDeclaratorOwner'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTVariableDeclarator classSide >> annotation [

	<FMClass: #TVariableDeclarator super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTVariableDeclarator >> expression [
	"Relation named: #expression type: #FASTFortranTExpression opposite: #variableDeclaratorOwner"

	<generated>
	<FMComment: 'Expression assigned to the variable declared'>
	^ expression
]

{ #category : #accessing }
FASTFortranTVariableDeclarator >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTFortranTVariableDeclarator >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

{ #category : #accessing }
FASTFortranTVariableDeclarator >> parentDeclaration [
	"Relation named: #parentDeclaration type: #FASTFortranTWithDeclarators opposite: #declarators"

	<generated>
	<container>
	^ parentDeclaration
]

{ #category : #accessing }
FASTFortranTVariableDeclarator >> parentDeclaration: anObject [

	<generated>
	parentDeclaration := anObject
]

{ #category : #navigation }
FASTFortranTVariableDeclarator >> parentDeclarationGroup [
	<generated>
	<navigation: 'ParentDeclaration'>
	^ MooseSpecializedGroup with: self parentDeclaration
]

{ #category : #accessing }
FASTFortranTVariableDeclarator >> variable [

	<FMProperty: #variable type: #String>
	<generated>
	<FMComment: 'The name of the variable being declared'>
	^ variable
]

{ #category : #accessing }
FASTFortranTVariableDeclarator >> variable: anObject [
	<generated>
	variable := anObject
]
