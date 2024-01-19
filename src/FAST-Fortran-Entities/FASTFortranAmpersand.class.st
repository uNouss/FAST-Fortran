"
I represent an Ampersand Character Literal (Constant) that is often used in parameters and format identifiers

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
| `primitiveValue` | `String` | nil | The literal itself as found in the source code. We use primitiveValue in order to override value from Object|
| `startPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTFortranAmpersand,
	#superclass : #FASTFortranAbstractLiteral,
	#traits : 'FASTFortranTCharacterLiteral',
	#classTraits : 'FASTFortranTCharacterLiteral classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAmpersand class >> annotation [

	<FMClass: #Ampersand super: #FASTFortranAbstractLiteral>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
