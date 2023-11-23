"
I represent a variable declarator: variable declared + optional initial value
"
Trait {
	#name : #FASTFortranTVariableDeclarator,
	#instVars : [
		'#parentDeclaration => FMOne type: #FASTFortranTWithDeclarators opposite: #declarators',
		'#expression => FMOne type: #FASTFortranTExpression opposite: #variableDeclaratorOwner',
		'#variable => FMOne type: #FASTFortranVariable opposite: #parentDeclarator'
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
	"Relation named: #variable type: #FASTFortranVariable opposite: #parentDeclarator"

	<generated>
	<FMComment: 'The variable that is being declared'>
	^ variable
]

{ #category : #accessing }
FASTFortranTVariableDeclarator >> variable: anObject [

	<generated>
	variable := anObject
]

{ #category : #navigation }
FASTFortranTVariableDeclarator >> variableGroup [
	<generated>
	<navigation: 'Variable'>
	^ MooseSpecializedGroup with: self variable
]
