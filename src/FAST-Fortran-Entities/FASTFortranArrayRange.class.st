"
I represent an array lower/upper bounds

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
- Relation: #parentVariableDeclarator Type: #FASTFortranVariableDeclarator Opposite: #dimensions Comment: The variable declarator I am part of
- Relation: #returnOwner Type: #FASTFortranTReturnStatement Opposite: #expression Comment: The return statement that own the expression (if it's the case)
- Relation: #variableDeclaratorOwner Type: #FASTFortranTVariableDeclarator Opposite: #expression
### Children
- Relation: #lowerBound Type: #FASTFortranTExpression Opposite: #parentArrayDimensionDeclarator Comment: A lower bound of an array dimension
- Relation: #upperBound Type: #FASTFortranTExpression Opposite: #parentArrayDimensionDeclarator Comment: An upper bound of an array dimension
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
- Named: #startPos Type: Number
- Named: #startPos Type: Number

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
