"
I represent Fortran Arithmetic Real Literal (Constant) statement

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
- Relation: #parentTypeSize Type: #FASTFortranType Opposite: #size
- Relation: #returnOwner Type: #FASTFortranTReturnStatement Opposite: #expression Comment: The return statement that own the expression (if it's the case)
- Relation: #variableDeclaratorOwner Type: #FASTFortranTVariableDeclarator Opposite: #expression
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
- Named: #primitiveValue Type: String Comment: The literal itself as found in the source code. We use primitiveValue in order to override value from Object
- Named: #startPos Type: Number
- Named: #startPos Type: Number

"
Class {
	#name : #FASTFortranRealLiteral,
	#superclass : #FASTFortranAbstractLiteral,
	#traits : 'FASTFortranTNumericalLiteral',
	#classTraits : 'FASTFortranTNumericalLiteral classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranRealLiteral class >> annotation [

	<FMClass: #RealLiteral super: #FASTFortranAbstractLiteral>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
