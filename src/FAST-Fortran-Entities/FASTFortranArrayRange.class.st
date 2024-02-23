"
I represent an array lower/upper bounds

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
| `parentVariableDeclarator` | `FASTFortranArrayRange` | `dimensions` | `FASTFortranVariableDeclarator` | The variable declarator I am part of|
| `returnOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTReturnStatement` | The return statement that own the expression (if it's the case)|
| `variableDeclaratorOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTVariableDeclarator` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `lowerBound` | `FASTFortranArrayRange` | `parentArrayDimensionDeclarator` | `FASTFortranTExpression` | A lower bound of an array dimension|
| `upperBound` | `FASTFortranArrayRange` | `parentArrayDimensionDeclarator` | `FASTFortranTExpression` | An upper bound of an array dimension|

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
Class {
	#name : #FASTFortranArrayRange,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTExpression',
	#classTraits : 'FASTFortranTExpression classTrait',
	#instVars : [
		'#upperBound => FMOne type: #FASTFortranTExpression opposite: #parentArrayDimensionDeclarator',
		'#lowerBound => FMOne type: #FASTFortranTExpression opposite: #parentArrayDimensionDeclarator',
		'#parentVariableDeclarator => FMOne type: #FASTFortranVariableDeclarator opposite: #dimensions'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranArrayRange class >> annotation [

	<FMClass: #ArrayRange super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranArrayRange >> lowerBound [
	"Relation named: #lowerBound type: #FASTFortranTExpression opposite: #parentArrayDimensionDeclarator"

	<generated>
	<FMComment: 'A lower bound of an array dimension'>
	^ lowerBound
]

{ #category : #accessing }
FASTFortranArrayRange >> lowerBound: anObject [

	<generated>
	lowerBound := anObject
]

{ #category : #navigation }
FASTFortranArrayRange >> lowerBoundGroup [
	<generated>
	<navigation: 'LowerBound'>
	^ MooseSpecializedGroup with: self lowerBound
]

{ #category : #accessing }
FASTFortranArrayRange >> parentVariableDeclarator [
	"Relation named: #parentVariableDeclarator type: #FASTFortranVariableDeclarator opposite: #dimensions"

	<generated>
	<FMComment: 'The variable declarator I am part of'>
	<container>
	^ parentVariableDeclarator
]

{ #category : #accessing }
FASTFortranArrayRange >> parentVariableDeclarator: anObject [

	<generated>
	parentVariableDeclarator := anObject
]

{ #category : #navigation }
FASTFortranArrayRange >> parentVariableDeclaratorGroup [
	<generated>
	<navigation: 'ParentVariableDeclarator'>
	^ MooseSpecializedGroup with: self parentVariableDeclarator
]

{ #category : #accessing }
FASTFortranArrayRange >> upperBound [
	"Relation named: #upperBound type: #FASTFortranTExpression opposite: #parentArrayDimensionDeclarator"

	<generated>
	<FMComment: 'An upper bound of an array dimension'>
	^ upperBound
]

{ #category : #accessing }
FASTFortranArrayRange >> upperBound: anObject [

	<generated>
	upperBound := anObject
]

{ #category : #navigation }
FASTFortranArrayRange >> upperBoundGroup [
	<generated>
	<navigation: 'UpperBound'>
	^ MooseSpecializedGroup with: self upperBound
]
