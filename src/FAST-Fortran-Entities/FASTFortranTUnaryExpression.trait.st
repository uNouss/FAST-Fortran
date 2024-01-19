"
A trait representing an unary expression of a node of a source code.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
| `argumentOwner` | `FASTFortranTExpression` | `arguments` | `FASTFortranTWithArguments` | my owner|
| `assignementExpressionOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranFunctionStatement` | The AssignementExpression owner (if possible)|
| `expressionStatementOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTExpressionStatement` | The expression statement that own me (if it's the case|
| `parentArrayDimensionDeclarator` | `FASTFortranTExpression` | `upperBound` | `FASTFortranArrayRange` | Parent array dimension declarator|
| `parentArrayDimensionDeclarator` | `FASTFortranTExpression` | `lowerBound` | `FASTFortranArrayRange` | Parent array dimension declarator|
| `parentConditionalStatement` | `FASTFortranTExpression` | `condition` | `FASTFortranTConditionalStatement` | Parent conditional statement (if-block, if-logical, ...)|
| `parentExpression` | `FASTFortranTExpression` | `expression` | `FASTFortranTUnaryExpression` | Parent expression (if possible)|
| `parentExpressionLeft` | `FASTFortranTExpression` | `left` | `FASTFortranTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTFortranTExpression` | `right` | `FASTFortranTBinaryExpression` | Parent (binary) expression of which I am right side|
| `parentLoopControlIncrement` | `FASTFortranTExpression` | `increment` | `FASTFortranLoopControlExpression` | |
| `parentLoopControlLimit` | `FASTFortranTExpression` | `limit` | `FASTFortranLoopControlExpression` | |
| `returnOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTReturnStatement` | The return statement that own the expression (if it's the case)|
| `variableDeclaratorOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTVariableDeclarator` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
| `expression` | `FASTFortranTUnaryExpression` | `parentExpression` | `FASTFortranTExpression` | expression|

### Other
| Relation | Origin | Opposite | Type | Comment |
| `assignedIn` | `FASTFortranTExpression` | `expression` | `FASTFortranTAssignment` | Optional assignment where this expression is used|
| `parentArrayExpression` | `FASTFortranTExpression` | `indices` | `FASTFortranArrayVariable` | an ArrayVariable expression of which I am an indice|
| `parentDataStatement` | `FASTFortranTExpression` | `dataConstants` | `FASTFortranDataGroup` | |
| `parentGotoAssignedStatement` | `FASTFortranTExpression` | `selectorExpression` | `FASTFortranGoToAssignedStatement` | |
| `parentGotoComputedStatement` | `FASTFortranTExpression` | `selectorExpression` | `FASTFortranGoToComputedStatement` | |


## Properties
======================

| Name | Type | Default value | Comment |
| `endPos` | `Number` | nil | |
| `endPos` | `Number` | nil | |
| `operator` | `String` | nil | Unary expression operator|
| `startPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : #FASTFortranTUnaryExpression,
	#instVars : [
		'#operator => FMProperty',
		'#expression => FMOne type: #FASTFortranTExpression opposite: #parentExpression'
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
