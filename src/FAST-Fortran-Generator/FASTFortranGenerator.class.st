Class {
	#name : #FASTFortranGenerator,
	#superclass : #FASTMetamodelGenerator,
	#instVars : [
		'programUnit',
		'comment',
		'procedure',
		'subprogram',
		'blockData',
		'function',
		'mainprogram',
		'subroutine',
		'acceptStatement',
		'assignStatement',
		'assignmentStatement',
		'automaticStatement',
		'backspaceStatement',
		'callStatement',
		'closeStatement',
		'commonStatement',
		'continueStatement',
		'dataStatement',
		'decodeStatement',
		'encodeStatement',
		'dimensionStatement',
		'doStatement',
		'doWhileStatement',
		'elseStatement',
		'elseIfStatement',
		'endStatement',
		'endDoStatement',
		'endFileStatement',
		'endIfStatement',
		'endMapStatement',
		'endStructureStatement',
		'endUnionStatement',
		'entryStatement',
		'equivalenceStatement',
		'externalStatement',
		'formatStatement',
		'goToStatement',
		'goToAssignedStatement',
		'goToComputed',
		'goToUnconditional',
		'ifArithmeticStatement',
		'ifBlockStatement',
		'ifLogicalStatement',
		'implicitStatement',
		'includeStatement',
		'inquireStatement',
		'intrinsicStatement',
		'mapStatement',
		'nameListStatement',
		'openStatement',
		'optionsStatement',
		'parameterStatement',
		'pauseStatement',
		'pragmaStatement',
		'printStatement',
		'readStatement',
		'rewindStatement',
		'saveStatement',
		'staticStatement',
		'stopStatement',
		'unionStatement',
		'virtualStatement',
		'volatileStatement',
		'writeStatement',
		'arithmeticExpression',
		'characterExpression',
		'logicalExpression',
		'loopControlExpression',
		'array',
		'arrayDimensionDeclarator',
		'substring',
		'pointer',
		'record',
		'recordField',
		'structure',
		'arithmeticConstant',
		'complexConstant',
		'type',
		'byteType',
		'characterType',
		'complexType',
		'doubleComplexType',
		'doublePrecisionType',
		'integerType',
		'logicalType',
		'realType',
		'exitStatement',
		'doubleComplexConstant',
		'doublePrecisionConstant',
		'integerConstant',
		'realConstant',
		'tWithFormatIdentifier',
		'tFormatIdentifier',
		'asterisk',
		'tWithIOList',
		'tIOListMember',
		'ampersand',
		'tAssigneable',
		'tWithAssigneable',
		'tBinaryExpression',
		'variableDeclaration',
		'functionStatement'
	],
	#category : #'FAST-Fortran-Generator'
}

{ #category : #generating }
FASTFortranGenerator class >> generate [

	"TODO: can it be removed? As FamixMetamodelGenerator class has generate"

	<script>
	^ super generate
]

{ #category : #generating }
FASTFortranGenerator class >> packageName [

	^ #'FAST-Fortran-Entities'
]

{ #category : #generating }
FASTFortranGenerator class >> prefix [

	^ #FASTFortran
]

{ #category : #generating }
FASTFortranGenerator class >> submetamodels [

	^ { FASTMetamodelGenerator }
]

{ #category : #definition }
FASTFortranGenerator >> defineClasses [

	super defineClasses.
	
	"FAMIX-level classes (might be removed later)"
	programUnit := builder
		               newClassNamed: #ProgramUnit
		               comment:
		               'A fortran program unit is a sequence of statements, terminated by an END statement. Every program unit is either a main program or a subprogram. If a program is to be executable, it must have a main program'.

	comment := builder
		           newClassNamed: #Comment
		           comment: 'A fortran comment'.


	subprogram := builder
		              newClassNamed: #Subprogram
		              comment:
		              'I represent a fortran subprogram: procedure or block data'.

	mainprogram := builder
		               newClassNamed: #ProgramMain
		               comment:
		               'The PROGRAM statement identifies the program unit as a main program. program. For the loader, the main program is always named MAIN. The PROGRAM statement serves only the person who reads the program'.


	procedure := builder
		             newClassNamed: #Procedure
		             comment:
		             'I represent a fortran subroutine or a function'.

	function := builder
		            newClassNamed: #Function
		            comment: 'I represent a Fortran Function'.

	subroutine := builder
		              newClassNamed: #Subroutine
		              comment:
		              'The SUBROUTINE statement identifies a subprogram, a named program unit as a subroutine, and specifies arguments for it'.

	blockData := builder
		             newClassNamed: #BlockData
		             comment:
		             'The BLOCK DATA statement identifies a subprogram that initializes variables and arrays in labeled common blocks.'.

	self defineStatements.
	self defineData.
	
	"From FAST"
	"entity := self remoteEntity: #Entity withPrefix: #FAST.
	expression := self remoteEntity: #Expression withPrefix: #FAST. 
	statement := self remoteEntity: #Statement withPrefix: #FAST.
	
	literal := self remoteEntity: #Literal withPrefix: #FAST.
	characterLiteral := self remoteEntity: #CharacterLiteral withPrefix: #FAST.
	nullPointerLiteral := self remoteEntity: #NullPointerLiteral withPrefix: #FAST.
	stringLiteral := self remoteEntity: #StringLiteral withPrefix: #FAST.
	
	variableExpression := self remoteEntity: #VariableExpression withPrefix: #FAST.
	variableEntity := self remoteEntity: #VariableEntity withPrefix: #FAST. 
	
	namedBehaviouralEntity := self remoteEntity: #NamedBehaviouralEntity withPrefix: #FAST.
	scopableEntity := self remoteEntity: #ScopableEntity withPrefix: #FAST.
	namedEntity := self remoteEntity: #NamedEntity withPrefix: #FAST. 
	
	statementBlock := self remoteEntity: #StatementBlock withPrefix: #FAST.
	expressionStatement := self remoteEntity: #ExpressionStatement withPrefix: #FAST.
	returnStatement  := self remoteEntity: #ReturnStatement withPrefix: #FAST.
	
	fastTParameter := self remoteTrait: #TParameter withPrefix: #FAST. 
	fastTWithParameters := self remoteTrait: #TWithParameters withPrefix: #FAST."
]

{ #category : #definition }
FASTFortranGenerator >> defineData [

	variableDeclaration := builder newClassNamed: #VariablesDeclaration
		comment: 'I represent a declaration statement for one or many variables'.

	"EXPRESSIONS"

	arithmeticExpression := builder
		                        newClassNamed: #ArithmeticExpression
		                        comment: self commentForExpression.
	characterExpression := builder
		                       newClassNamed: #CharacterExpression
		                       comment: self commentForExpression.
	logicalExpression := builder
		                     newClassNamed: #LogicalExpression
		                     comment: self commentForExpression.

	loopControlExpression := builder
		                         newClassNamed: #LoopControlExpression
		                         comment: self commentForExpression.


	"OTHER DATA TYPES"

	"Variable is defined by default  FAST"
	"variable := builder
		                   newClassNamed: #Variable
		                   comment: 'I represent Fortran Variable'."

	array := builder
		         newClassNamed: #Array
		         comment: 'I represent Fortran Array'.

	arrayDimensionDeclarator := builder
		                            newClassNamed: #ArrayDimensionDeclarator
		                            comment:
		                            'I represent Fortran Array dimension declaration'.

	substring := builder
		             newClassNamed: #Substring
		             comment: 'I represent Fortran Substring'.

	pointer := builder
		           newClassNamed: #Pointer
		           comment: 'I represent Fortran Pointer statement'.

	record := builder
		          newClassNamed: #Record
		          comment: 'I represent Fortran Record statement'.

	recordField := builder
		               newClassNamed: #RecordField
		               comment: 'I represent Fortran RecordField'.

	structure := builder
		             newClassNamed: #Structure
		             comment: 'I represent Fortran Structure statement'.


	"CONSTANTS"

	"A literal constant is a datum whose value cannot change throughout the program unit. The form of the string representing a constant determines the value and data type of the constant. (For a named constant, defined by a PARAMETER statement, the name defines the data type"
	"FAST defines constants as literals, so we reuse it and add missing subclasses"

	"constant := builder
		                   newClassNamed: #Literal
		                   comment: 'I represent Fortran Literal (Constant) statement'."

	arithmeticConstant := builder
		                      newClassNamed: #ArithmeticLiteral
		                      comment:
		                      'I represent Fortran Arithmetic Literal (Constant) statement'.

	"characterLiteral := builder
		                            newClassNamed: #CharacterLiteral
		                            comment:
		                            'I represent Fortran Character Literal (Constant) statement'."
		
	asterisk  := builder
		                            newClassNamed: #Asterisk
		                            comment:
		                            'I represent an Asterisk Character Literal (Constant) that is often used as a format identifier'.

	ampersand  := builder
		                            newClassNamed: #Ampersand
		                            comment:
		                            'I represent an Ampersand Character Literal (Constant) that is often used in parameters and format identifiers'.

	"booleanLiteral := builder
		                          newClassNamed: #BooleanLiteral
		                          comment:
		                          'I represent Fortran Logical Literal (Constant) statement'."

	complexConstant := builder
		                   newClassNamed: #ComplexLiteral
		                   comment:
		                   'I represent Fortran Arithmetic Complex Literal (Constant) statement'.

	doubleComplexConstant := builder
		                   newClassNamed: #DoubleComplexLiteral
		                   comment:
		                   'I represent Fortran Arithmetic Double Complex Literal (Constant) statement'.

	doublePrecisionConstant := builder
		                   newClassNamed: #DoublePrecisionLiteral
		                   comment:
		                   'I represent Fortran Arithmetic Double Precision Literal (Constant) statement'.

	integerConstant := builder
		                   newClassNamed: #IntegerLiteral
		                   comment:
		                   'I represent Fortran Arithmetic Integer Literal (Constant) statement'.	
			
	realConstant := builder
		                   newClassNamed: #RealLiteral
		                   comment:
		                   'I represent Fortran Arithmetic Real Literal (Constant) statement'.
	
	"TYPES"
 
	type := builder
		                        newClassNamed: #Type
		                        comment:
		                        'I represent Fortran Type statement'.

	byteType := builder
		                        newClassNamed: #ByteType
		                        comment:
			                        'I represent Fortran Byte statement. The BYTE data type provides a data type that uses only one byte of storage. It is a logical data type, and has the synonym,
LOGICAL*1. A variable of type BYTE can hold any of the following: 1)one character, 2)an integer between -128 and 127, 3)the logical values, .TRUE. or .FALSE. If it is interpreted as a logical value, a value of 0 represents .FALSE., and any other value is interpreted as .TRUE.
f77 allows the BYTE type as an array index, just as it allows the REAL type, but it does not allow BYTE as a DO loop index (where it allows only INTEGER, REAL, and DOUBLE PRECISION). Wherever the compiler expects INTEGER explicitly, it will not allow BYTE.'.

	characterType := builder
		                             newClassNamed: #CharacterType
		                             comment:
		                             'I represent Fortran Character statement. The character data type, CHARACTER, which has the synonym, CHARACTER*1, holds one character. The character is enclosed in apostrophes ('') or quotes (""). @ Allowing quotes ("") is nonstandard; if you compile with the -xl option, quotes mean something else, and you must use apostrophes to enclose a string. The data of type CHARACTER is always unsigned. A CHARACTER item occupies 1 byte (8 bits) of storage and is aligned on 1-byte boundaries.'.

	complexType := builder
		                           newClassNamed: #ComplexType
		                           comment:
		                           'I represent Fortran Complex statement. A complex datum is an approximation of a complex number. The complex data type, COMPLEX, which defaults to a synonym for COMPLEX*8, is a pair of REAL*4 values that represent a complex number. The first element represents the real part and the second represents the imaginary part.The default size for a COMPLEX item (no size specified) is 8 bytes. The default alignment is on 4-byte boundaries. However, these defaults can be changed by compiling with certain special options'.

	doubleComplexType := builder
		                                 newClassNamed:
		                                 #DoubleComplexType
		                                 comment:
		                                 'I represent Fortran Double Complex statement. The complex data type, DOUBLE COMPLEX, which usually has the synonym, COMPLEX*16, is a pair of DOUBLE PRECISION (REAL*8)values that represents a complex number. The first element represents the real part; the second represents the imaginary part.The default size for DOUBLE COMPLEX with no size specified is 16.'.

	doublePrecisionType := builder
		                                   newClassNamed:
		                                   #DoublePrecisionType
		                                   comment:
		                                   'I represent Fortran Double Precision statement. A double-precision datum is an approximation of a real number. The double-precision data type, DOUBLE PRECISION, which has the synonym, REAL*8, holds one double-precision datum.The default size for DOUBLE PRECISION with no size specified is 8 bytes.A DOUBLE PRECISION element has a sign bit, an 11-bit exponent, and a 52-bit fraction. These DOUBLE PRECISION elements in f77 conform to the IEEE standard for double-precision floating-point data.'.

	integerType := builder
		                           newClassNamed: #IntegerType
		                           comment:
			                           'I represent Fortran Integer statement. The integer data type, INTEGER, holds a signed integer.
The default size for INTEGER with no size specified is 4, and is aligned on 4-byte boundaries. However, these defaults can be
changed by compiling with certain special options.'.

	logicalType := builder
		                           newClassNamed: #LogicalType
		                           comment:
		                           'I represent Fortran Logical statement. The logical data type, LOGICAL, holds a logical value .TRUE. or .FALSE. The value 0 represents .FALSE.; any other value represents .TRUE.The usual default size for an LOGICAL item with no size specified is 4, and is aligned on 4-byte boundaries. However, these defaults can be changed by compiling with certain special options.'.

	realType := builder
		                        newClassNamed: #RealType
		                        comment:
		                        'I represent Fortran Real statement. A real datum is an approximation of a real number. The real data type, REAL, which usually has the synonym, REAL*4, holds one real datum.The usual default size for a REAL item with no size specified is 4 bytes, and is aligned on 4-byte boundaries. However, these defaults can be changed by compiling with certain special options.A REAL element has a sign bit, an 8-bit exponent, and a 23-bit fraction. These REAL elements in f77 conform to the IEEE standard.'
	

]

{ #category : #definition }
FASTFortranGenerator >> defineHierarchy [

	super defineHierarchy.

	programUnit --|> entity.
	subprogram --|> programUnit.
	mainprogram --|> programUnit.
	procedure --|> subprogram.
	blockData --|> subprogram.
	function --|> procedure.
	subroutine --|> procedure.

	"other entities"
	comment --|> scopableEntity.
	variableDeclaration --|> scopableEntity.

	"STATEMENTS"
	acceptStatement --|> statement.
	assignStatement --|> statement.
	assignmentStatement --|> statement.
	automaticStatement --|> statement.
	backspaceStatement --|> statement.
	callStatement --|> statement.
	closeStatement --|> statement.
	commonStatement --|> statement.
	continueStatement --|> statement.
	dataStatement --|> statement.
	decodeStatement --|> statement.
	encodeStatement --|> statement.
	dimensionStatement --|> statement.
	doStatement --|> statement.
	doWhileStatement --|> statement.
	elseStatement --|> statement.
	elseIfStatement --|> statement.
	endStatement --|> statement.
	endDoStatement --|> statement.
	endFileStatement --|> statement.
	endIfStatement --|> statement.
	endMapStatement --|> statement.
	endStructureStatement --|> statement.
	endUnionStatement --|> statement.
	entryStatement --|> statement.
	equivalenceStatement --|> statement.
	externalStatement --|> statement.
	formatStatement --|> statement.
	functionStatement --|> statement.
	goToStatement --|> statement.
	goToAssignedStatement --|> statement.
	goToComputed --|> statement.
	goToUnconditional --|> statement.
	ifArithmeticStatement --|> statement.
	ifBlockStatement --|> statement.
	ifLogicalStatement --|> statement.
	implicitStatement --|> statement.
	includeStatement --|> statement.
	inquireStatement --|> statement.
	intrinsicStatement --|> statement.
	mapStatement --|> statement.
	nameListStatement --|> statement.
	openStatement --|> statement.
	optionsStatement --|> statement.
	parameterStatement --|> statement.
	pauseStatement --|> statement.
	pragmaStatement --|> statement.
	printStatement --|> statement.
	readStatement --|> statement.
	rewindStatement --|> statement.
	saveStatement --|> statement.
	staticStatement --|> statement.
	stopStatement --|> statement.
	unionStatement --|> statement.
	virtualStatement --|> statement.
	volatileStatement --|> statement.
	writeStatement --|> statement.
	"STATEMENT OUT OF STANDARD"
	exitStatement --|> statement.
	
	"DATA"
	expression --|> scopableEntity.
	arithmeticExpression --|> expression.
	characterExpression --|> expression.
	logicalExpression --|> expression.
	loopControlExpression --|> expression.
	
	array --|> expression.
	arrayDimensionDeclarator --|> array.
	substring --|> expression.
	pointer --|> expression.
	record --|> expression.
	recordField --|> record.
	structure --|> expression.
	
	arithmeticConstant --|> literal.
	complexConstant --|> arithmeticConstant.
	doubleComplexConstant --|> arithmeticConstant.
	doublePrecisionConstant --|> arithmeticConstant.
	integerConstant --|> arithmeticConstant.
	realConstant  --|> arithmeticConstant.
	asterisk --|> characterLiteral.
	ampersand --|> characterLiteral. 
	
	type --|> scopableEntity.
	byteType --|> type.
	characterType --|> type.
	complexType --|> type.
	doubleComplexType --|> type.
	doublePrecisionType --|> type.
	integerType --|> type.
	logicalType --|> type.
	realType --|> type.
	
	"TRAITS"
	subroutine --|> tWithParameters.
	"TODO: an asterisk, or an ampersand can be a subroutine parameter as well"
	asterisk --|> tParameter. 
	array --|> tParameter.
	record --|> tParameter.
	procedure --|> tParameter.
	"TODO: check if a function and a subroutine has the same set of parameters and join the definiton to procedure --|> tWithParameters in this case."
	function --|> tWithParameters.
	  
	
	functionStatement --|> tWithArguments. 
	callStatement --|> tWithArguments.
	callStatement --|> tArgument. "not sure if this is right"
	expression --|> tArgument. 
	subroutine --|> tArgument.
	"TODO: also as an argument may serve 
		- an intrinsic function permitted to be passed as an argument
		- an external function name
		- an alternate return specifier, * or &,followed by a statement number."
	
	printStatement --|> tWithFormatIdentifier.
	formatStatement --|> tFormatIdentifier.
	asterisk --|> tFormatIdentifier.
	
	writeStatement --|> tWithIOList.
	printStatement --|> tWithIOList.
	expression --|> tIOListMember.
	callStatement --|> tIOListMember. 
	
	assignmentStatement --|> tWithAssigneable.
	expression --|> tAssigneable.
	callStatement --|> tAssigneable. 
	
	logicalExpression --|> tBinaryExpression.
	arithmeticExpression --|> tBinaryExpression.  
	
]

{ #category : #definition }
FASTFortranGenerator >> defineProperties [

	super defineProperties.

	(programUnit property: #name type: #String) comment:
		'Symbolic name of a program unit'.

	(statement property: #label type: #String) comment:
		'Determines the statement label which consists of 1 to 5 digits, with at least one nonzero'.


	"Defined in FAST"
	"(literal property: #value type: #String) comment:
		'Determines the constant value'."
	(arithmeticConstant property: #isTyped type: #Boolean) comment:
		'Determines if the constant typed or typeless'.
	(arithmeticConstant property: #isSigned type: #Boolean) comment:
		'Determines if the constant signed or not'.
	(arithmeticConstant property: #sign type: #Number) comment:
		'Determines the arithmetic constant sign'.

	"variables"
	(variableExpression property: #type type: #String) comment:
		'Determines the variable type'.
	(variableExpression property: #value type: #String) comment:
		'Determines the variable value'.
	(variableExpression property: #defined type: #Boolean) comment:
		'Determines if the variableis defined (stores a value)'.


	(array property: #name type: #String) comment:
		'Determines the array name'.

	(externalStatement property: #name type: #String) comment:
		'Name of external procedure, dummy procedure, or block data routine'.

	(callStatement property: #name type: #String) comment:
		'Name of a callling entity'.

	(functionStatement property: #name type: #String) comment:
		'Name of a function statement'.
	
	(comment property: #content type: #String) comment:
		'Determines a content of a comment'.		
	
	(returnStatement property: #alternateReturnLable type: #String) comment:
		'Optional. Expression of type INTEGER or REAL'.

	(stopStatement property: #displayArgument type: #String) comment:
		'Optional. Displayed when the program stops. String of no more that 5 digits or a character constant'.

	(writeStatement property: #format type: #String) comment:
		'Format identifier. '.	
		
	(loopControlExpression property: #init type: #String) comment:
		'Loop control initial value'.
		
	(loopControlExpression property: #increment type: #String) comment:
		'Loop control increment value'.
		
	(loopControlExpression property: #limit type: #String) comment:
		'Loop control limit value'.
		
	"TARITS"
	(tBinaryExpression property: #operator type: #String) comment:
		'Operator of a binary expression'.
]

{ #category : #definition }
FASTFortranGenerator >> defineRelations [

	super defineRelations.

	((programUnit property: #statements) comment:
		 'Statements of the program unit ')
	<>-* ((scopableEntity property: #parentProgramUnit) comment:
			 'Parent program unit').

	((logicalExpression property: #left) comment:
		 'left part of the expression')
	<>- ((tAssigneable property: #parentExpression) comment:
			 'Parent expression (if possible)').

	((logicalExpression property: #right) comment:
		 'left part of the expression')
	<>- ((tAssigneable property: #parentExpression) comment:
			 'Parent expression (if possible)').

	((arithmeticExpression property: #left) comment:
		 'left part of the expression')
	<>- ((expression property: #parentExpression) comment:
			 'Parent expression (if possible)').

	((arithmeticExpression property: #right) comment:
		 'left part of the expression')
	<>- ((expression property: #parentExpression) comment:
			 'Parent expression (if possible)').

	((doStatement property: #loopControl) comment: 'loop control')
	<>-
	((loopControlExpression property: #parentLoop) comment: 'Parent loop').
	
	((doStatement property: #statements) comment:
		 'Statements of the do body ')
	<>-* ((scopableEntity property: #parentDoStatement) comment:
			 'Parent do statement').
	
	((ifBlockStatement property: #thenStatements) comment:
		 'Statements of the then branch ')
	<>-* ((scopableEntity property: #parentIfBlock) comment:
			 'Parent if block').

	((ifBlockStatement property: #elseStatements) comment:
		 'Statements of the then branch ')
	<>-* ((statement property: #parentIfBlock) comment:
			 'Parent if block').
	
	((ifBlockStatement property: #condition) comment:
		 'Condition')
	<>- ((expression property: #parentIfBlock) comment:
			 'Parent if block').
			
	((ifLogicalStatement property: #statement) comment:
		 'Statement of the logical if')
	<>- ((statement property: #parentIfBlock) comment:
			 'Parent if block').
	
	((ifLogicalStatement property: #condition) comment:
		 'Condition')
	<>- ((expression property: #parentIfBlock) comment:
			 'Parent if block').		
	
	((variableDeclaration property: #variables) comment: 'variables')
	<>-*
	((variableExpression property: #parentDeclaration) comment: 'Parent declaration').


	"TRAITS"
	((tWithFormatIdentifier property: #format) comment:
		 'format identifier')
	<>- ((tFormatIdentifier property: #formatParentStatement) comment:
			 'The owner of the format identifier').
	((tWithIOList property: #iolist) comment: 'iolist')
	<>-* ((tIOListMember property: #iolistParentStatement) comment:
			 'The owner of the iolist').

	((tWithAssigneable property: #variable) comment: 'My variable')
	<>- ((tAssigneable property: #variableAssignementOwner) comment:
			 'The owner of the modifier').
			
	((assignmentStatement property: #expression) comment: 'Expression thats being assigned upon declaration to the var')
		<>- ((tAssigneable property: #assignementExpressionOwner) comment: 'The AssignementExpression owner (if possible)').
		
	((functionStatement property: #expression) comment: 'Expression thats being assigned upon declaration to the var')
		<>- ((tAssigneable property: #assignementExpressionOwner) comment: 'The AssignementExpression owner (if possible)').
]

{ #category : #definition }
FASTFortranGenerator >> defineStatements [

	"A statement consists of zero or more key words, symbolic names, literal constants, statement labels, operators, and special characters."

	acceptStatement := builder
		                   newClassNamed: #AcceptStatement
		                   comment: 'I represent Fortran accept statement'.

	assignStatement := builder
		                   newClassNamed: #AssignStatement
		                   comment: 'I represent Fortran ASSIGN statement'.

	assignmentStatement := builder
		                       newClassNamed: #AssignmentStatement
		                       comment:
		                       'I represent Fortran assignment made without ASSIGN statement'.

	automaticStatement := builder
		                      newClassNamed: #AutomaticStatement
		                      comment:
		                      'I represent Fortran Automatic statement'.
	backspaceStatement := builder
		                      newClassNamed: #BackspaceStatement
		                      comment:
		                      'I represent Fortran Backspace statement'.
	callStatement := builder
		                 newClassNamed: #CallStatement
		                 comment: 'I represent Fortran Call statement'.
	closeStatement := builder
		                  newClassNamed: #CloseStatement
		                  comment: 'I represent Fortran Close statement'.
	commonStatement := builder
		                   newClassNamed: #CommonStatement
		                   comment: 'I represent Fortran Common statement'.
	continueStatement := builder
		                     newClassNamed: #ContinueStatement
		                     comment:
		                     'I represent Fortran Continue statement'.
	dataStatement := builder
		                 newClassNamed: #DataStatement
		                 comment: 'I represent FortranData statement'.
	decodeStatement := builder
		                   newClassNamed: #DecodeStatement
		                   comment: 'I represent Fortran Decode statement'.
	encodeStatement := builder
		                   newClassNamed: #EncodeStatement
		                   comment: 'I represent Fortran Encode statement'.
	dimensionStatement := builder
		                      newClassNamed: #DimensionStatement
		                      comment:
		                      'I represent FortranDimension statement'.
	doStatement := builder
		               newClassNamed: #DoStatement
		               comment: 'I represent Fortran Do statement'.
	doWhileStatement := builder
		                    newClassNamed: #DoWhileStatement
		                    comment:
		                    'I represent Fortran Do While statement'.
	elseStatement := builder
		                 newClassNamed: #ElseStatement
		                 comment: 'I represent Fortran Else statement'.
	elseIfStatement := builder
		                   newClassNamed: #ElseIfStatement
		                   comment: 'I represent Fortran Else If statement'.
	endStatement := builder
		                newClassNamed: #EndStatement
		                comment: 'I represent Fortran End statement'.
	endDoStatement := builder
		                  newClassNamed: #EndDoStatement
		                  comment:
		                  'I represent Fortran End Do or ENDDO statement'.
	endFileStatement := builder
		                    newClassNamed: #EndFileStatement
		                    comment:
		                    'I represent Fortran End File statement'.
	endIfStatement := builder
		                  newClassNamed: #EndIfStatement
		                  comment: 'I represent Fortran End If statement'.
	endMapStatement := builder
		                   newClassNamed: #EndMapStatement
		                   comment: 'I represent Fortran End Map statement'.
	endStructureStatement := builder
		                         newClassNamed: #EndStructureStatement
		                         comment:
		                         'I represent Fortran End Structure statement'.
	endUnionStatement := builder
		                     newClassNamed: #EndUnionStatement
		                     comment:
		                     'I represent Fortran End Union statement'.
	entryStatement := builder
		                  newClassNamed: #EntryStatement
		                  comment: 'I represent Fortran Entry statement'.
	equivalenceStatement := builder
		                        newClassNamed: #EquivalenceStatement
		                        comment:
		                        'I represent Fortran Equivalence statement'.
	externalStatement := builder
		                     newClassNamed: #ExternalStatement
		                     comment:
		                     'I represent Fortran External statement'.
	formatStatement := builder
		                   newClassNamed: #FormatStatement
		                   comment: 'I represent Fortran Format statement'.

	functionStatement := builder
		                     newClassNamed: #FunctionStatement
		                     comment:
		                     'I represent a function statement - a function-like declaration, made in a single statement'.

	goToStatement := builder
		                 newClassNamed: #GoToStatement
		                 comment: 'I represent Fortran Go To statement'.

	goToAssignedStatement := builder
		                         newClassNamed: #GoToAssignedStatement
		                         comment:
		                         'I represent Fortran Go To( Assigned) statement'.
	goToComputed := builder
		                newClassNamed: #GoToComputedStatement
		                comment:
		                'I represent Fortran Go To (Computed) statement'.
	goToUnconditional := builder
		                     newClassNamed: #GoToUnconditionalStatement
		                     comment:
		                     'I represent Fortran Go To (Unconditional) statement'.
	ifArithmeticStatement := builder
		                         newClassNamed: #IfArithmeticStatement
		                         comment:
		                         'I represent Fortran If (Arithmetic) statement'.
	ifBlockStatement := builder
		                    newClassNamed: #IfBlockStatement
		                    comment:
		                    'I represent Fortran If (BLock) statement'.
	ifLogicalStatement := builder
		                      newClassNamed: #IfLogicalStatement
		                      comment:
		                      'The logical IF statement executes one single statement, or does not execute it, depending on the value of a logical expression.'.
	implicitStatement := builder
		                     newClassNamed: #ImplicitStatement
		                     comment:
		                     'I represent Fortran Implicit statement'.
	includeStatement := builder
		                    newClassNamed: #IncludeStatement
		                    comment: 'I represent Fortran Include statement'.
	inquireStatement := builder
		                    newClassNamed: #InquireStatement
		                    comment: 'I represent Fortran Inquire statement'.
	intrinsicStatement := builder
		                      newClassNamed: #IntrinsicStatement
		                      comment:
		                      'I represent Fortran Intrinsic statement'.
	mapStatement := builder
		                newClassNamed: #MapStatement
		                comment: 'I represent Fortran Map statement'.
	nameListStatement := builder
		                     newClassNamed: #NameListStatement
		                     comment:
		                     'I represent Fortran NameList statement'.
	openStatement := builder
		                 newClassNamed: #OpenStatement
		                 comment: 'I represent Fortran Open statement'.
	optionsStatement := builder
		                    newClassNamed: #OptionsStatement
		                    comment: 'I represent Fortran Options statement'.
	parameterStatement := builder
		                      newClassNamed: #ParameterStatement
		                      comment:
		                      'I represent Fortran Parameter statement'.
	pauseStatement := builder
		                  newClassNamed: #PauseStatement
		                  comment: 'I represent Fortran Pause statement'.
	pragmaStatement := builder
		                   newClassNamed: #PragmaStatement
		                   comment: 'I represent Fortran Pragma statement'.
	printStatement := builder
		                  newClassNamed: #PrintStatement
		                  comment: 'I represent Fortran Print statement'.

	readStatement := builder
		                 newClassNamed: #ReadStatement
		                 comment: 'I represent Fortran Read statement'.
	"defined globally"
	"statementReturn := builder
		                          newClassNamed: #StatementReturn
		                          comment:
		                          'I represent Fortran Return statement'."
	rewindStatement := builder
		                   newClassNamed: #RewindStatement
		                   comment: 'I represent Fortran Rewind statement'.
	saveStatement := builder
		                 newClassNamed: #SaveStatement
		                 comment: 'I represent Fortran Save statement'.

	staticStatement := builder
		                   newClassNamed: #StaticStatement
		                   comment: 'I represent Fortran Static statement'.
	stopStatement := builder
		                 newClassNamed: #StopStatement
		                 comment: 'I represent Fortran Stop statement'.
	unionStatement := builder
		                  newClassNamed: #UnionStatement
		                  comment: 'I represent Fortran Union statement'.
	virtualStatement := builder
		                    newClassNamed: #VirtualStatement
		                    comment: 'I represent Fortran Virtual statement'.
	volatileStatement := builder
		                     newClassNamed: #volatileStatement
		                     comment:
		                     'I represent Fortran Volatile statement'.
	writeStatement := builder
		                  newClassNamed: #WriteStatement
		                  comment: 'I represent Fortran Write statement'.

	"NOT IN THE 77 STANDARD"
	exitStatement := builder
		                 newClassNamed: #ExitStatement
		                 comment: 'I represent Fortran90 Exit statement'
]

{ #category : #definition }
FASTFortranGenerator >> defineTraits [

	super defineTraits.
	
	tWithFormatIdentifier := builder newTraitNamed: #TWithFormatIdentifier comment: 'I represent a statement with format identifier (print, write, ...)'.
	tFormatIdentifier := builder newTraitNamed: #TFormatIdentifier comment: 'I represent a format identifier'.

	tWithIOList := builder newTraitNamed: #TWithIOList comment: 'I represent a statement with iolist (print, write, ...)'.

	tIOListMember := builder newTraitNamed: #TIOListMember comment: 'I represent an item that can be encountered in the iolist of certain statments (print)'.
	
	tAssigneable := builder newTraitNamed: #TAssigneable comment: 'assignable entity'. 
	
	tWithAssigneable := builder newTraitNamed: #TWithAssigneable comment: 'I have an assigneable'.
	
	tBinaryExpression  := builder newTraitNamed: #TBinaryExpression comment: 'I represent a binary expression'.
	
]
