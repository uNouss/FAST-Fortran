"
assignable entity
"
Trait {
	#name : #FASTFortranTAssigneable,
	#instVars : [
		'#parentExpression => FMOne type: #FASTFortranBinaryExpression opposite: #left',
		'#variableAssignementOwner => FMOne type: #FASTFortranTWithAssigneable opposite: #variable',
		'#assignementExpressionOwner => FMOne type: #FASTFortranAssignmentStatement opposite: #expression'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTAssigneable classSide >> annotation [

	<FMClass: #TAssigneable super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTAssigneable >> assignementExpressionOwner [
	"Relation named: #assignementExpressionOwner type: #FASTFortranAssignmentStatement opposite: #expression"

	<generated>
	<FMComment: 'The AssignementExpression owner (if possible)'>
	<container>
	<derived>
	^ assignementExpressionOwner
]

{ #category : #accessing }
FASTFortranTAssigneable >> assignementExpressionOwner: anObject [

	<generated>
	assignementExpressionOwner := anObject
]

{ #category : #navigation }
FASTFortranTAssigneable >> assignementExpressionOwnerGroup [
	<generated>
	<navigation: 'AssignementExpressionOwner'>
	^ MooseSpecializedGroup with: self assignementExpressionOwner
]

{ #category : #accessing }
FASTFortranTAssigneable >> parentExpression [
	"Relation named: #parentExpression type: #FASTFortranBinaryExpression opposite: #left"

	<generated>
	<FMComment: 'Parent expression (if possible)'>
	<container>
	<derived>
	^ parentExpression
]

{ #category : #accessing }
FASTFortranTAssigneable >> parentExpression: anObject [

	<generated>
	parentExpression := anObject
]

{ #category : #navigation }
FASTFortranTAssigneable >> parentExpressionGroup [
	<generated>
	<navigation: 'ParentExpression'>
	^ MooseSpecializedGroup with: self parentExpression
]

{ #category : #accessing }
FASTFortranTAssigneable >> variableAssignementOwner [
	"Relation named: #variableAssignementOwner type: #FASTFortranTWithAssigneable opposite: #variable"

	<generated>
	<FMComment: 'The owner of the modifier'>
	<container>
	<derived>
	^ variableAssignementOwner
]

{ #category : #accessing }
FASTFortranTAssigneable >> variableAssignementOwner: anObject [

	<generated>
	variableAssignementOwner := anObject
]

{ #category : #navigation }
FASTFortranTAssigneable >> variableAssignementOwnerGroup [
	<generated>
	<navigation: 'VariableAssignementOwner'>
	^ MooseSpecializedGroup with: self variableAssignementOwner
]
