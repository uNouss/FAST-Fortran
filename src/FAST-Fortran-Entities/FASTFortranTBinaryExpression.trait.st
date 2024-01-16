"
A trait representing a binary expression of a node of a source code.

## Relations
======================

### Parents
- Relation: #argumentOwner Type: #FASTFortranTWithArguments Opposite: #arguments Comment: my owner
- Relation: #assignementExpressionOwner Type: #FASTFortranFunctionStatement Opposite: #expression Comment: The AssignementExpression owner (if possible)
- Relation: #expressionStatementOwner Type: #FASTFortranTExpressionStatement Opposite: #expression Comment: The expression statement that own me (if it's the case
- Relation: #parentArrayDimensionDeclarator Type: #FASTFortranArrayRange Opposite: #lowerBound Comment: Parent array dimension declarator
- Relation: #parentArrayDimensionDeclarator Type: #FASTFortranArrayRange Opposite: #upperBound Comment: Parent array dimension declarator
- Relation: #parentConditionalStatement Type: #FASTFortranTConditionalStatement Opposite: #condition Comment: Parent conditional statement (if-block, if-logical, ...)
- Relation: #parentExpression Type: #FASTFortranTUnaryExpression Opposite: #expression Comment: Parent expression (if possible)
- Relation: #parentExpressionLeft Type: #FASTFortranTBinaryExpression Opposite: #left Comment: Parent (binary) expression of which I am left side
- Relation: #parentExpressionRight Type: #FASTFortranTBinaryExpression Opposite: #right Comment: Parent (binary) expression of which I am right side
- Relation: #parentLoopControlIncrement Type: #FASTFortranLoopControlExpression Opposite: #increment
- Relation: #parentLoopControlLimit Type: #FASTFortranLoopControlExpression Opposite: #limit
- Relation: #returnOwner Type: #FASTFortranTReturnStatement Opposite: #expression Comment: The return statement that own the expression (if it's the case)
- Relation: #variableDeclaratorOwner Type: #FASTFortranTVariableDeclarator Opposite: #expression
### Children
- Relation: #left Type: #FASTFortranTExpression Opposite: #parentExpressionLeft Comment: left part of a binary expression
- Relation: #right Type: #FASTFortranTExpression Opposite: #parentExpressionRight Comment: left part of the expression
### Other
- Relation: #assignedIn Type: #FASTFortranTAssignment Opposite: #expression Comment: Optional assignment where this expression is used
- Relation: #parentArrayExpression Type: #FASTFortranArrayVariable Opposite: #indices Comment: an ArrayVariable expression of which I am an indice
- Relation: #parentDataStatement Type: #FASTFortranDataGroup Opposite: #dataConstants
- Relation: #parentGotoAssignedStatement Type: #FASTFortranGoToAssignedStatement Opposite: #selectorExpression
- Relation: #parentGotoComputedStatement Type: #FASTFortranGoToComputedStatement Opposite: #selectorExpression

## Properties
======================

- Named: #endPos Type: Number
- Named: #endPos Type: Number
- Named: #operator Type: String Comment: Binary expression operator
- Named: #startPos Type: Number
- Named: #startPos Type: Number

"
Trait {
	#name : #FASTFortranTBinaryExpression,
	#instVars : [
		'#left => FMOne type: #FASTFortranTExpression opposite: #parentExpressionLeft',
		'#operator => FMProperty',
		'#right => FMOne type: #FASTFortranTExpression opposite: #parentExpressionRight'
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
	"Relation named: #left type: #FASTFortranTExpression opposite: #parentExpressionLeft"

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
	"Relation named: #right type: #FASTFortranTExpression opposite: #parentExpressionRight"

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
