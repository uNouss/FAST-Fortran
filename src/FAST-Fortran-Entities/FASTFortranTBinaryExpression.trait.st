"
I represent a binary expression
"
Trait {
	#name : #FASTFortranTBinaryExpression,
	#instVars : [
		'#operator => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTBinaryExpression classSide >> annotation [

	<FMClass: #TBinaryExpression super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTBinaryExpression >> operator [

	<FMProperty: #operator type: #String>
	<generated>
	<FMComment: 'Operator of a binary expression'>
	^ operator
]

{ #category : #accessing }
FASTFortranTBinaryExpression >> operator: anObject [
	<generated>
	operator := anObject
]
