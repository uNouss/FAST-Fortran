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
		'#parentArrayDimensionDeclarator => FMOne type: #FASTFortranArrayRange opposite: #upperBound',
		'#parentArrayExpression => FMOne type: #FASTFortranArrayVariable opposite: #indices',
		'#parentDataStatement => FMOne type: #FASTFortranDataGroup opposite: #dataConstants',
		'#variableDeclaratorOwner => FMOne type: #FASTFortranTVariableDeclarator opposite: #expression',
		'#assignementExpressionOwner => FMOne type: #FASTFortranFunctionStatement opposite: #expression',
		'#parentGotoComputedStatement => FMOne type: #FASTFortranGoToComputedStatement opposite: #selectorExpression',
		'#parentGotoAssignedStatement => FMOne type: #FASTFortranGoToAssignedStatement opposite: #selectorExpression',
		'#parentConditionalStatement => FMOne type: #FASTFortranTConditionalStatement opposite: #condition',
		'#parentLoopControlIncrement => FMOne type: #FASTFortranLoopControlExpression opposite: #increment',
		'#parentLoopControlLimit => FMOne type: #FASTFortranLoopControlExpression opposite: #limit',
		'#parentExpression => FMOne type: #FASTFortranTBinaryExpression opposite: #left'
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
FASTFortranTExpression >> parentArrayDimensionDeclarator [
	"Relation named: #parentArrayDimensionDeclarator type: #FASTFortranArrayRange opposite: #upperBound"

	<generated>
	<FMComment: 'Parent array dimension declarator'>
	<container>
	<derived>
	^ parentArrayDimensionDeclarator
]

{ #category : #accessing }
FASTFortranTExpression >> parentArrayDimensionDeclarator: anObject [

	<generated>
	parentArrayDimensionDeclarator := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> parentArrayDimensionDeclaratorGroup [
	<generated>
	<navigation: 'ParentArrayDimensionDeclarator'>
	^ MooseSpecializedGroup with: self parentArrayDimensionDeclarator
]

{ #category : #accessing }
FASTFortranTExpression >> parentArrayExpression [
	"Relation named: #parentArrayExpression type: #FASTFortranArrayVariable opposite: #indices"

	<generated>
	<FMComment: 'an ArrayVariable expression of which I am an indice'>
	^ parentArrayExpression
]

{ #category : #accessing }
FASTFortranTExpression >> parentArrayExpression: anObject [

	<generated>
	parentArrayExpression := anObject
]

{ #category : #accessing }
FASTFortranTExpression >> parentConditionalStatement [
	"Relation named: #parentConditionalStatement type: #FASTFortranTConditionalStatement opposite: #condition"

	<generated>
	<FMComment: 'Parent conditional statement (if-block, if-logical, ...)'>
	<container>
	<derived>
	^ parentConditionalStatement
]

{ #category : #accessing }
FASTFortranTExpression >> parentConditionalStatement: anObject [

	<generated>
	parentConditionalStatement := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> parentConditionalStatementGroup [
	<generated>
	<navigation: 'ParentConditionalStatement'>
	^ MooseSpecializedGroup with: self parentConditionalStatement
]

{ #category : #accessing }
FASTFortranTExpression >> parentDataStatement [
	"Relation named: #parentDataStatement type: #FASTFortranDataGroup opposite: #dataConstants"

	<generated>
	^ parentDataStatement
]

{ #category : #accessing }
FASTFortranTExpression >> parentDataStatement: anObject [

	<generated>
	parentDataStatement := anObject
]

{ #category : #accessing }
FASTFortranTExpression >> parentExpression [
	"Relation named: #parentExpression type: #FASTFortranTBinaryExpression opposite: #left"

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
FASTFortranTExpression >> parentGotoAssignedStatement [
	"Relation named: #parentGotoAssignedStatement type: #FASTFortranGoToAssignedStatement opposite: #selectorExpression"

	<generated>
	<derived>
	^ parentGotoAssignedStatement
]

{ #category : #accessing }
FASTFortranTExpression >> parentGotoAssignedStatement: anObject [

	<generated>
	parentGotoAssignedStatement := anObject
]

{ #category : #accessing }
FASTFortranTExpression >> parentGotoComputedStatement [
	"Relation named: #parentGotoComputedStatement type: #FASTFortranGoToComputedStatement opposite: #selectorExpression"

	<generated>
	<derived>
	^ parentGotoComputedStatement
]

{ #category : #accessing }
FASTFortranTExpression >> parentGotoComputedStatement: anObject [

	<generated>
	parentGotoComputedStatement := anObject
]

{ #category : #accessing }
FASTFortranTExpression >> parentLoopControlIncrement [
	"Relation named: #parentLoopControlIncrement type: #FASTFortranLoopControlExpression opposite: #increment"

	<generated>
	<container>
	<derived>
	^ parentLoopControlIncrement
]

{ #category : #accessing }
FASTFortranTExpression >> parentLoopControlIncrement: anObject [

	<generated>
	parentLoopControlIncrement := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> parentLoopControlIncrementGroup [
	<generated>
	<navigation: 'ParentLoopControlIncrement'>
	^ MooseSpecializedGroup with: self parentLoopControlIncrement
]

{ #category : #accessing }
FASTFortranTExpression >> parentLoopControlLimit [
	"Relation named: #parentLoopControlLimit type: #FASTFortranLoopControlExpression opposite: #limit"

	<generated>
	<container>
	<derived>
	^ parentLoopControlLimit
]

{ #category : #accessing }
FASTFortranTExpression >> parentLoopControlLimit: anObject [

	<generated>
	parentLoopControlLimit := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> parentLoopControlLimitGroup [
	<generated>
	<navigation: 'ParentLoopControlLimit'>
	^ MooseSpecializedGroup with: self parentLoopControlLimit
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

{ #category : #accessing }
FASTFortranTExpression >> variableDeclaratorOwner [
	"Relation named: #variableDeclaratorOwner type: #FASTFortranTVariableDeclarator opposite: #expression"

	<generated>
	<container>
	<derived>
	^ variableDeclaratorOwner
]

{ #category : #accessing }
FASTFortranTExpression >> variableDeclaratorOwner: anObject [

	<generated>
	variableDeclaratorOwner := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> variableDeclaratorOwnerGroup [
	<generated>
	<navigation: 'VariableDeclaratorOwner'>
	^ MooseSpecializedGroup with: self variableDeclaratorOwner
]
