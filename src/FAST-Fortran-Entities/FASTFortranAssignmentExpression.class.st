"
I represent an assignment expression as a part of assignment statement

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
- Relation: #parentIOStatement Type: #FASTFortranTWithIOParameters Opposite: #ioParameters
- Relation: #parentLoopControlIncrement Type: #FASTFortranLoopControlExpression Opposite: #increment
- Relation: #parentLoopControlInitialization Type: #FASTFortranLoopControlExpression Opposite: #init
- Relation: #parentLoopControlLimit Type: #FASTFortranLoopControlExpression Opposite: #limit
- Relation: #returnOwner Type: #FASTFortranTReturnStatement Opposite: #expression Comment: The return statement that own the expression (if it's the case)
- Relation: #variableDeclaratorOwner Type: #FASTFortranTVariableDeclarator Opposite: #expression
### Other
- Relation: #assignedIn Type: #FASTFortranTAssignment Opposite: #expression Comment: Optional assignment where this expression is used
- Relation: #expression Type: #FASTFortranTExpression Opposite: #assignedIn Comment: Assigned expression (rhs of assignment)
- Relation: #parentArrayExpression Type: #FASTFortranArrayVariable Opposite: #indices Comment: an ArrayVariable expression of which I am an indice
- Relation: #parentDataStatement Type: #FASTFortranDataGroup Opposite: #dataConstants
- Relation: #parentGotoAssignedStatement Type: #FASTFortranGoToAssignedStatement Opposite: #selectorExpression
- Relation: #parentGotoComputedStatement Type: #FASTFortranGoToComputedStatement Opposite: #selectorExpression
- Relation: #variable Type: #FASTFortranTVariableEntity Opposite: #parentAssignmentExpression Comment: An assigned variable (lhs of assignment)

## Properties
======================

- Named: #endPos Type: Number
- Named: #endPos Type: Number
- Named: #startPos Type: Number
- Named: #startPos Type: Number

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
