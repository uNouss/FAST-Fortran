"
A trait representing a binary expression of a node of a source code.
"
Trait {
	#name : #FASTFortranTBinaryExpression,
	#instVars : [
		'#operator => FMProperty',
		'#left => FMOne type: #FASTFortranTExpression opposite: #parentExpression',
		'#right => FMOne type: #FASTFortranTExpression opposite: #parentExpression'
	],
	#traits : 'FASTFortranTExpression',
	#classTraits : 'FASTFortranTExpression classTrait',
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
FASTFortranTBinaryExpression >> left [
	"Relation named: #left type: #FASTFortranTExpression opposite: #parentExpression"

	<generated>
	<FMComment: 'left part of a binary expression'>
	^ left
]

{ #category : #accessing }
FASTFortranTBinaryExpression >> left: anObject [

	<generated>
	left := anObject
]

{ #category : #navigation }
FASTFortranTBinaryExpression >> leftGroup [
	<generated>
	<navigation: 'Left'>
	^ MooseSpecializedGroup with: self left
]

{ #category : #accessing }
FASTFortranTBinaryExpression >> operator [

	<FMProperty: #operator type: #String>
	<generated>
	<FMComment: 'Binary expression operator'>
	^ operator
]

{ #category : #accessing }
FASTFortranTBinaryExpression >> operator: anObject [
	<generated>
	operator := anObject
]

{ #category : #accessing }
FASTFortranTBinaryExpression >> right [
	"Relation named: #right type: #FASTFortranTExpression opposite: #parentExpression"

	<generated>
	<FMComment: 'left part of the expression'>
	^ right
]

{ #category : #accessing }
FASTFortranTBinaryExpression >> right: anObject [

	<generated>
	right := anObject
]

{ #category : #navigation }
FASTFortranTBinaryExpression >> rightGroup [
	<generated>
	<navigation: 'Right'>
	^ MooseSpecializedGroup with: self right
]
