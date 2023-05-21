Class {
	#name : #FASTFortranJsonVisitor,
	#superclass : #FortranAbstractJsonVisitor,
	#category : #'FAST-Fortran-JSON-Visitor-Visitor'
}

{ #category : #'reflective operations' }
FASTFortranJsonVisitor >> visit: aJsonElement [
	self flag: #TOREMOVE.
	"Json elements are 
	- lists (an ordered sequenece of values) 
	- maps (an unordered associative array, mapping string property names to values)"

	aJsonElement isDictionary ifTrue: [ ^ self visitJsonMap: aJsonElement ].

	aJsonElement isArray ifTrue: [ ^ self visitJsonArray: aJsonElement ]
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitAddition: anAdditionOperatorNode [

	^FASTFortranArithmeticExpression new
		operator: (super visitAddition: anAdditionOperatorNode) ;
		yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitArgument: anArgumentNode [
	"used for argument in subprogram calls and parameter in subprogram definition"

	| data |
	data := super visitArgument: anArgumentNode.

	data isCollection ifFalse: [ ^data ].
 	(data size = 2) ifTrue: [ ^data second ].
	^data
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitArray: anObject [
	
	"its a bullshit code that need to be rewritten"
	self flag: #TODO.
	^ FASTFortranArray new name:
		  (self visitVariable: (anObject at: 'variable')) name

	"TODO process dimensions"

	"TODO process length"	
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitAssign_expressionStatement: anObject [

	"The assignment statement assigns a value to a variable, substring, array element, record, or record field"
	| data |
	data := super visitAssign_expressionStatement: anObject.
	^ FASTFortranAssignmentStatement new
		  variable: data first ;
		  expression: data second
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitBinary: aBinaryExpressionNode [
	| data |
	data := super visitBinary: aBinaryExpressionNode.
	^data third
		left: data second ;
		right: data fourth ;
		yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitBlock_data: anObject [
	| data |

	data := super visitBlock_data: anObject.

	^ FASTFortranBlockData new
		flag: 'need to set source anchor' ;
		name: data second ;
		statements: data third ;
		yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitBlocks: aBlockList [
	^super visitBlocks: aBlockList
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitCallStatement: aCallNode [
	
	"The CALL statement branches to the specified subroutine, executes the subroutine, and returns to the calling program after finishing the subroutine.

CALL sub [([ar[, ar]])] where sub is a name of the subroutine to be called, ar is an actual argument to be passed to the subroutine "

	| astNode data |
	
	data := super visitCallStatement: aCallNode.

	^astNode := FASTFortranCallStatement new
		"sourceAnchor: (self makeIndexedAnchor: data first) ;"
		name: data second ;
		arguments: data third ;
		yourself.

]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitCharacterBaseType: aString [
	
	^ FASTFortranCharacterType new
		yourself

]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitComment: aCommentNode [

	^FASTFortranComment new
		content: (super visitComment: aCommentNode) second
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitCommon: aCommonNode [
	| data |
	data := super visitCommon: aCommonNode.
	^self visitJsonMap: aCommonNode keys: #(span common_groups)
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitCommonStatement: anObject [
	
	"creates common statement which defines a block of main memory storage so that different program units can share the same data without using arguments.

COMMON [/[cb]/] nlist [[,]/[cb]/ nlist] where 
cb: Common block name,
nlist: List of variable names, array names, and array declarators  "
	self flag: #TODO.
	^ FASTFortranCommonStatement new

]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitConditions: aConditionList [
	"a list of {condition . thenPart}, each element being an elseif of the preceding element"
	| firstIf elseIf data |
	data := super visitConditions: aConditionList.

	data do: [ :each || newIf |
		newIf  := FASTFortranIfBlockStatement new
			condition: each first ;
			thenStatements: each second ;
			yourself.

		firstIf
			ifNil: [ firstIf := newIf ]
			ifNotNil: [ elseIf elseStatements: { newIf } ].
		elseIf := newIf.
	].

	^firstIf.
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitContinueStatement: anObject [
	self flag: #TODO.
	^ FASTFortranContinueStatement new

]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDeclaration: anObject [
	| data |

	data := super visitDeclaration: anObject.
	data fourth do: [ :varExp | varExp type: data second ].
	^FASTFortranVariablesDeclaration new
		variables: data fourth ;
		yourself.

]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDeclarationStatement: aDeclarationStatementNode [
	| data |
	data := super visitDeclarationStatement: aDeclarationStatementNode.

	^FASTFortranDeclarationStatement new
		type: data second ;
		attributes: data third ;
		declarators: data fourth ;
		yourself

]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDeclarator: aDeclaratorNode [
	self flag: 'TODO: deal with the other keys in the map'.
	^(super visitDeclarator: aDeclaratorNode)
		last
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDeclaratorVariable: aDeclaratorVariableNode [
	| data |
	data := super visitDeclaratorVariable: aDeclaratorVariableNode.
	^FASTFortranVariableExpression new
		"sourceAnchor: (self makeIndexedAnchor: data first) ;"
		name: data second ;
		yourself

]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDeclarators: aDeclaratorsList [
	^(super visitDeclarators: aDeclaratorsList) second
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitDivision: aDivisionOperatorNode [

	^FASTFortranArithmeticExpression new
		operator: (super visitDivision: aDivisionOperatorNode) ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDo: anObject [

	| loopControl loopControlExpression increment|
	self flag: #TODO.
	loopControl := anObject at: 'do_spec'.
	increment := (loopControl at: 'increment').	
	loopControlExpression := FASTFortranLoopControlExpression new 
		init: (self visitJsonTaggedElement: (loopControl at: 'initial'));
		limit: (self visitJsonTaggedElement: (loopControl at: 'limit'));
		increment: ((increment isNotNil) ifTrue:[self visitJsonTaggedElement: (loopControl at: 'increment') ] ifFalse: [nil]).
	
	^ (FASTFortranDoStatement new)
	statements: (self visitJsonArray: (anObject at: 'body'));
	loopControl: loopControlExpression.  
	

]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitEq: anEqualtoOperatorNode [

	^FASTFortranLogicalExpression new
		operator: (super visitEq: anEqualtoOperatorNode) ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitExitStatement: anObject [
	self flag: #TODO.
	^ FASTFortranExitStatement new.

]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitExponentiation: aExponentiationOperatorNode [

	^FASTFortranArithmeticExpression new
		operator: (super visitExponentiation: aExponentiationOperatorNode) ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitExternalStatement: anExternalStatementNode [
	| data |
	data := super visitExternalStatement: anExternalStatementNode.
	^FASTFortranExternalStatement new
		name: data second first name ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitFormat: aFormatNode [
	^(super visitFormat: aFormatNode)
		second
		reject: #isNil
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitFunctionAsValue: aFunctionNode [
	^(super visitFunctionAsValue: aFunctionNode)
		second

]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitFunctionStatement: anObject [
	self flag: #TODO.
	^ FASTFortranFunctionStatement new
		name: (self visit: (anObject at: 'name'));
		arguments: (self visitJsonArray: (anObject at: 'arguments' at: 'list'));
		expression: (self visitJsonTaggedElement: (anObject at: 'body')).
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitFunctionWithBlocks: aFunctionNode [
	"^self visitJsonMap: aFunctionNode keys: #(span name type arguments blocks result subprograms)"
	| data |
	data := super visitFunctionWithBlocks: aFunctionNode.
	^FASTFortranFunction new
		flag: 'need to set source anchor' ;
		name: data second ;
		flag: 'need to set return type' ;
		parameters: data fourth ;
		statements: data fifth ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitGotoStatement: anObject [

	"so far only unconditional case is processed"
	self flag: #TODO.
	^ (FASTFortranGoToStatement new) label: (self visitJsonTaggedElement: (anObject at: 'target'))	

]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitGt: aGreaterthanOperatorNode [

	^FASTFortranLogicalExpression new
		operator: (super visitGt: aGreaterthanOperatorNode) ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitIf: anIfNode [
	".blocks is an array with one block dedicated to else part of last if (in case of elseifs)
	.conditionals is an erray where each element represent if and if else consequently 
	.conditionals[_].[0] represents a condition
	.conditionals[_].[1] is an array containing all statements of the correpsonding then part"

	| data lastIf |
	data := (super visitIf: anIfNode).

	lastIf := data third.
	[ lastIf elseStatements isEmpty ]
		whileFalse: [ lastIf := lastIf elseStatements first ].
	lastIf elseStatements: data fourth.

	^data third
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitImplicitStatement: anImplicitstatementNode [
	
	"If 'items' is nil, correspond to the statement 'implicit none'"
	| data |
	data := super visitImplicitStatement: anImplicitstatementNode.
	^data second
	ifNil: [ FASTFortranImplicitStatement new ]
	ifNotNil: [ self notYetImplemented ]

]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitInitial: anObject [

	^ nil
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitIntegerBaseType: aString [
	
	^ FASTFortranIntegerType new 

]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitIntegerLiteralValue: anIntegerLiteralValueNode [

	^FASTFortranIntegerLiteral new
		value: (super visitIntegerLiteralValue: anIntegerLiteralValueNode) ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitLogicalBaseType: aString [

	^ FASTFortranLogicalType new
		yourself

]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitLogicalLiteralValue: aString [

	^ FASTFortranBooleanLiteral new
		value: (super visitLogicalLiteralValue: aString)
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitLt: anLessthanOperatorNode [

	^FASTFortranLogicalExpression new
		operator: (super visitLt: anLessthanOperatorNode) ;
		yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitMain: anObject [
	| data |
	data := super visitMain: anObject.

	^ FASTFortranProgramMain new
		  name: data second;
		  statements: data third.
		
		
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitMinus: aMinusOperatorNode [

	^FASTFortranArithmeticExpression new
		operator: (super visitMinus: aMinusOperatorNode) ;
		yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitMultiplication: aMultiplicationOperatorNode [

	^FASTFortranArithmeticExpression new
		operator: (super visitMultiplication: aMultiplicationOperatorNode) ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitPrintStatement: anObject [
	self flag: #TODO.

	^ FASTFortranPrintStatement new
		  format: (self visitJsonTaggedElement: (anObject at: 'format'));
		  iolist: (self visitJsonArray: (anObject at: 'arguments' at: 'list'))
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitProgramFile: aProgramFileNode [
	^(super visitProgramFile: aProgramFileNode)
		second.
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitRealBaseType: aString [

	^ FASTFortranRealType new
		yourself

]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitReturn_spec: aReturn_specNode [
	^(super visitReturn_spec: aReturn_specNode)
		second
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitSpan: anObject [

	^ nil

	
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitStar: anObject [

	^ FASTFortranAsterisk new.

]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitStatement: anObject [
	| data |

	data := super visitStatement: anObject.

	data second ifNotNil: [ data third label: data second ].
	^data third
	"statement := anObject at: 'statement'.

	(statement includesKey: 'tag')
		ifTrue: [ 
			| st label |
			st := self visitTaggedStatement: statement.
			
			label := anObject at: 'label'.
			^ label
				  ifNotNil: [ st label: (self visitValue: label) ]
				  ifNil: [ st ] ]
		ifFalse: [  ]"
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitStatementBlock: anASTStatementBlock [

	^ "FASTFortranStatementBlock new statements:"
		  (anASTStatementBlock collect: [ :astStatement | 
			   self visitJsonMap: astStatement ])
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitStopStatement: anObject [
	| data |
	data := super visitStopStatement: anObject.
	^FASTFortranStopStatement new
		displayArgument: data second ;
		yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitStringLiteralValue: aString [
	^FASTFortranStringLiteral new
		value: (super visitStringLiteralValue: aString) ;
		yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitSubroutine: aSubroutineNode [
	| data |
	data := super visitSubroutine: aSubroutineNode.

	^FASTFortranSubroutine new
		"sourceAnchor: (self makeIndexedAnchor: data first) ;"
		name: data second ;
		parameters: data third ;
		statements: data fourth ;
		yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitSubtraction: aSubtractionOperatorNode [

	^FASTFortranArithmeticExpression new
		operator: (super visitSubtraction: aSubtractionOperatorNode) ;
		yourself
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitType: aTypeNode [

	^(super visitType: aTypeNode)
		second
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitValue: aValueNode [
	^(super visitValue: aValueNode) second

]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitVariable: aVariableNode [
	| data |
	data := super visitVariable: aVariableNode.

	^FASTFortranVariableExpression new
		name: data ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitWriteStatement: aWriteStatementNode [	
	"write statement. should follow the pattern: 
	WRITE([UNIT=] u [, [FMT=] f] [, IOSTAT=ios] [, REC=rn] [, ERR=s]) iolist
	WRITE([ UNIT=] u, [NML=] grname [, IOSTAT=ios] [, ERR=s])"
	| data |

	data := super visitWriteStatement: aWriteStatementNode.

	^FASTFortranWriteStatement new
		"sourceAnchor: (self makeIndexedAnchor: data first) ;"
		format: data second ;
		iolist: data third ;
		yourself
]
