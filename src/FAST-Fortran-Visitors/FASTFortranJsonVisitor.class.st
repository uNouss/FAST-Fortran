Class {
	#name : #FASTFortranJsonVisitor,
	#superclass : #FortranAbstractJsonVisitor,
	#instVars : [
		'lineSizes',
		'model'
	],
	#category : #'FAST-Fortran-Visitors-Importer'
}

{ #category : #private }
FASTFortranJsonVisitor >> functionCallToArrayVariable: invocation [

	^ FASTFortranArrayVariable new
		name: invocation name ;
		indices: invocation arguments ;
		startPos: invocation startPos;
		endPos: invocation endPos;
		yourself
]

{ #category : #initialization }
FASTFortranJsonVisitor >> initLineSizes: fortranSource [

	lineSizes := fortranSource lines collect: #size
]

{ #category : #initialization }
FASTFortranJsonVisitor >> initialize [

	super initialize.

	lineSizes := #(  )
]

{ #category : #private }
FASTFortranJsonVisitor >> integerLiteralToLabelRef: literal [

	^ FASTFortranLabelReference new
		  label: literal primitiveValue;
		  startPos: literal startPos;
		  endPos: literal endPos;
		  yourself
]

{ #category : #private }
FASTFortranJsonVisitor >> invertLiteral: aFASTFortranLiteral class: class [

	| number |
	number := class readFrom: aFASTFortranLiteral primitiveValue.
	number := number * -1.
	aFASTFortranLiteral primitiveValue: number asString.

	aFASTFortranLiteral startPos: aFASTFortranLiteral startPos - 1.

	^aFASTFortranLiteral
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

	| start end |
	entities ifEmpty: [ ^self ].

	start := entities first startPos.
	end   := entities first endPos.

	entities do: [ :each |
		start := start min: each startPos.
		end   := end max: each endPos.

		each isStatement
			ifTrue: [ stmtBlock addStatement: each ]
			ifFalse: [ stmtBlock addComment: each ]
	].

	stmtBlock startPos: start.
	stmtBlock endPos: end
]

{ #category : #private }
FASTFortranJsonVisitor >> set: aFASTFortranNode startEnd: startEndPoints [

	aFASTFortranNode
		startPos: (self pointToPosition: startEndPoints first);
		endPos: (self pointToPosition: startEndPoints second) - 1
]

{ #category : #private }
FASTFortranJsonVisitor >> setBodyPosition: aProgramUnit fromProgramUnitPosition: startEndPoints [

	"sets a reasonnable start/end position for a statementBlock:
	 - startPos = first character of parent node second line (first line + 1)
	 - endPos = first character of parent node last line
	(note: set:startEnd: substract 1 to end position so we give it the 2nd character of this line)"

	| body bodyStartEnd |
	body := aProgramUnit statementBlock.
	
	body ifNil: [ ^nil ].
	
	bodyStartEnd := {
		startEndPoints first x +1 @ 1 .
		startEndPoints second x @ 2
	}.
	self set: body startEnd: bodyStartEnd

]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitAddition: anAdditionOperatorNode [

	^'+'
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

{ #category : #visiting }
FASTFortranJsonVisitor >> visitArrayDeclarationDim: arrayDeclarationDim [

	| data |
	data := super visitArrayDeclarationDim: arrayDeclarationDim.

	^(self newEntity: FASTFortranArrayRange atPosition: data first)
		lowerBound: data second ;
		upperBound: data third ;
		yourself
]

{ #category : #'visiting expression' }
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

{ #category : #visiting }
FASTFortranJsonVisitor >> visitCharacterBaseType: aString [

	^FASTFortranCharacterType new
		mooseModel: model ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitCommonGroup: aCommonGroupNode [
	"#(span name varList)"

	| data |
	data := super visitCommonGroup: aCommonGroupNode.

	^(self newEntity: FASTFortranCommonGroup atPosition: data first)
		name: (data second ifNil: [ nil ] ifNotNil: [ :groupName | groupName second]) ;
		declarators: data third ;
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

	^(self newEntity: FASTFortranCommonStatement atPosition: data first)
		groups: data second ;
		yourself
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitComplexBaseType: aString [

	^FASTFortranComplexType new
		mooseModel: model ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitConditions: aConditionList [
	"a list of {condition . thenPart}, each element being an elseif of the preceding element"

	| firstIf elseIf data |
	data := super visitConditions: aConditionList.

	firstIf := nil.
	elseIf := nil.
	data do: [ :condAndThenPair |
		| newIf |

	"no way to know exactly the starting and ending position of this if
	 we use the condition startPos - 3 ('IF ') and the then block endPosition"
		newIf := FASTFortranIfBlockStatement new
			mooseModel: model ;
			startPos: condAndThenPair first startPos - 3 ;
			endPos: condAndThenPair second endPos ;
			condition: condAndThenPair first;
			thenStatementBlock: condAndThenPair second;
			yourself.

		firstIf
			ifNil: [ firstIf := newIf ]
			ifNotNil: [ elseIf elseStatementBlock: ( FASTFortranStatementBlock new
				mooseModel: model ;
				startPos: newIf startPos ;
				endPos: newIf endPos ;
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
FASTFortranJsonVisitor >> visitDataGroup: aDataGroup [

	| data |
	data :=  super visitDataGroup: aDataGroup.

	^(self newEntity: FASTFortranDataGroup  atPosition: data first)
		variables: data second ;
		dataConstants: data third ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDataStatement: aDataStatement [

	| data stmt |
	data :=  super visitDataStatement: aDataStatement.

	"error in #span of dataStatement in the exported Json"
	stmt := self newEntity: FASTFortranDataStatement atPosition: data first.
	stmt variableGroups: data second second.
	stmt endPos: (stmt variableGroups last endPos).
	
	^stmt
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDeclarationStatement: aDeclarationStatementNode [

	| data |
	data := super visitDeclarationStatement: aDeclarationStatementNode.

	^(self newEntity: FASTFortranVariableDeclarationStatement atPosition: data first)
		type: data second ;
		  "attributes: data third ;"
		declarators: data fourth ;
		yourself
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitDeclarator: aDeclaratorNode [
	"#(span initial length dims variable)"

	| data declarator |
	data := super visitDeclarator: aDeclaratorNode.

	declarator := data fifth.
	data second ifNotNil: [ :initialization | declarator expression: initialization ].
	data fourth ifNotNil: [ :dimensions | declarator dimensions: dimensions ].

	^declarator
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitDeclaratorVariable: aDeclaratorVariableNode [

	| data |
	data := super visitDeclaratorVariable: aDeclaratorVariableNode.

	^(self newEntity: FASTFortranVariableDeclarator atPosition: data first)
		variable: data second ;
		yourself
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitDeclarators: aDeclaratorsList [

	^ (super visitDeclarators: aDeclaratorsList) second
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDimensionStatement: aDimensionStatementNode [
	"#(span declarators)"

	| data |
	data := super visitDimensionStatement: aDimensionStatementNode.

	^(self newEntity: FASTFortranDimensionStatement atPosition: data first)
		declarators: data second ;
		yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitDivision: aDivisionOperatorNode [

	^'/'
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDo: aDoNode [
	"#(span do_spec target body end_label)
	- target is a label number (optional)
	- end_label is the 'terminal statement' (typically a 'continue') with that label

	Note about 'fortran-src': if the 'end_label' is a CONTINUE labeled statement,
	then the CONTINUE deos not appear in the AST
	this can be detected because the DO span does not include the end_label span"

	| data doStatement body |

	data := super visitDo: aDoNode.
	
	doStatement := self newEntity: FASTFortranDoStatement atPosition: data first.
	doStatement loopControl: data second.

	data third ifNotNil: [ :target |
		doStatement labelReferences: { self integerLiteralToLabelRef: target }
	].
	
	body := data fourth.
	
	data fifth ifNotNil: [ :endLabel || lastStatement |
		(endLabel endPos > doStatement endPos) ifTrue: [
			"need to create a CONTINUE statement to close the loop"
			lastStatement := FASTFortranContinueStatement new.
			lastStatement startPos: endLabel startPos.
			lastStatement endPos: doStatement endPos.
			lastStatement label: endLabel primitiveValue.
		
			body addStatement: lastStatement
		]
	 ].

	doStatement statementBlock: body.

	^doStatement
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitDo_spec: aDoSpecNode [
	"#(span initial limit increment)
	 'init' is an AssignementStatement, need to convert it to an AssignementExpression"

	| data assignementExpr |
	data := super visitDo_spec: aDoSpecNode.

	assignementExpr := FASTFortranAssignmentExpression new
		startPos: data second startPos ;
		endPos: data second endPos ;
		variable: data second variable ;
		expression: data second expression ;
		yourself.

	^ (self
		   newEntity: FASTFortranLoopControlExpression
		   atPosition: data first)
		  init: assignementExpr ;
		  limit: data third ;
		  increment: data fourth ;
		  yourself
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitDouble_precisionBaseType: aString [

	^FASTFortranDoublePrecisionType new
		mooseModel: model ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitEntryStatement: anEntryNode [
	"#(span name args return)"

	| data |
	data := super visitEntryStatement: anEntryNode.

	^ (self newEntity: FASTFortranEntryStatement atPosition: data first)
		name: data second name ;
		entryArguments: data third ;
		yourself
	
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitEquivalenceGroup: anEquivalenceGroup [

	| data variables |
	data :=  super visitEquivalenceGroup: anEquivalenceGroup.
	
	"array variables might be created as function calls ..."
	variables := data second collect: [ :var |
		(var class = FASTFortranFunctionCall)
			ifTrue: [ self functionCallToArrayVariable: var ]
			ifFalse: [ var ]
	].

	^(self newEntity: FASTFortranEquivalenceGroup atPosition: data first)
		variables: variables ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitEquivalenceStatement: anEquivalenceStatement [

	| data |
	data :=  super visitEquivalenceStatement: anEquivalenceStatement.

	^(self newEntity: FASTFortranEquivalenceStatement atPosition: data first)
		variableGroups: data second second ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitExitStatement: anExitNode [

	| data |
	data := super visitExitStatement: anExitNode.
	^ self newEntity: FASTFortranExitStatement atPosition: data first
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitExponentiation: aExponentiationOperatorNode [

	^'**'
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
FASTFortranJsonVisitor >> visitFormatStatement: aFormatStatement [

	| data |
	data := super visitFormatStatement: aFormatStatement.

	^(self newEntity: FASTFortranFormatStatement atPosition: data first)
		formatDescription: data second ;
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

	^ super visitFunctionParameters: aParameterList
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
	"#(span name type arguments blocks result subprograms)"

	| data function |
	data := super visitFunctionWithBlocks: aFunctionNode.

	function := (self newEntity: FASTFortranFunction atPosition: data first)
		name: data second ;
		returnType: data third ;
		parameters: data fourth ;
		statementBlock: data fifth ;
		yourself.

	data fifth statements ifEmpty: [
		"only useful for the tests ?"
		self
			setBodyPosition: function
			fromProgramUnitPosition: data first
	].

	^function
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

	^ (self newEntity: FASTFortranGoToStatement atPosition: data first)
		  labelReferences: { self integerLiteralToLabelRef: data second } ;
		  yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitGoto_computedStatement: aGotoComputedStatementNode [
	"#(span labels target)"

	| data |
	data := super visitGoto_computedStatement: aGotoComputedStatementNode.

	^(self newEntity: FASTFortranGoToComputedStatement atPosition: data first)
		labelReferences: (data second collect: [:lit | self integerLiteralToLabelRef: lit]) ;
		selectorExpression: data third ;
		yourself
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitIOParameter: anIOParameterNode [
	"#(span name expr)"

	| data assignedVariable|
	data := super visitIOParameter: anIOParameterNode.

	data second ifNil: [ ^data third ].

	assignedVariable := FASTFortranScalarVariable new.
	assignedVariable name: data second.
	assignedVariable startPos: (self pointToPosition: data first first).
	assignedVariable endPos: (assignedVariable startPos + assignedVariable name size - 1).

	^(self newEntity: FASTFortranAssignmentExpression atPosition: data first)
		variable: assignedVariable ;
		expression: data third ;
		yourself

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitIOParameters: aWriteFormatNode [

	^ (super visitIOParameters: aWriteFormatNode) second reject: #isNil
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitIf: anIfNode [
	"ifNode has 'conditionals' and 'blocks'
	- 'conditionals' is an array of pairs where
	  - first element is an if/elseif condition
	  - second element contains all statements of the corresponding then
	- 'blocks' contains all statements of the last else (i.e. not an elseif)"

	| data ifStmt |
	data := super visitIf: anIfNode.
	ifStmt := data third.

	self set: ifStmt startEnd: data first.

	[ ifStmt elseStatementBlock isNil ]
	whileFalse: [ ifStmt := ifStmt elseStatementBlock statements first ].

	ifStmt elseStatementBlock:  ((data fourth statements , data fourth comments)
		ifEmpty: [ nil ]
		ifNotEmpty: [ data fourth ]).

	^ data third
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitIf_arithmeticStatement: anIfArithmeticStatement [ 
	"span expression less equal greater"
	
	| data |
	data := super visitIf_arithmeticStatement: anIfArithmeticStatement.
	
	^(self newEntity: FASTFortranIfArithmeticStatement atPosition: data first)
		condition: data second ;
		lessLabel: data third ;
		equalLabel: data fourth ;
		greaterLabel: data fifth ;
		yourself
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
	"#(span items)
	 If 'items' is nil, correspond to the statement 'implicit none'"

	| data |
	data := super visitImplicitStatement: anImplicitStatementNode.
	^(self newEntity: FASTFortranImplicitStatement atPosition: data first)
		typingRules: (data second
		  ifNil: [ #() ]
		  ifNotNil: [:rules | rules]) ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitImplicitStatementRange: anImplicitStatementRangeNode [
	"#(span from to)"

	| data |
	data := super visitImplicitStatementRange: anImplicitStatementRangeNode.

	^(self newEntity: FASTFortranImplicitRange atPosition: data first)
		from: data second ;
		to: data third ;
		yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitImplied_do:  anImpliedDoListsNode [ 
	"span do_spec expressions"

	| data |
	data := super visitImplied_do:  anImpliedDoListsNode.

	^(self newEntity: FASTFortranImpliedDoExpression atPosition: data first)
		loopControl: data second ;
		variables: (data copyFrom: 3 to: data size) ;
		yourself
]

{ #category : #visiting }
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

{ #category : #visiting }
FASTFortranJsonVisitor >> visitItems: anImplicitItemsNode [
	"#(span type elements)"

	| data |
	data := super visitItems: anImplicitItemsNode.

	^data
		ifNotNil: [
			data second collect: [ :ruleData |
				(self newEntity: FASTFortranImplicitTypingRule atPosition: ruleData first)
					type: ruleData second ;
					ranges: ruleData third ;
					yourself
			]
	]
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitLabelReference: aLabelReference [
	| data |
	data := super visitJsonElement: aLabelReference.

	^FASTFortranLabelReference new
		label: data primitiveValue ;
		startPos: data startPos ;
		endPos: data endPos ;
		yourself
]

{ #category : #visiting }
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

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitMain: aMainProgramNode [
	"#(span name blocks subprograms)"

	| data main |
	data := super visitMain: aMainProgramNode.

	main := (self newEntity: FASTFortranProgramMain atPosition: data first)
		name: data second;
		statementBlock: data third ;
		yourself.

	self setBodyPosition: main fromProgramUnitPosition: data first.

	^main
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitMessage: aMessageNode [
	"STOP or PAUSE message: kept as a simple string
	+ small hack to differentiate integer values from Strings"

	| data |
	data := super visitMessage: aMessageNode.

	data ifNil: [ ^nil ].
	(data isKindOf: FASTFortranIntegerLiteral) ifTrue: [ ^data primitiveValue ].
	^'''' , data primitiveValue , ''''
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonVisitor >> visitMiFilename: aString [

	lineSizes ifEmpty: [
		self initLineSizes: aString asFileReference contents ].
	^ aString
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitMultiplication: anOperatorNode [

	^'*'
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitOp: anOperatorNode [

	^FASTFortranBinaryExpression new
		mooseModel: model ;
		operator: (super visitOp: anOperatorNode);
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitParameterStatement: aParameterStatementNode [ 

	| data |
	data := super visitParameterStatement: aParameterStatementNode.

	^(self newEntity: FASTFortranParameterStatement atPosition: data first)
		declarators: data second ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitPauseStatement: aPauseStatementNode [

	| data |
	data := super visitStopStatement: aPauseStatementNode.

	^ (self newEntity: FASTFortranPauseStatement atPosition: data first)
		  displayArgument: data second ;
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

{ #category : #visiting }
FASTFortranJsonVisitor >> visitRange: aRangeNode [
	"span lower upper stride"

	| data |
	data := super visitRange: aRangeNode.

	^(self newEntity: FASTFortranArrayRange atPosition: data first)
		lowerBound: data second ;
		upperBound: data third ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitReadStatement: aReadStatementNode [
	"see #visitWriteStatement:
	visited keys are: #(span ioParameters arguments)"

	| data |
	data := super visitReadStatement: aReadStatementNode.

	^(self newEntity: FASTFortranReadStatement atPosition: data first)
		ioParameters: data second;
		arguments: data third;
		yourself

]

{ #category : #visiting }
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
		primitiveValue: (data second ifNil: [ data first ] ifNotNil: [data first , data second]);
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
FASTFortranJsonVisitor >> visitSelector: aSelectorNode [
	"#(span kind length)"

	| data |
	data := super visitSelector: aSelectorNode.

	data ifNil: [ ^nil ].
	data second ifNotNil: [ :kind | ^kind ].
	^data third
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitSingle: anArraySingleIndexNode [
	"#(span index)"

	^(super visitSingle: anArraySingleIndexNode)
		second

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitStar: anObject [

	^FASTFortranAsterisk new
		mooseModel: model ;
		yourself
]

{ #category : #'visiting statement' }
FASTFortranJsonVisitor >> visitStatement: aStatementNode [
	"#(span label statement)"

	| data |
	data := super visitStatement: aStatementNode.

	data second ifNotNil: [
		data third label: data second primitiveValue ].

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
	"#(span name arguments blocks)"

	| data routine |
	data := super visitSubroutine: aSubroutineNode.

	routine := (self newEntity: FASTFortranSubroutine atPosition: data first)
		name: data second;
		parameters: data third;
		statementBlock: data fourth;
		yourself.

	data fourth statements ifEmpty: [
		"only useful for the tests ?"
		self
			setBodyPosition: routine
			fromProgramUnitPosition: data first
	].

	^routine
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitSubscript: aSubscriptNode [

	| data |
	data := super visitSubscript: aSubscriptNode.

	^(self newEntity: FASTFortranArrayVariable atPosition: data first)
		name: data second name ;
		indices: data third ;
		yourself
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitSubtraction: aSubtractionOperatorNode [
	^'-'
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitType: aTypeNode [
	"#(span base_type selector)"

	| data |
	data := super visitType: aTypeNode.
	self
		set: data second
		startEnd: data first.

	 	data second size:
			(data third
				ifNil: [ nil ]
				ifNotNil: [ :typeSize | typeSize ]).

	^data second
]

{ #category : #'visiting expression' }
FASTFortranJsonVisitor >> visitUnary: aUnaryNode [
	"possible negative number, if so invert it and forget about the unaryOperator"

	| data |
	data := super visitUnary: aUnaryNode.

	(data second operator = '-')
	ifTrue: [
		(data third class = FASTFortranIntegerLiteral)
			ifTrue: [ ^self invertLiteral: data third class: Integer ].
		(data third class = FASTFortranRealLiteral)
			ifTrue: [ ^self invertLiteral: data third class: Float ]
	].

	^(self newEntity: FASTFortranUnaryExpression atPosition: data first)
		operator: (data second operator) ;
		expression: data third ;
		yourself
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
FASTFortranJsonVisitor >> visitWriteStatement: aWriteStatementNode [
	"write statement. should follow the pattern: 
	WRITE([UNIT=] u [, [FMT=] f] [, IOSTAT=ios] [, REC=rn] [, ERR=s]) iolist
	WRITE([ UNIT=] u, [NML=] grname [, IOSTAT=ios] [, ERR=s])
	
	Part within parentheses are the IO-Parameters
	Part after the parentheses are the argument
	
	visited keys are: #(span ioParameters arguments)"

	| data |
	data := super visitWriteStatement: aWriteStatementNode.

	^(self newEntity: FASTFortranWriteStatement atPosition: data first)
		ioParameters: data second;
		arguments: data third;
		yourself

]
