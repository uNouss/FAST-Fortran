"
An abstract superclass representing an expression node of a source code.
"
Trait {
	#name : #FASTFortranTExpression,
	#instVars : [
		'#expressionStatementOwner => FMOne type: #FASTFortranTExpressionStatement opposite: #expression',
		'#returnOwner => FMOne type: #FASTFortranTReturnStatement opposite: #expression',
		'#argumentOwner => FMOne type: #FASTFortranTWithArguments opposite: #arguments',
		'#assignedIn => FMOne type: #FASTFortranTAssignment opposite: #expression',
		'#parentExpression => FMOne type: #FASTFortranBinaryExpression opposite: #left',
		'#parentIfBlock => FMOne type: #FASTFortranIfBlockStatement opposite: #condition',
		'#assignementExpressionOwner => FMOne type: #FASTFortranFunctionStatement opposite: #expression'
	],
	#traits : 'FASTFortranTEntity',
	#classTraits : 'FASTFortranTEntity classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTExpression classSide >> annotation [

	<FMClass: #TExpression super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTExpression >> argumentOwner [
	"Relation named: #argumentOwner type: #FASTFortranTWithArguments opposite: #arguments"

	<generated>
	<FMComment: 'my owner'>
	<container>
	^ argumentOwner
]

{ #category : #accessing }
FASTFortranTExpression >> argumentOwner: anObject [

	<generated>
	argumentOwner := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> argumentOwnerGroup [
	<generated>
	<navigation: 'ArgumentOwner'>
	^ MooseSpecializedGroup with: self argumentOwner
]

{ #category : #accessing }
FASTFortranTExpression >> assignedIn [
	"Relation named: #assignedIn type: #FASTFortranTAssignment opposite: #expression"

	<generated>
	<FMComment: 'Optional assignment where this expression is used'>
	<derived>
	^ assignedIn
]

{ #category : #accessing }
FASTFortranTExpression >> assignedIn: anObject [

	<generated>
	assignedIn := anObject
]

{ #category : #accessing }
FASTFortranTExpression >> assignementExpressionOwner [
	"Relation named: #assignementExpressionOwner type: #FASTFortranFunctionStatement opposite: #expression"

	<generated>
	<FMComment: 'The AssignementExpression owner (if possible)'>
	<container>
	<derived>
	^ assignementExpressionOwner
]

{ #category : #accessing }
FASTFortranTExpression >> assignementExpressionOwner: anObject [

	<generated>
	assignementExpressionOwner := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> assignementExpressionOwnerGroup [
	<generated>
	<navigation: 'AssignementExpressionOwner'>
	^ MooseSpecializedGroup with: self assignementExpressionOwner
]

{ #category : #accessing }
FASTFortranTExpression >> expressionStatementOwner [
	"Relation named: #expressionStatementOwner type: #FASTFortranTExpressionStatement opposite: #expression"

	<generated>
	<FMComment: 'The expression statement that own me (if it''s the case'>
	<container>
	<derived>
	^ expressionStatementOwner
]

{ #category : #accessing }
FASTFortranTExpression >> expressionStatementOwner: anObject [

	<generated>
	expressionStatementOwner := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> expressionStatementOwnerGroup [
	<generated>
	<navigation: 'ExpressionStatementOwner'>
	^ MooseSpecializedGroup with: self expressionStatementOwner
]

{ #category : #accessing }
FASTFortranTExpression >> parentExpression [
	"Relation named: #parentExpression type: #FASTFortranBinaryExpression opposite: #left"

	<generated>
	<FMComment: 'Parent expression (if possible)'>
	<container>
	<derived>
	^ parentExpression
]

{ #category : #accessing }
FASTFortranTExpression >> parentExpression: anObject [

	<generated>
	parentExpression := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> parentExpressionGroup [
	<generated>
	<navigation: 'ParentExpression'>
	^ MooseSpecializedGroup with: self parentExpression
]

{ #category : #accessing }
FASTFortranTExpression >> parentIfBlock [
	"Relation named: #parentIfBlock type: #FASTFortranIfBlockStatement opposite: #condition"

	<generated>
	<FMComment: 'Parent if block'>
	<container>
	<derived>
	^ parentIfBlock
]

{ #category : #accessing }
FASTFortranTExpression >> parentIfBlock: anObject [

	<generated>
	parentIfBlock := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> parentIfBlockGroup [
	<generated>
	<navigation: 'ParentIfBlock'>
	^ MooseSpecializedGroup with: self parentIfBlock
]

{ #category : #accessing }
FASTFortranTExpression >> returnOwner [
	"Relation named: #returnOwner type: #FASTFortranTReturnStatement opposite: #expression"

	<generated>
	<FMComment: 'The return statement that own the expression (if it''s the case)'>
	<container>
	<derived>
	^ returnOwner
]

{ #category : #accessing }
FASTFortranTExpression >> returnOwner: anObject [

	<generated>
	returnOwner := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> returnOwnerGroup [
	<generated>
	<navigation: 'ReturnOwner'>
	^ MooseSpecializedGroup with: self returnOwner
]
