Class {
	#name : #FASTFortranJsonVisitor,
	#superclass : #FortranAbstractJsonVisitor,
	#instVars : [
		'lineSizes',
		'model'
	],
	#category : #'FAST-Fortran-Visitors-Importer'
}

{ #category : #initialization }
FASTFortranJsonVisitor >> initLineSizes: fortranSource [

	lineSizes := fortranSource lines collect: #size
]

{ #category : #initialization }
FASTFortranJsonVisitor >> initialize [

	super initialize.

	lineSizes := #(  )
]

{ #category : #accessing }
FASTFortranJsonVisitor >> model [

	^ model
]

{ #category : #accessing }
FASTFortranJsonVisitor >> model: anObject [

	model := anObject
]

{ #category : #private }
FASTFortranJsonVisitor >> newEntity: aFASTFortranClass atPosition: aPoint [

	| node |
	node := aFASTFortranClass new.
	node mooseModel: model.
	self set: node startEnd: aPoint.
	^ node
]

{ #category : #private }
FASTFortranJsonVisitor >> pointToPosition: lineColumn [

	| position |
	position := 0.
	1 to: lineColumn x - 1 do: [ :i |
	position := position + (lineSizes at: i) + 1 ].
	^ position + lineColumn y
]

{ #category : #private }
FASTFortranJsonVisitor >> putMembers: entities inBody: stmtBlock [

	entities do: [ :each |
		each isStatement
			ifTrue: [ stmtBlock addStatement: each ]
			ifFalse: [ stmtBlock addComment: each ]
	]
]

{ #category : #private }
FASTFortranJsonVisitor >> set: aFASTFortranNode startEnd: aPoint [

	aFASTFortranNode
		startPos: (self pointToPosition: aPoint first);
		endPos: (self pointToPosition: aPoint second) - 1
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitAddition: anAdditionOperatorNode [

	^FASTFortranBinaryExpression new
		operator: (super visitAddition: anAdditionOperatorNode);
		mooseModel: model ;
		yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitArgument: anArgumentNode [
	"used for argument in subprogram calls and parameter in subprogram definition"

	| data |
	data := super visitArgument: anArgumentNode.

	data isCollection ifFalse: [ ^ data ].
	data size = 2 ifTrue: [ ^ data second ].
	^ data
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitAssign_expression: anAssignExpressionNode [
	"The assignment statement assigns a value to a variable, substring, array element, record, or record field"

	| data |
	data := super visitAssign_expression: anAssignExpressionNode.
	^ (self
		   newEntity: FASTFortranAssignmentStatement
		   atPosition: data first)
		  variable: data second;
		  expression: data third;
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitBinary: aBinaryExpressionNode [

	| data expr |
	data := super visitBinary: aBinaryExpressionNode.

	expr := data third.
	self set: expr startEnd: data first.
	expr
		left: data second;
		right: data fourth.
	^ expr
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitBlock_data: aBlockDataNode [

	| data |
	data := super visitBlock_data: aBlockDataNode.

	^ (self newEntity: FASTFortranBlockData atPosition: data first)
		  name: data second;
		  statementBlock: (FASTFortranStatementBlock new statements: data third);
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitBody: aNode [

	| data stmtBlock |
	data := aNode 
		ifNil: [ #() ]
		ifNotNil: [ super visitBody: aNode ].

	stmtBlock := FASTFortranStatementBlock new.
	self putMembers: data inBody: stmtBlock.
	
	^stmtBlock 

]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitCallStatement: aCallNode [
	"The CALL statement branches to the specified subroutine, executes the subroutine, and returns to the calling program after finishing the subroutine.

CALL sub [([ar[, ar]])] where sub is a name of the subroutine to be called, ar is an actual argument to be passed to the subroutine "

	| data |
	data := super visitCallStatement: aCallNode.

	^ (self newEntity: FASTFortranCallStatement atPosition: data first)
		  name: data second;
		  arguments: data third;
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitCharacterBaseType: aString [

	^FASTFortranCharacterType new
		mooseModel: model ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitCommonStatement: aCommonStatementNode [
	"creates common statement which defines a block of main memory storage so that different program units can share the same data without using arguments.

COMMON [/[cb]/] nlist [[,]/[cb]/ nlist] where 
cb: Common block name,
nlist: List of variable names, array names, and array declarators  "

	| data |
	data := super visitCommonStatement: aCommonStatementNode.
	^ self newEntity: FASTFortranCommonStatement atPosition: data first
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitConditions: aConditionList [
	"a list of {condition . thenPart}, each element being an elseif of the preceding element"

	| firstIf elseIf data |
	data := super visitConditions: aConditionList.

	firstIf := nil.
	elseIf := nil.
	data do: [ :each |
		| newIf |

		newIf := FASTFortranIfBlockStatement new
			mooseModel: model ;
			condition: each first;
			thenStatementBlock: each second;
			yourself.

		firstIf
			ifNil: [ firstIf := newIf ]
			ifNotNil: [ elseIf elseStatementBlock: ( FASTFortranStatementBlock new
				mooseModel: model ;
				statements: {newIf} ;
				yourself ) ].
		elseIf := newIf ].

	^ firstIf
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitContinueStatement: aContinueStatementNode [

	| data |
	data := super visitContinueStatement: aContinueStatementNode.

	^ self newEntity: FASTFortranContinueStatement atPosition: data
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDeclarationStatement: aDeclarationStatementNode [

	| data |
	data := super visitDeclarationStatement: aDeclarationStatementNode.

	^(self newEntity: FASTFortranDeclarationStatement atPosition: data first)
		type: data second;
			"TODO clarify the need of attributes"
		  "attributes: data third;"
		declarators: data fourth;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDeclarator: aDeclaratorNode [

	self flag: 'TODO: deal with the other keys in the map'.
	^ (super visitDeclarator: aDeclaratorNode) last
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDeclaratorVariable: aDeclaratorVariableNode [

	| data |
	data := super visitDeclaratorVariable: aDeclaratorVariableNode.
	^FASTFortranScalarVariable new
		mooseModel: model ;
		name: data second;
		yourself
	"sourceAnchor: (self makeIndexedAnchor: data first) ;"
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDeclarators: aDeclaratorsList [

	^ (super visitDeclarators: aDeclaratorsList) second
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitDivision: aDivisionOperatorNode [

	^FASTFortranBinaryExpression new
		mooseModel: model ;
		operator: (super visitDivision: aDivisionOperatorNode);
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDo: aDoNode [

	| data |
	data := super visitDo: aDoNode.

	^ (self newEntity: FASTFortranDoStatement atPosition: data first)
		  loopControl: data second;
		  statementBlock: data third ;
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDo_spec: aDoSpecNode [

	| data assignementExpr |
	data := super visitDo_spec: aDoSpecNode.

	assignementExpr := FASTFortranAssignmentExpression new
		variable: data second variable ;
		expression: data second expression ;
		yourself.

	^ (self
		   newEntity: FASTFortranLoopControlExpression
		   atPosition: data first)
		  flag: 'TODO: separate "init" into "controlVar" and "initValue" ';
		  init: assignementExpr;
		  limit: data third;
		  increment: data fourth;
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitEq: anEqualtoOperatorNode [

	^FASTFortranBinaryExpression new
		mooseModel: model ;
		operator: (super visitEq: anEqualtoOperatorNode);
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitExitStatement: anExitNode [

	| data |
	self flag: 'TODO -- what about "var" attribute ?'.

	data := super visitExitStatement: anExitNode.
	^ self newEntity: FASTFortranExitStatement atPosition: data first
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitExponentiation: aExponentiationOperatorNode [

	^FASTFortranBinaryExpression new
		mooseModel: model ;
		operator: (super visitExponentiation: aExponentiationOperatorNode);
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitExternalStatement: anExternalStatementNode [

	| data |
	data := super visitExternalStatement: anExternalStatementNode.
	^ (self
		   newEntity: FASTFortranExternalStatement
		   atPosition: data first)
		  name: data second first name;
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitFortranComment: aCommentNode [

	| data |
	data := super visitFortranComment: aCommentNode.
	^(self newEntity: FASTFortranComment atPosition: data first)
		content: 'C' , data second ;
		yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitFunctionAsValue: aFunctionNode [

	^ (super visitFunctionAsValue: aFunctionNode) second
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitFunctionParameters: aParameterList [
	| data |
	data := super visitFunctionParameters: aParameterList.
	^data
		ifEmpty: [ data ]
		ifNotEmpty: [ data second ]
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitFunctionStatement: aFunctionStatementNode [
	"FunctionStatement have a quite different representation than regular functions..."
	| data |
	data := super visitFunctionStatement: aFunctionStatementNode.

	^(self newEntity: FASTFortranFunctionStatement atPosition: data first)
		name: data second name ;
		arguments: data third ;
		expression: data fourth ;
		yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitFunctionWithBlocks: aFunctionNode [
	"^self visitJsonMap: aFunctionNode keys: #(span name type arguments blocks result subprograms)"

	| data |
	data := super visitFunctionWithBlocks: aFunctionNode.
	^(self newEntity: FASTFortranFunction atPosition: data first)
		name: data second ;
		flag: 'need to set return type' ;
		parameters: data fourth ;
		statementBlock: data fifth ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitFunction_call: aFunctionCallNode [

	| data |
	data := super visitFunction_call: aFunctionCallNode.

	^ (self newEntity: FASTFortranFunctionCall atPosition: data first)
		  name: data second;
		  arguments: data third;
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitGotoStatement: aGotoStatementNode [
	"so far only unconditional case is processed"

	| data |
	data := super visitGotoStatement: aGotoStatementNode.
	^(self newEntity: FASTFortranGoToStatement atPosition: data first)
		flag: 'TODO: target = data second';
		yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitGt: anOperatorNode [

	^FASTFortranBinaryExpression new
		mooseModel: model ;
		operator: (super visitGt: anOperatorNode);
		yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitGte: anOperatorNode [

	^FASTFortranBinaryExpression new
		mooseModel: model ;
		operator: (super visitGte: anOperatorNode);
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitIf: anIfNode [
	"ifNode has 'conditionals' and 'blocks'
	- 'conditionals' is an array of pairs where
	  - first element is an if/elseif condition
	  - second element contains all statements of the corresponding then
	- 'blocks' contains all statements of the last else (i.e. not an elseif)"

	| data ifStmt lastElse |
	data := super visitIf: anIfNode.
	ifStmt := data third.
	lastElse := data fourth.

	self set: ifStmt startEnd: data first.

	[ ifStmt elseStatementBlock isNil ]
	whileFalse: [ ifStmt := ifStmt elseStatementBlock statements first ].
	
	ifStmt elseStatementBlock: data fourth.

	^ data third
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitIf_logicalStatement: anIfNode [

	"self visitJsonMap: anIfNode keys: #( span condition statement )"
	
	| data |
	data := super visitIf_logicalStatement: anIfNode.

	^(self newEntity: FASTFortranIfLogicalStatement atPosition: data first)
		condition: data second;
		statement: data third ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitImplicitStatement: anImplicitStatementNode [
	"If 'items' is nil, correspond to the statement 'implicit none'"

	| data |
	data := super visitImplicitStatement: anImplicitStatementNode.
	^ data second
		  ifNil: [ self newEntity: FASTFortranImplicitStatement atPosition: data first ]
		  ifNotNil: [ self notYetImplemented ]
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitIntegerBaseType: aString [

	^FASTFortranIntegerType new
		mooseModel: model ;
		yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitIntegerLiteralValue: anIntegerLiteralValueNode [

	^FASTFortranIntegerLiteral new
		mooseModel: model ;
		primitiveValue: (super visitIntegerLiteralValue: anIntegerLiteralValueNode);
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitLogicalBaseType: aString [

	^FASTFortranLogicalType new
		mooseModel: model ;
		yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitLogicalLiteralValue: aLogicalLiteralValue [

	^FASTFortranBooleanLiteral new
		mooseModel: model ;
		primitiveValue: (super visitLogicalLiteralValue: aLogicalLiteralValue) ;
		yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitLt: anLessthanOperatorNode [

	^FASTFortranBinaryExpression new
		mooseModel: model ;
		operator: (super visitLt: anLessthanOperatorNode);
		yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitLte: anOperatorNode [

	^FASTFortranBinaryExpression new
		mooseModel: model ;
		operator: (super visitLte: anOperatorNode);
		yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitMain: aMainProgramNode [

	| data |
	data := super visitMain: aMainProgramNode.

	^ FASTFortranProgramMain new
		mooseModel: model ;
		name: data second;
		statementBlock: data third ;
		yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitMiFilename: aString [

	lineSizes ifEmpty: [
		self initLineSizes: aString asFileReference contents ].
	^ aString
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitMinus: aMinusOperatorNode [

	^FASTFortranBinaryExpression new
		mooseModel: model ;
		operator: (super visitMinus: aMinusOperatorNode);
		yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitMultiplication: aMultiplicationOperatorNode [

	^FASTFortranBinaryExpression new
		mooseModel: model ;
		operator: (super visitMultiplication: aMultiplicationOperatorNode) ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitPrintStatement: aPrintStatementNode [

	| data |
	data := super visitPrintStatement: aPrintStatementNode.

	^(self newEntity: FASTFortranPrintStatement atPosition: data first)
		format: data second;
		arguments: data third;
		yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitProgramFile: aProgramFileNode [
	model := FASTFortranModel new.
	^ (super visitProgramFile: aProgramFileNode) second
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitRealBaseType: aString [

	^FASTFortranRealType new
		mooseModel: model ;
		yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitRealLiteralValue: aRealLiteralValueNode [

	| data |
	data := super visitRealLiteralValue: aRealLiteralValueNode.
	^FASTFortranRealLiteral new
		mooseModel: model ;
		primitiveValue: data second;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitReturnStatement: aReturnStatementNode [

	| data |
	data := super visitReturnStatement: aReturnStatementNode.
	^self newEntity: FASTFortranReturnStatement atPosition: data first
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitReturn_spec: aReturn_specNode [

	^ (super visitReturn_spec: aReturn_specNode) second
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitStar: anObject [

	^FASTFortranAsterisk new
		mooseModel: model ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitStatement: aStatementNode [

	| data |
	data := super visitStatement: aStatementNode.

	data second ifNotNil: [ data third label: data second ].
	^ data third
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitStatementBlock: anASTStatementBlock [

	^ anASTStatementBlock collect: [ :astStatement |
		  self visitJsonMap: astStatement ] "FASTFortranStatementBlock new statements:"
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitStopStatement: aStopStatementNode [

	| data |
	data := super visitStopStatement: aStopStatementNode.

	^ (self newEntity: FASTFortranStopStatement atPosition: data first)
		  displayArgument: data second;
		  yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitStringLiteralValue: aString [

	^FASTFortranCharacterLiteral new
		mooseModel: model ;
		primitiveValue: (super visitStringLiteralValue: aString);
		yourself
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitSubroutine: aSubroutineNode [

	| data |
	data := super visitSubroutine: aSubroutineNode.

	^FASTFortranSubroutine new
		mooseModel: model ;
		name: data second;
		parameters: data third;
		statementBlock: data fourth;
		"sourceAnchor: (self makeIndexedAnchor: data first) ;"
		yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitSubscript: aSubscriptNode [

	| data |
	data := super visitSubscript: aSubscriptNode.

	^FASTFortranArrayVariable new
		mooseModel: model ;
		name: data second name;
		yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitSubtraction: aSubtractionOperatorNode [

	^FASTFortranBinaryExpression new
		mooseModel: model ;
		operator: (super visitSubtraction: aSubtractionOperatorNode);
		yourself
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitType: aTypeNode [

	^ (super visitType: aTypeNode) second
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitValue: aValueNode [

	| data val |
	data := super visitValue: aValueNode.

	val := data second.
	self set: val startEnd: data first.
	^ val
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitVariable: aVariableNode [

	| data |
	data := super visitVariable: aVariableNode.

	^FASTFortranScalarVariable new
		mooseModel: model ;
		name: data;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitWriteFormat: aWriteFormatNode [

	^ (super visitWriteFormat: aWriteFormatNode) second reject: #isNil
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitWriteStatement: aWriteStatementNode [
	"write statement. should follow the pattern: 
	WRITE([UNIT=] u [, [FMT=] f] [, IOSTAT=ios] [, REC=rn] [, ERR=s]) iolist
	WRITE([ UNIT=] u, [NML=] grname [, IOSTAT=ios] [, ERR=s])"

	| data |
	data := super visitWriteStatement: aWriteStatementNode.

	^(self newEntity: FASTFortranWriteStatement atPosition: data first)
		format: data second;
		arguments: data third;
		"sourceAnchor: (self makeIndexedAnchor: data first) ;"
		yourself

]
