"
I represent an assignment expression as a part of assignment statement

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
| `parentIOStatement` | `FASTFortranTIOParameter` | `ioParameters` | `FASTFortranTWithIOParameters` | |
| `parentLoopControlIncrement` | `FASTFortranTExpression` | `increment` | `FASTFortranLoopControlExpression` | |
| `parentLoopControlInitialization` | `FASTFortranAssignmentExpression` | `init` | `FASTFortranLoopControlExpression` | |
| `parentLoopControlLimit` | `FASTFortranTExpression` | `limit` | `FASTFortranLoopControlExpression` | |
| `returnOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTReturnStatement` | The return statement that own the expression (if it's the case)|
| `variableDeclaratorOwner` | `FASTFortranTExpression` | `expression` | `FASTFortranTVariableDeclarator` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
| `assignedIn` | `FASTFortranTExpression` | `expression` | `FASTFortranTAssignment` | Optional assignment where this expression is used|
| `expression` | `FASTFortranTAssignment` | `assignedIn` | `FASTFortranTExpression` | Assigned expression (rhs of assignment)|
| `parentArrayExpression` | `FASTFortranTExpression` | `indices` | `FASTFortranArrayVariable` | an ArrayVariable expression of which I am an indice|
| `parentDataStatement` | `FASTFortranTExpression` | `dataConstants` | `FASTFortranDataGroup` | |
| `parentGotoAssignedStatement` | `FASTFortranTExpression` | `selectorExpression` | `FASTFortranGoToAssignedStatement` | |
| `parentGotoComputedStatement` | `FASTFortranTExpression` | `selectorExpression` | `FASTFortranGoToComputedStatement` | |
| `variable` | `FASTFortranTAssignment` | `parentAssignmentExpression` | `FASTFortranTVariableEntity` | An assigned variable (lhs of assignment)|


## Properties
======================

| Name | Type | Default value | Comment |
| `endPos` | `Number` | nil | |
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranAssignmentExpression,
	#superclass : #FASTFortranAbstractExpression,
	#traits : 'FASTFortranTAssignment + FASTFortranTIOParameter',
	#classTraits : 'FASTFortranTAssignment classTrait + FASTFortranTIOParameter classTrait',
	#instVars : [
		'#parentLoopControlInitialization => FMOne type: #FASTFortranLoopControlExpression opposite: #init'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAssignmentExpression class >> annotation [

	<FMClass: #AssignmentExpression super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranAssignmentExpression >> parentLoopControlInitialization [
	"Relation named: #parentLoopControlInitialization type: #FASTFortranLoopControlExpression opposite: #init"

	<generated>
	<container>
	<derived>
	^ parentLoopControlInitialization
]

{ #category : #accessing }
FASTFortranAssignmentExpression >> parentLoopControlInitialization: anObject [

	<generated>
	parentLoopControlInitialization := anObject
]

{ #category : #navigation }
FASTFortranAssignmentExpression >> parentLoopControlInitializationGroup [
	<generated>
	<navigation: 'ParentLoopControlInitialization'>
	^ MooseSpecializedGroup with: self parentLoopControlInitialization
]
