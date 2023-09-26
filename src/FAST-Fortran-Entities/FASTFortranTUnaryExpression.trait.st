"
A trait representing an unary expression of a node of a source code.
"
Trait {
	#name : #FASTFortranTUnaryExpression,
	#instVars : [
		'#expression => FMOne type: #FASTFortranTExpression opposite: #parentExpression',
		'#operator => FMProperty'
	],
	#traits : 'FASTFortranTExpression',
	#classTraits : 'FASTFortranTExpression classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTUnaryExpression classSide >> annotation [

	<FMClass: #TUnaryExpression super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTUnaryExpression >> expression [
	"Relation named: #expression type: #FASTFortranTExpression opposite: #parentExpression"

	<generated>
	<FMComment: 'expression'>
	^ expression
]

{ #category : #accessing }
FASTFortranTUnaryExpression >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTFortranTUnaryExpression >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

{ #category : #accessing }
FASTFortranTUnaryExpression >> operator [

	<FMProperty: #operator type: #String>
	<generated>
	<FMComment: 'Unary expression operator'>
	^ operator
]

{ #category : #accessing }
FASTFortranTUnaryExpression >> operator: anObject [
	<generated>
	operator := anObject
]
