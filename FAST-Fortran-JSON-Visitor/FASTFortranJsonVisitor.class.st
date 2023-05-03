Class {
	#name : #FASTFortranJsonVisitor,
	#superclass : #Object,
	#category : #'FAST-Fortran-JSON-Visitor-Visitor'
}

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> builtVisitSelector: key [

	^ ('visit' , key capitalized , ':') asSymbol
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> builtVisitSelectorBaseTypes: key [

	^ ('visit' , key capitalized , 'BaseType' , ':') asSymbol
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> builtVisitStatementSelector: key [

	^ ('visit' , key capitalized , 'Statement:') asSymbol
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> doesNotUnderstand: message [

	self class compile: message selector , ' anObject
	self flag: ''TODO generated automatically, please insert your code here''.
	1 halt.
'
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visit: aJsonElement [

	"Json elements are 
	- lists (an ordered sequenece of values) 
	- maps (an unordered associative array, mapping string property names to values)"

	aJsonElement isDictionary ifTrue: [ ^ self visitJsonMap: aJsonElement ].

	aJsonElement isArray ifTrue: [ ^ self visitJsonArray: aJsonElement ]
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitAddition: anObject [

	^ FASTFortranArithmeticExpression new
		  left: (self visit: (anObject at: 'left'));
		  right: (self visit: (anObject at: 'right'));
		  operator: (anObject at: 'op' at: 'tag')
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitAnno: anObject [

	^ nil.
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitArgumentValue: anObject [

	^ self visitTaggedElement: anObject
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitArguments: anASTArguments [

	^ self visit: (anASTArguments "at: 'list'")
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitArray: anObject [
	
	"its a bullshit code that need to be rewritten"

	^ FASTFortranArray new name:
		  (self visitVariable: (anObject at: 'variable')) name

	"TODO process dimensions"

	"TODO process length"	
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitAssign_expression: anObject [

	^ self visitAssign_expressionStatement: anObject
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitAssign_expressionStatement: anObject [

	"The assignment statement assigns a value to a variable, substring, array element, record, or record field"

	^ FASTFortranAssignmentStatement new
		  variable: (self visit: (anObject at: 'target'));
		  expression: (self visit: (anObject at: 'expression'))
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitBase_type: anObject [

	^ self perform: (self builtVisitSelectorBaseTypes: anObject) with: anObject
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitBinary: anObject [
	| selector |
	
	selector := self builtVisitSelector: (anObject at: 'op' at: 'tag').
	^ self perform: selector with: anObject 

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitBlock_data: anObject [

	| value |
	value := FASTFortranBlockData new.
	value name: (anObject at: 'name').

	value statements: (self visit: (anObject at: 'blocks')).

	^ value
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitCallArguments: aList [

	^ aList collect: [ :arg | self visitTaggedElement: (arg at: 'expr') ]
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitCallStatement: anObject [
	
	"The CALL statement branches to the specified subroutine, executes the subroutine, and returns to the calling program after finishing the subroutine.

CALL sub [([ar[, ar]])] where sub is a name of the subroutine to be called, ar is an actual argument to be passed to the subroutine "

	| callStatement arguments|
	
	"TODO bullshit code, need to be fixed"
	
	callStatement := FASTFortranCallStatement new.
	arguments := self visit: (anObject at: 'arguments').
	(arguments first notEmpty) ifTrue: [ callStatement arguments: (arguments first first)].
	callStatement name: ((self visit: (anObject at: 'function')) name).
	
	^ callStatement

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitCharacterBaseType: anObject [
	
	^ FASTFortranCharacterLiteral new 

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitComment: anObject [

	^ FASTFortranComment new content: (anObject at: 'comment')
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitCommonStatement: anObject [
	
	"creates common statement which defines a block of main memory storage so that different program units can share the same data without using arguments.

COMMON [/[cb]/] nlist [[,]/[cb]/ nlist] where 
cb: Common block name,
nlist: List of variable names, array names, and array declarators  "

	^ FASTFortranCommonStatement new

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitConditions: anObject else: elseObject [
	
	"read recursiveley a list of ""if then"" end ""if else"", adds else part if present"
	| conditional |

	conditional := FASTFortranIfBlockStatement new
		             condition: (self visitTaggedElement: anObject first first);
		             thenPart: (self visit: anObject first last).

	anObject size > 1
		ifTrue: [conditional elsePart: (self visitConditions: (anObject allButFirst)  else:  elseObject) ]
		ifFalse: [ 
			elseObject ifNotNil: [ 
				conditional elsePart: (self visit: elseObject) ] ].
	
	^ conditional
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitContinue: anObject [
	
	^ FASTFortranContinueStatement new

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitDeclarationStatement: anObject [
	
	| type |

	type := (self visit: (anObject at: 'type') ) first.
	^ FASTFortranVariablesDeclaration new
		variables: ((self visitDeclarators: (anObject at: 'declarators')) do: [ :v | v type: type]).

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitDeclarators: anObject [

	^ (anObject at: 'list') collect: [ :each | 
		  self
			  perform: (self builtVisitSelector: (each at: #type))
			  with: each ]
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitDo: anObject [

	| loopControl loopControlExpression increment|
	
	loopControl := anObject at: 'do_spec'.
	increment := (loopControl at: 'increment').	
	loopControlExpression := FASTFortranLoopControlExpression new 
		init: (self visitTaggedElement: (loopControl at: 'initial'));
		limit: (self visitTaggedElement: (loopControl at: 'limit'));
		increment: ((increment isNotNil) ifTrue:[self visitTaggedElement: (loopControl at: 'increment') ] ifFalse: [nil]).
	
	^ (FASTFortranDoStatement new)
	 block: (self visitJsonArray: (anObject at: 'body'));
	loopControl: loopControl.  
	

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitEq: anObject [
	
	^ FASTFortranLogicalExpression new 
		left: (self visitTaggedElement: (anObject at: 'left'));
		right: (self visitTaggedElement: (anObject at: 'right')); 
		operator: (anObject at: 'op' at: 'tag')

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitExitStatement: anObject [
	
	^ FASTFortranExitStatement new.

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitExponentiation: anObject [

	^ FASTFortranArithmeticExpression new
		  left: (self visit: (anObject at: 'left'));
		  right: (self visit: (anObject at: 'right'));
		  op: (anObject at: 'op' at: 'tag')
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitExpr: anObject [

	"encountered in the list of format variables. for the moment the only seen structure was 
	expr {contents:[], tag: expr}, which prevents from calling visitTagged element (creates infinite loop), so we visit 	value directly and adapt any other structural variants in the future"

	^ (anObject includesKey: 'contents')
		  ifTrue: [ self visit: (anObject at: 'contents') ]
		  ifFalse: [ self visitTaggedElement: anObject ]
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitExternalStatement: anObject [
	
	"The EXTERNAL statement specifies procedures or dummy procedures as external, and allows their symbolic names to be used as actual arguments.

EXTERNAL proc [, proc] ...
where proc is a name of external procedure, dummy procedure, or block data routine. "

	"you will go to hell for this code. TODO rewrite"
 ^ (FASTFortranExternalStatement new) name: (self visit: (anObject at: 'vars')) first first name.

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitFunction: anObject [

	| function |
	
	function := FASTFortranFunction new.
	function name: (anObject at: 'name').
	function parameters: (self visitJsonArray: (anObject at: 'arguments' at: 'list')).
	
	(anObject includesKey: 'body') ifTrue: [ function body: (self visitArguments: (anObject at: 'body')) ]
	ifFalse: [ function body: (self visitArguments: (anObject at: 'blocks'))  ]
	.
	
	^ function. 
	
	
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitFunctionStatement: anObject [
		
	^ FASTFortranFunctionStatement new
		name: (self visit: (anObject at: 'name'));
		arguments: (self visitJsonArray: (anObject at: 'arguments' at: 'list'));
		expression: (self visitTaggedElement: (anObject at: 'body')).
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitFunction_call: anObject [

	"not a statement. call to a certain funstions (INTRINSIC, EXTERNAL) in expressions do not require a call statement"

	^ FASTFortranCallStatement new
		  name: (self visit: (anObject at: 'function')) name;
		  arguments: (self visitCallArguments:(anObject at: 'arguments' at: 'list'))
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitGoto: anObject [

	"so far only unconditional case is processed"
	
	^ (FASTFortranGoToStatement new) label: (self visitTaggedElement: (anObject at: 'target'))	

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitIf: anObject [

	".blocks is an array with one block dedicated to else
	.conditionals is an erray where each element represent if and if else consequently 
	.conditionals[_].[0] represents a condition
	.conditionals[_].[1] is an array containing all statements of the correpsonding block"

	^ self
		  visitConditions: (anObject at: 'conditions')
		  else: (anObject at: 'blocks')
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitImplicitStatement: anObject [
	
	"correspond to the statement implicit none. for the moment we create only a stub entity for the case of 'implicit none'"
	"TODO: implicit statement arguments"
	
	^ FASTFortranImplicitStatement new

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitInitial: anObject [

	^ nil
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitInteger: anObject [

	^ FASTFortranIntegerLiteral new value: (anObject at: 'contents')
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitIntegerBaseType: anObject [
	
	^ FASTFortranIntegerType new 

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitJsonArray: aJsonArray [

	"process JSON Array"

	^ aJsonArray collect: [ :value |
			"1 halt." 
		  (value includesKey: 'tag')
			  ifTrue: [ self visitTaggedElement: value ]
			  ifFalse: [ self visit: value ] ]
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitJsonMap: aJsonMap [

	"process JSON map (dictionary)"

	| newCollection result |
	"explain why"
	(aJsonMap includesKey: 'tag') ifTrue: [ 
		^ self visitTaggedElement: aJsonMap ].

	newCollection := OrderedCollection new: aJsonMap size.

	aJsonMap associationsDo: [ :assoc | 
		| selector |
		selector := self builtVisitSelector: assoc key.
		"1 halt."
		newCollection add: (self perform: selector with: assoc value) ].

	"1 halt."
	"SHIT-CODE AWARD WINNER:"
	result := newCollection reject: [ :each | each isNil ].
	^ result
	"result size = 1
		ifTrue: [ ^ result first ]
		ifFalse: [ ^ result ]"
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitLabel: anObject [

	^ nil

	
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitLength: anObject [

	^ nil

	
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitList: anObject [

	^ self visit: anObject
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitLogical: anObject [

	(anObject at: 'contents') first
		ifTrue: [ ^ FASTFortranBooleanLiteral new value: 'true' ]
		ifFalse: [ ^ FASTFortranBooleanLiteral new value: 'false' ]
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitLogicalBaseType: anObject [

	^ FASTFortranLogicalType new

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitMain: anObject [

	^ FASTFortranProgramMain new
		  name: (anObject at: 'name');
		  statements: (self visitJsonArray: (anObject at: 'blocks')).
		
		
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitMeta: anObject [

	"nothing to do for FAST"

	^ nil
	
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitName: anObject [

	"encountered in the list of format variables. for the moment ignored"

	^ nil
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitPrintStatement: anObject [

	^ FASTFortranPrintStatement new
		  format: (self visitTaggedElement: (anObject at: 'format'));
		  iolist: (self visitJsonArray: (anObject at: 'arguments' at: 'list'))
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitProgram_units: anObject [

	"anObject is an array of program units that can be main program (tag: main) or subprogram (tags: function, subroutine, ...)"

	anObject isArray
		ifTrue: [ 
			^ anObject collect: [ :value |
				"1 halt." 
				(value includesKey: 'tag')
					ifTrue: [ self visitTaggedElement: value ]
					ifFalse: [ " TODO exception " ] ] 
				"^ self visitJsonArray: anObject"
				]
		ifFalse: [ " TODO exception " ]
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitReal: anObject [

	^ FASTFortranRealLiteral new value: (anObject at: 'contents')

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitRealBaseType: anObject [
	
	^ FASTFortranRealType new

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitReturnStatement: anObject [
	
	^ FASTFortranReturnStatement new

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitReturn_spec: anObject [
	"alternate return label passed as an argument in a subroutine call".
	
	^ self visitValue: (anObject at:'target')
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitScalar: anObject [

	"not sure if it is correct"
	
	^ self visitVariable: (anObject at: 'variable') 


]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitSelector: anObject [
	
	"type selector, met in a variable declaraion, for the moment not used"
	
	^ nil

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitSpan: anObject [

	" anObject is a source anchor in the form (a:b - c:d) where a and c are line numbers and b and d are columns. 
	for the moment ignored"
	
	^ nil

	
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitStar: anObject [

	^ FASTFortranAsterisk new.

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitStatement: anObject [

	| statement |
	"1 halt."
	statement := anObject at: 'statement'.

	"we expect a statement to have a tag"
	(statement includesKey: 'tag')
		ifTrue: [ 
			| st label |
			st := self visitTaggedStatement: statement.
			
			"statement might have a label"
			label := anObject at: 'label'.
			^ label
				  ifNotNil: [ st label: (self visitValue: label) ]
				  ifNil: [ st ] ]
		ifFalse: [ "TODO exception" ]
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitStatementBlock: anASTStatementBlock [

	^ "FASTFortranStatementBlock new statements:"
		  (anASTStatementBlock collect: [ :astStatement | 
			   self visitJsonMap: astStatement ])
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitStop: anObject [

	| displayArgument |

	displayArgument := anObject at: 'message'.
	^ displayArgument
		  ifNotNil: [ 
			  FASTFortranStopStatement new displayArgument:
				  (self visitTaggedElement: displayArgument) ]
		  ifNil: [ FASTFortranStopStatement new ]
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitString: anObject [

	^ FASTFortranStringLiteral new value: (anObject at: 'contents')
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitStringBaseType: anObject [

	^ FASTFortranStringLiteral new
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitSubroutine: anObject [

	^ FASTFortranSubroutine new
		  name: (anObject at: 'name');
		  parameters:
			  (self visitArguments: (anObject at: 'arguments')) first;
		  statements: (self visitStatementBlock: (anObject at: 'blocks'))
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitSubtraction: anObject [
	
	^ FASTFortranArithmeticExpression new
		  left: (self visit: (anObject at: 'left'));
		  right: (self visit: (anObject at: 'right'));
		  op: (anObject at: 'op' at: 'tag')

]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitTaggedElement: value [

	^ self
		  perform: (self builtVisitSelector: (value at: #tag))
		  with: value
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitTaggedStatement: value [

	^ self
		  perform: (self builtVisitStatementSelector: (value at: #tag))
		  with: value
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitValue: anObject [
	
	"| value |"
	"value := (anObject at: 'tag')."
	"^ self visitTaggedElement: anObject ."
	
	^ self visitArgumentValue: (anObject at: 'value').
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitVariable: anObject [

	"declaration of variable is ambigous and can be seen in diferent places of given data and might have different structure, which explains the necessity of the code below"

	^ (anObject includesKey: 'contents')
		  ifTrue: [ 
		  FASTFortranVariableExpression new name: (anObject at: 'contents') ]
		  ifFalse: [ self visitTaggedElement: anObject ]
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> visitWriteStatement: anObject [
	
	"write statement. should follow the pattern: 
	WRITE([UNIT=] u [, [FMT=] f] [, IOSTAT=ios] [, REC=rn] [, ERR=s]) iolist
	WRITE([ UNIT=] u, [NML=] grname [, IOSTAT=ios] [, ERR=s])"

	| statement |
	statement := FASTFortranWriteStatement new
		             format: (self visit: (anObject at: 'format'));
		             iolist:
			             (self visit: (anObject at: 'arguments' at: 'list')).

	^ statement

]
