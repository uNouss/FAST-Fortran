Class {
	#name : #FASTFortranJsonVisitor,
	#superclass : #FortranAbstractJsonVisitor,
	#category : #'FAST-Fortran-JSON-Visitor-Visitor'
}

{ #category : #'private - utilities' }
FASTFortranJsonVisitor >> builtVisitSelector: key [

	^ ('visit' , key capitalized , ':') asSymbol
]

{ #category : #'private - utilities' }
FASTFortranJsonVisitor >> builtVisitSelectorBaseTypes: key [

	^ ('visit' , key capitalized , 'BaseType' , ':') asSymbol
]

{ #category : #'private - utilities' }
FASTFortranJsonVisitor >> builtVisitStatementSelector: key [

	^ ('visit' , key capitalized , 'Statement:') asSymbol
]

{ #category : #'as yet unclassified' }
FASTFortranJsonVisitor >> do: anObject [
	self flag: 'TODO generated automatically, please insert your code here'.
	1 halt.

]

{ #category : #'reflective operations' }
FASTFortranJsonVisitor >> doesNotUnderstand: message [

	self class compile: message selector , ' anObject
	self flag: ''TODO generated automatically, please insert your code here''.
	1 halt.
'
]

{ #category : #'reflective operations' }
FASTFortranJsonVisitor >> label: anObject [
	self flag: 'TODO generated automatically, please insert your code here'.
	1 halt.

]

{ #category : #'reflective operations' }
FASTFortranJsonVisitor >> visit: aJsonElement [

	"Json elements are 
	- lists (an ordered sequenece of values) 
	- maps (an unordered associative array, mapping string property names to values)"

	aJsonElement isDictionary ifTrue: [ ^ self visitJsonMap: aJsonElement ].

	aJsonElement isArray ifTrue: [ ^ self visitJsonArray: aJsonElement ]
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitAddition: anObject [

	^ FASTFortranArithmeticExpression new
		  left: (self visit: (anObject at: 'left'));
		  right: (self visit: (anObject at: 'right'));
		  operator: (anObject at: 'op' at: 'tag')
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitAnno: anObject [

	^ nil.
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitArgumentValue: anObject [

	^ self visitTaggedElement: anObject
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitArray: anObject [
	
	"its a bullshit code that need to be rewritten"

	^ FASTFortranArray new name:
		  (self visitVariable: (anObject at: 'variable')) name

	"TODO process dimensions"

	"TODO process length"	
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitAssign_expression: anObject [

	^ self visitAssign_expressionStatement: anObject
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitAssign_expressionStatement: anObject [

	"The assignment statement assigns a value to a variable, substring, array element, record, or record field"

	^ FASTFortranAssignmentStatement new
		  variable: (self visit: (anObject at: 'target'));
		  expression: (self visit: (anObject at: 'expression'))
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitBase_type: anObject [

	^ self perform: (self builtVisitSelectorBaseTypes: anObject) with: anObject
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitBinary: anObject [
	| selector |
	
	selector := self builtVisitSelector: (anObject at: 'op' at: 'tag').
	^ self perform: selector with: anObject 

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitBlock_data: anObject [
	| data |

	data := super visitBlock_data: anObject.

	^ FASTFortranBlockData new
		flag: 'need to set source anchor' ;
		name: data second ;
		statements: data third ;
		yourself
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitCallArguments: aList [

	^ aList collect: [ :arg | self visitTaggedElement: (arg at: 'expr') ]
]

{ #category : #visiting }
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

{ #category : #visiting }
FASTFortranJsonVisitor >> visitCharacterBaseType: anObject [
	
	^ FASTFortranCharacterLiteral new 

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitComment: anObject [

	^ FASTFortranComment new content: (anObject at: 'comment')
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitCommon: aCommonNode [
	| data |
	data := super visitCommon: aCommonNode.
	^self visitJsonMap: aCommonNode keys: #(span common_groups)
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitCommonStatement: anObject [
	
	"creates common statement which defines a block of main memory storage so that different program units can share the same data without using arguments.

COMMON [/[cb]/] nlist [[,]/[cb]/ nlist] where 
cb: Common block name,
nlist: List of variable names, array names, and array declarators  "

	^ FASTFortranCommonStatement new

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitConditions: anObject else: elseObject [
	
	"read recursiveley a list of ""if then"" end ""if else"", adds else part if present"
	| conditional |

	conditional := FASTFortranIfBlockStatement new
		             condition: (self visitTaggedElement: anObject first first);
		             thenStatements: (self visit: anObject first last).

	anObject size > 1
		ifTrue: [
			| col |
			col := OrderedCollection new.
			col add: (self visitConditions: (anObject allButFirst)  else:  elseObject).
			conditional elseStatements: col.  ]
		ifFalse: [ 
			elseObject ifNotNil: [ 
				conditional elseStatements: (self visit: elseObject) ] ].
	
	^ conditional
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitContinueStatement: anObject [
	
	^ FASTFortranContinueStatement new

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitDeclaration: anObject [
	| data |

	data := super visitDeclaration: anObject.
	data fourth do: [ :varExp | varExp type: data second ].
	^FASTFortranVariablesDeclaration new
		variables: data fourth ;
		yourself.

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitDeclarationStatement: anObject [
	
	| type |
self flag: #REMOVE.
	type := (self visit: (anObject at: 'type') ) first.
	^ FASTFortranVariablesDeclaration new
		variables: ((self visitDeclarators: (anObject at: 'declarators')) do: [ :v | v type: type]).

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitDeclarator: aDeclaratorNode [
	^self visitDeclaratorVariable: (aDeclaratorNode at: 'variable')
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitDeclaratorVariable: aDeclaratorVariableNode [
	| data |
	data := super visitDeclaratorVariable: aDeclaratorVariableNode.
	^FASTFortranVariableExpression new
		flag: 'need to set source anchor' ;
		name: data second ;
		yourself
	
	
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitDeclarators: anObject [
self flag: #REMOVE.
	"^ (anObject at: 'list') collect: [ :each | 
		  self
			  perform: (self builtVisitSelector: (each at: #type))
			  with: each ]"
	^super visitDeclarators: anObject
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitDo: anObject [

	| loopControl loopControlExpression increment|
	
	loopControl := anObject at: 'do_spec'.
	increment := (loopControl at: 'increment').	
	loopControlExpression := FASTFortranLoopControlExpression new 
		init: (self visitTaggedElement: (loopControl at: 'initial'));
		limit: (self visitTaggedElement: (loopControl at: 'limit'));
		increment: ((increment isNotNil) ifTrue:[self visitTaggedElement: (loopControl at: 'increment') ] ifFalse: [nil]).
	
	^ (FASTFortranDoStatement new)
	statements: (self visitJsonArray: (anObject at: 'body'));
	loopControl: loopControlExpression.  
	

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitEq: anObject [
	
	^ FASTFortranLogicalExpression new 
		left: (self visitTaggedElement: (anObject at: 'left'));
		right: (self visitTaggedElement: (anObject at: 'right')); 
		operator: (anObject at: 'op' at: 'tag')

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitExitStatement: anObject [
	
	^ FASTFortranExitStatement new.

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitExponentiation: anObject [

	^ FASTFortranArithmeticExpression new
		  left: (self visit: (anObject at: 'left'));
		  right: (self visit: (anObject at: 'right'));
		  op: (anObject at: 'op' at: 'tag')
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitExpr: anObject [

	"encountered in the list of format variables. for the moment the only seen structure was 
	expr {contents:[], tag: expr}, which prevents from calling visitTagged element (creates infinite loop), so we visit 	value directly and adapt any other structural variants in the future"

	^ (anObject includesKey: 'contents')
		  ifTrue: [ self visit: (anObject at: 'contents') ]
		  ifFalse: [ self visitTaggedElement: anObject ]
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitExternalStatement: anObject [
	
	"The EXTERNAL statement specifies procedures or dummy procedures as external, and allows their symbolic names to be used as actual arguments.

EXTERNAL proc [, proc] ...
where proc is a name of external procedure, dummy procedure, or block data routine. "

	"you will go to hell for this code. TODO rewrite"
 ^ (FASTFortranExternalStatement new) name: (self visit: (anObject at: 'vars')) first first name.

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitFunctionStatement: anObject [
		
	^ FASTFortranFunctionStatement new
		name: (self visit: (anObject at: 'name'));
		arguments: (self visitJsonArray: (anObject at: 'arguments' at: 'list'));
		expression: (self visitTaggedElement: (anObject at: 'body')).
]

{ #category : #visiting }
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

{ #category : #visiting }
FASTFortranJsonVisitor >> visitFunction_call: anObject [

	"not a statement. call to a certain funstions (INTRINSIC, EXTERNAL) in expressions do not require a call statement"

	^ FASTFortranCallStatement new
		name: (self visit: (anObject at: 'function')) name;
		arguments: (self visitCallArguments:(anObject at: 'arguments' at: 'list'))
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitGotoStatement: anObject [

	"so far only unconditional case is processed"
	
	^ (FASTFortranGoToStatement new) label: (self visitTaggedElement: (anObject at: 'target'))	

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitIf: anObject [

	".blocks is an array with one block dedicated to else
	.conditionals is an erray where each element represent if and if else consequently 
	.conditionals[_].[0] represents a condition
	.conditionals[_].[1] is an array containing all statements of the correpsonding block"

	^ self
		  visitConditions: (anObject at: 'conditions')
		  else: (anObject at: 'blocks')
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitIf_logicalStatement: anObject [
	self flag: 'TODO generated automatically, please insert your code here'.
	1 halt.

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitImplicitStatement: anObject [
	
	"correspond to the statement implicit none. for the moment we create only a stub entity for the case of 'implicit none'"
	"TODO: implicit statement arguments"
	
	^ FASTFortranImplicitStatement new

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitInitial: anObject [

	^ nil
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitInteger: anObject [

	^ FASTFortranIntegerLiteral new value: (anObject at: 'contents')
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitIntegerBaseType: anObject [
	
	^ FASTFortranIntegerType new 

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitLabel: anObject [

	^ nil

	
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitLength: anObject [

	^ nil

	
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitList: anObject [

	^ self visit: anObject
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitLogical: anObject [

	(anObject at: 'contents') first
		ifTrue: [ ^ FASTFortranBooleanLiteral new value: 'true' ]
		ifFalse: [ ^ FASTFortranBooleanLiteral new value: 'false' ]
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitLogicalBaseType: anObject [

	^ FASTFortranLogicalType new

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitLt: anObject [
	
	^ FASTFortranLogicalExpression new operator: (anObject at: 'op' at: 'tag')

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitMain: anObject [

	^ FASTFortranProgramMain new
		  name: (anObject at: 'name');
		  statements: (self visitJsonArray: (anObject at: 'blocks')).
		
		
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitMeta: anObject [

	"nothing to do for FAST"

	^ nil
	
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitPrintStatement: anObject [

	^ FASTFortranPrintStatement new
		  format: (self visitTaggedElement: (anObject at: 'format'));
		  iolist: (self visitJsonArray: (anObject at: 'arguments' at: 'list'))
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitProgramFile: aProgramFileNode [
	^(super visitProgramFile: aProgramFileNode)
		second.
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitProgram_units: anObject [
	"anObject is an array of program units that can be main program (tag: main) or subprogram (tags: function, subroutine, ...)"

	^super visitProgram_units: anObject

	"anObject isArray
		ifTrue: [ 
			^ anObject collect: [ :value |
				""1 halt."" 
				(value includesKey: 'tag')
					ifTrue: [ self visitTaggedElement: value ]
					ifFalse: [ "" TODO exception "" ] ] 
				""^ self visitJsonArray: anObject""
				]
		ifFalse: [ "" TODO exception "" ]"
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitReal: anObject [

	^ FASTFortranRealLiteral new value: (anObject at: 'contents')

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitRealBaseType: anObject [
	
	^ FASTFortranRealType new

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitReturnStatement: anObject [
	
	^ FASTFortranReturnStatement new

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitReturn_spec: anObject [
	"alternate return label passed as an argument in a subroutine call".
	
	^ self visitValue: (anObject at:'target')
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitScalar: anObject [

	"not sure if it is correct"
	self flag: #REMOVE.
	^ self visitVariable: (anObject at: 'variable') 


]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitSelector: anObject [
	
	"type selector, met in a variable declaraion, for the moment not used"
	
	^ nil

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitSpan: anObject [

	" anObject is a source anchor in the form (a:b - c:d) where a and c are line numbers and b and d are columns. 
	for the moment ignored"
	
	^ nil

	
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitStar: anObject [

	^ FASTFortranAsterisk new.

]

{ #category : #visiting }
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

{ #category : #visiting }
FASTFortranJsonVisitor >> visitStatementBlock: anASTStatementBlock [

	^ "FASTFortranStatementBlock new statements:"
		  (anASTStatementBlock collect: [ :astStatement | 
			   self visitJsonMap: astStatement ])
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitStopStatement: anObject [

	| displayArgument |

	displayArgument := anObject at: 'message'.
	^ displayArgument
		  ifNotNil: [ 
			  FASTFortranStopStatement new displayArgument:
				  (self visitTaggedElement: displayArgument) ]
		  ifNil: [ FASTFortranStopStatement new ]
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitString: anObject [

	^ FASTFortranStringLiteral new value: (anObject at: 'contents')
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitStringBaseType: anObject [

	^ FASTFortranStringLiteral new
]

{ #category : #visiting }
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

{ #category : #visiting }
FASTFortranJsonVisitor >> visitSubtraction: anObject [
	
	^ FASTFortranArithmeticExpression new
		  left: (self visit: (anObject at: 'left'));
		  right: (self visit: (anObject at: 'right'));
		  operator: (anObject at: 'op' at: 'tag')

]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitTaggedElement: value [

	^ self
		  perform: (self builtVisitSelector: (value at: #tag))
		  with: value
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitTaggedStatement: value [

	^ self
		  perform: (self builtVisitStatementSelector: (value at: #tag))
		  with: value
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitValue: anObject [
	
	"| value |"
	"value := (anObject at: 'tag')."
	"^ self visitTaggedElement: anObject ."
	
	^ self visitArgumentValue: (anObject at: 'value').
]

{ #category : #visiting }
FASTFortranJsonVisitor >> visitVariable: anObject [

	"declaration of variable is ambigous and can be seen in diferent places of given data and might have different structure, which explains the necessity of the code below"

	^ (anObject includesKey: 'contents')
		  ifTrue: [ 
		  FASTFortranVariableExpression new name: (anObject at: 'contents') ]
		  ifFalse: [ self visitTaggedElement: anObject ]
]

{ #category : #visiting }
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
