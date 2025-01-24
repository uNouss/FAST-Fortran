"
An abstract superclass representing an expression node of a source code.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTFortranTExpression` | `arguments` | `FASTFortranTWithArguments` | my owner|
| `assignementExpressionOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranFunctionStatement` | The AssignementExpression owner (if possible)|
| `expressionStatementOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTExpressionStatement` | The expression statement that own me (if it's the case|
| `parentArrayDimensionDeclarator` | `FASTFortranTExpression` | `lowerBound` | `FASTFortranArrayRange` | Parent array dimension declarator|
| `parentArrayDimensionDeclarator` | `FASTFortranTExpression` | `upperBound` | `FASTFortranArrayRange` | Parent array dimension declarator|
| `parentConditionalStatement` | `FASTFortranTExpression` | `condition` | `FASTFortranTConditionalStatement` | Parent conditional statement (if-block, if-logical, ...)|
| `parentExpression` | `FASTFortranTExpression` | `expression` | `FASTFortranTUnaryExpression` | Parent expression (if possible)|
| `parentExpressionLeft` | `FASTFortranTExpression` | `left` | `FASTFortranTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTFortranTExpression` | `right` | `FASTFortranTBinaryExpression` | Parent (binary) expression of which I am right side|
| `parentLoopControlIncrement` | `FASTFortranTExpression` | `increment` | `FASTFortranLoopControlExpression` | |
| `parentLoopControlLimit` | `FASTFortranTExpression` | `limit` | `FASTFortranLoopControlExpression` | |
| `returnOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTReturnStatement` | The return statement that own the expression (if it's the case)|
| `variableDeclaratorOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTVariableDeclarator` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `assignedIn` | `FASTFortranTExpression` | `expression` | `FASTFortranTAssignment` | Optional assignment where this expression is used|
| `parentArrayExpression` | `FASTFortranTExpression` | `indices` | `FASTFortranArrayVariable` | an ArrayVariable expression of which I am an indice|
| `parentDataStatement` | `FASTFortranTExpression` | `dataConstants` | `FASTFortranDataGroup` | |
| `parentGotoAssignedStatement` | `FASTFortranTExpression` | `selectorExpression` | `FASTFortranGoToAssignedStatement` | |
| `parentGotoComputedStatement` | `FASTFortranTExpression` | `selectorExpression` | `FASTFortranGoToComputedStatement` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : #FASTFortranTExpression,
	#instVars : [
		'#argumentOwner => FMOne type: #FASTFortranTWithArguments opposite: #arguments',
		'#assignedIn => FMOne type: #FASTFortranTAssignment opposite: #expression',
		'#assignementExpressionOwner => FMOne type: #FASTFortranFunctionStatement opposite: #expression',
		'#expressionStatementOwner => FMOne type: #FASTFortranTExpressionStatement opposite: #expression',
		'#parentArrayDimensionDeclarator => FMOne type: #FASTFortranArrayRange opposite: #upperBound',
		'#parentArrayExpression => FMOne type: #FASTFortranArrayVariable opposite: #indices',
		'#parentConditionalStatement => FMOne type: #FASTFortranTConditionalStatement opposite: #condition',
		'#parentDataStatement => FMOne type: #FASTFortranDataGroup opposite: #dataConstants',
		'#parentExpression => FMOne type: #FASTFortranTUnaryExpression opposite: #expression',
		'#parentExpressionLeft => FMOne type: #FASTFortranTBinaryExpression opposite: #left',
		'#parentExpressionRight => FMOne type: #FASTFortranTBinaryExpression opposite: #right',
		'#parentGotoAssignedStatement => FMOne type: #FASTFortranGoToAssignedStatement opposite: #selectorExpression',
		'#parentGotoComputedStatement => FMOne type: #FASTFortranGoToComputedStatement opposite: #selectorExpression',
		'#parentLoopControlIncrement => FMOne type: #FASTFortranLoopControlExpression opposite: #increment',
		'#parentLoopControlLimit => FMOne type: #FASTFortranLoopControlExpression opposite: #limit',
		'#returnOwner => FMOne type: #FASTFortranTReturnStatement opposite: #expression',
		'#variableDeclaratorOwner => FMOne type: #FASTFortranTVariableDeclarator opposite: #expression'
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
	"Relation named: #parentExpression type: #FASTFortranTUnaryExpression opposite: #expression"

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
FASTFortranTExpression >> parentExpressionLeft [
	"Relation named: #parentExpressionLeft type: #FASTFortranTBinaryExpression opposite: #left"

	<generated>
	<FMComment: 'Parent (binary) expression of which I am left side'>
	<container>
	<derived>
	^ parentExpressionLeft
]

{ #category : #accessing }
FASTFortranTExpression >> parentExpressionLeft: anObject [

	<generated>
	parentExpressionLeft := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> parentExpressionLeftGroup [
	<generated>
	<navigation: 'ParentExpressionLeft'>
	^ MooseSpecializedGroup with: self parentExpressionLeft
]

{ #category : #accessing }
FASTFortranTExpression >> parentExpressionRight [
	"Relation named: #parentExpressionRight type: #FASTFortranTBinaryExpression opposite: #right"

	<generated>
	<FMComment: 'Parent (binary) expression of which I am right side'>
	<container>
	<derived>
	^ parentExpressionRight
]

{ #category : #accessing }
FASTFortranTExpression >> parentExpressionRight: anObject [

	<generated>
	parentExpressionRight := anObject
]

{ #category : #navigation }
FASTFortranTExpression >> parentExpressionRightGroup [
	<generated>
	<navigation: 'ParentExpressionRight'>
	^ MooseSpecializedGroup with: self parentExpressionRight
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
