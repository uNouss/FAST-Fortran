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
		'endFileStatement',
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
		'loopControlExpression',
		'arrayDimensionDeclarator',
		'substring',
		'pointer',
		'record',
		'structure',
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
		'ampersand',
		'functionStatement',
		'returnStatement',
		'declarationStatement',
		'variable',
		'variableArray',
		'variableScalar',
		'binaryExpression',
		'unaryExpression',
		'programFile',
		'functionCall',
		'tFortranLabelledStatement',
		'tFortranBinaryExpression',
		'tFortranUnaryExpression',
		'booleanConstant',
		'characterConstant',
		'statementBlock',
		'assignmentExpression'
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

	self defineFamixClasses. 
	self defineStatements.
	self defineData
]

{ #category : #definition }
FASTFortranGenerator >> defineData [
	" DelarationStatement is used instead
	variableDeclaration := builder
		                       newClassNamed: #VariablesDeclaration
		                       comment:
		                       'I represent a declaration statement for one or many variables'."

	declarationStatement := builder
		                        newClassNamed: #DeclarationStatement
		                        comment:
		                        'I represent a declaration statement for one or many variables'.

	"EXPRESSIONS"
	
	assignmentExpression := builder
		                       newClassNamed: #AssignmentExpression
		                       comment:
		                       'I represent an assignment expression as a part of assignment statement'.

	variable := builder
		            newClassNamed: #Variable
		            comment:
		            'an abstract Fortran Variable, could be an array or a scalar'.

	variableArray := builder
		                 newClassNamed: #ArrayVariable
		                 comment:
		                 'an array Fortran Variable, used in declarations'.

	variableScalar := builder
		                  newClassNamed: #ScalarVariable
		                  comment:
		                  'a scalar Fortran Variable, used in declarations'.

	binaryExpression := builder
		                    newClassNamed: #BinaryExpression
		                    comment:
		                    'a Fortran Binary Expression (arithmetic, logical)'.

	unaryExpression := builder
		                   newClassNamed: #UnaryExpression
		                   comment:
		                   'a Fortran Unary Expression (arithmetic, logical, character)'.

	"
	arithmeticExpression := builder
		                        newClassNamed: #ArithmeticExpression
		                        comment: 'a Fortran Arithmetic Expression'.
	characterExpression := builder
		                       newClassNamed: #CharacterExpression
		                       comment: 'a Fortran Character Expression'.
	logicalExpression := builder
		                     newClassNamed: #LogicalExpression
		                     comment: 'a Fortran Logical Expression'."

	loopControlExpression := builder
		                         newClassNamed: #LoopControlExpression
		                         comment:
		                         'a Fortran Loop Control Expression'.


	"OTHER DATA TYPES"
	arrayDimensionDeclarator := builder
		                            newClassNamed: #ArrayDimensionDeclarator
		                            comment:
		                            'I represent Fortran Array dimension declaration'.

	substring := builder
		             newClassNamed: #Substring
		             comment: 'I represent Fortran Substring'.

	"CONSTANTS"

	asterisk := builder
		            newClassNamed: #Asterisk
		            comment:
		            'I represent an Asterisk Character Literal (Constant) that is often used as a format identifier'.

	ampersand := builder
		             newClassNamed: #Ampersand
		             comment:
		             'I represent an Ampersand Character Literal (Constant) that is often used in parameters and format identifiers'.

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

	booleanConstant := builder
		                   newClassNamed: #BooleanLiteral
		                   comment:
		                   'I represent Fortran Boolean Literal (Constant) statement'.

	characterConstant := builder
		                     newClassNamed: #CharacterLiteral
		                     comment:
		                     'I represent Fortran Character Literal (Constant) statement'.


	"TYPES"

	type := builder
		        newClassNamed: #Type
		        comment: 'I represent Fortran Type statement'.

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
		                     newClassNamed: #DoubleComplexType
		                     comment:
		                     'I represent Fortran Double Complex statement. The complex data type, DOUBLE COMPLEX, which usually has the synonym, COMPLEX*16, is a pair of DOUBLE PRECISION (REAL*8)values that represents a complex number. The first element represents the real part; the second represents the imaginary part.The default size for DOUBLE COMPLEX with no size specified is 16.'.

	doublePrecisionType := builder
		                       newClassNamed: #DoublePrecisionType
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
FASTFortranGenerator >> defineFamixClasses [
	"FAMIX-level classes (might be removed later)"

	programFile := builder
		               newClassNamed: #ProgramFile
		               comment:
		               'An entity that can contain fortran program units and comments'.

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
	
	functionCall := builder
		                     newClassNamed: #FunctionCall
		                     comment:
		                     'I represent a call to a function (or function statement)'.

	subroutine := builder
		              newClassNamed: #Subroutine
		              comment:
		              'The SUBROUTINE statement identifies a subprogram, a named program unit as a subroutine, and specifies arguments for it'.

	blockData := builder
		             newClassNamed: #BlockData
		             comment:
		             'The BLOCK DATA statement identifies a subprogram that initializes variables and arrays in labeled common blocks.'.
		
	statementBlock := builder
		             newClassNamed: #StatementBlock
		             comment:
		             'Contains the block of Fortran statements'.
]

{ #category : #definition }
FASTFortranGenerator >> defineHierarchy [

	super defineHierarchy.

	programUnit --|> tEntity.
	programUnit --|> tBehaviouralEntity.
	programUnit --|> tNamedEntity.
	subprogram --|> programUnit.
	mainprogram --|> programUnit.
	procedure --|> subprogram.
	blockData --|> subprogram.
	function --|> procedure.
	subroutine --|> procedure.

	"other entities"
	comment --|> tEntity.
	comment --|> tComment. 
	tFortranLabelledStatement --|> tStatement.
	declarationStatement --|> tFortranLabelledStatement.
	statementBlock --|> tStatementBlock. 
	statementBlock --|> tWithComments. 

	"FORTRAN STATEMENTS"
	assignmentStatement --|> tFortranLabelledStatement.
	automaticStatement --|> tFortranLabelledStatement.
	backspaceStatement --|> tFortranLabelledStatement.
	callStatement --|> tFortranLabelledStatement.
	closeStatement --|> tFortranLabelledStatement.
	commonStatement --|> tFortranLabelledStatement.
	continueStatement --|> tFortranLabelledStatement.
	dataStatement --|> tFortranLabelledStatement.
	decodeStatement --|> tFortranLabelledStatement.
	encodeStatement --|> tFortranLabelledStatement.
	dimensionStatement --|> tFortranLabelledStatement.
	doStatement --|> tFortranLabelledStatement.
	doWhileStatement --|> tFortranLabelledStatement.
	elseStatement --|> tFortranLabelledStatement.
	endFileStatement --|> tFortranLabelledStatement.
	entryStatement --|> tFortranLabelledStatement.
	equivalenceStatement --|> tFortranLabelledStatement.
	externalStatement --|> tFortranLabelledStatement.
	formatStatement --|> tFortranLabelledStatement.
	functionStatement --|> tFortranLabelledStatement.
	goToStatement --|> tFortranLabelledStatement.
	goToAssignedStatement --|> tFortranLabelledStatement.
	goToComputed --|> tFortranLabelledStatement.
	goToUnconditional --|> tFortranLabelledStatement.
	ifArithmeticStatement --|> tFortranLabelledStatement.
	ifBlockStatement --|> tFortranLabelledStatement.
	ifLogicalStatement --|> tFortranLabelledStatement.
	implicitStatement --|> tFortranLabelledStatement.
	includeStatement --|> tFortranLabelledStatement.
	inquireStatement --|> tFortranLabelledStatement.
	intrinsicStatement --|> tFortranLabelledStatement.
	mapStatement --|> tFortranLabelledStatement.
	nameListStatement --|> tFortranLabelledStatement.
	openStatement --|> tFortranLabelledStatement.
	optionsStatement --|> tFortranLabelledStatement.
	parameterStatement --|> tFortranLabelledStatement.
	pauseStatement --|> tFortranLabelledStatement.
	pragmaStatement --|> tFortranLabelledStatement.
	printStatement --|> tFortranLabelledStatement.
	readStatement --|> tFortranLabelledStatement.
	returnStatement --|> tFortranLabelledStatement.
	rewindStatement --|> tFortranLabelledStatement.
	saveStatement --|> tFortranLabelledStatement.
	staticStatement --|> tFortranLabelledStatement.
	stopStatement --|> tFortranLabelledStatement.
	unionStatement --|> tFortranLabelledStatement.
	virtualStatement --|> tFortranLabelledStatement.
	volatileStatement --|> tFortranLabelledStatement.
	writeStatement --|> tFortranLabelledStatement.
	"STATEMENT OUT OF STANDARD"
	exitStatement --|> tFortranLabelledStatement.


	"DATA"
	assignmentExpression --|> tExpression.
	functionCall --|> tExpression.
	variable --|> tExpression.
	variable --|> tVariableEntity.
	variableScalar --|> variable.
	variableArray --|> variable.
	loopControlExpression --|> tExpression.
	substring --|> tExpression.
	
	binaryExpression --|> tBinaryExpression.
	unaryExpression --|> tUnaryExpression.

	complexConstant --|> tNumericalLiteral.
	doubleComplexConstant --|> tNumericalLiteral.
	doublePrecisionConstant --|> tNumericalLiteral.
	integerConstant --|> tNumericalLiteral.
	realConstant --|> tNumericalLiteral.
	asterisk --|> tNumericalLiteral.
	ampersand --|> tCharacterLiteral.
	characterConstant --|> tCharacterLiteral.
	booleanConstant --|> tBooleanLiteral.

	byteType --|> type.
	characterType --|> type.
	complexType --|> type.
	doubleComplexType --|> type.
	doublePrecisionType --|> type.
	integerType --|> type.
	logicalType --|> type.
	realType --|> type.

	"TRAITS"
	procedure --|> tWithParameters.
	functionCall --|> tWithArguments.
	functionStatement --|> tWithArguments.
	callStatement --|> tWithArguments.
	printStatement --|> tWithArguments.
	writeStatement --|> tWithArguments.

	"TODO: also as an argument may serve 
		- an intrinsic function permitted to be passed as an argument
		- an external function name
		- an alternate return specifier, * or &,followed by a statement number."

	printStatement --|> tWithFormatIdentifier.
	writeStatement --|> tWithFormatIdentifier.

	formatStatement --|> tFormatIdentifier.
	asterisk --|> tFormatIdentifier.

	programFile --|> tWithComments.
	programUnit --|> tWithComments.

	assignmentStatement --|> tAssignment.
	returnStatement --|> tReturnStatement.
]

{ #category : #definition }
FASTFortranGenerator >> defineProperties [

	super defineProperties.

	"sorted alphabetically, please keep the order"

	(arrayDimensionDeclarator property: #lb type: #Number) comment:
		'Lower bound'.

	(arrayDimensionDeclarator property: #ub type: #Number) comment:
		'Upper bound'.

	(callStatement property: #name type: #String) comment:
		'Name of called entity (a subroutine)'.

	(comment property: #content type: #String) comment:
		'Determines a content of a comment'.

	(commonStatement property: #name type: #String) comment:
		'Determines a Common block name, might be ommited'.

	(externalStatement property: #name type: #String) comment:
		'Name of external procedure, dummy procedure, or block data routine'.

	(functionCall property: #name type: #String) comment:
		'Name of called function'.

	(functionStatement property: #name type: #String) comment:
		'Name of a function statement'.

	(loopControlExpression property: #increment type: #String) comment:
		'Loop control increment value'.

	(loopControlExpression property: #limit type: #String) comment:
		'Loop control limit value'.

	(returnStatement property: #alternateReturnLable type: #String)
		comment: 'Optional. Expression of type INTEGER or REAL'.

	(stopStatement property: #displayArgument type: #String) comment:
		'Optional. Displayed when the program stops. String of no more that 5 digits or a character constant'.

	(tBinaryExpression property: #operator type: #String) comment:
		'Binary expression operator'.

	(tStatement property: #label type: #String) comment:
		'Determines the statement label which consists of 1 to 5 digits, with at least one nonzero'.

	(tUnaryExpression property: #operator type: #String) comment:
		'Unary expression operator'.

	(type property: #size type: #Number) comment: 'a data size in bytes'.

	(variable property: #name type: #String) comment:
		'Determines the variable name'.

	(writeStatement property: #format type: #String) comment:
		'Format identifier. '
]

{ #category : #definition }
FASTFortranGenerator >> defineRelations [

	super defineRelations.

	"sorted alphabetically, please keep the order"

	((assignmentExpression property: #leftPart) comment: 'assignee')
	<>- ((variable property: #parentAssignmentExpression) comment:
			 'Parent assignment expression').

	((assignmentExpression property: #rightPart) comment: 'assigned')
	<>- ((variable property: #parentAssignmentExpression) comment:
			 'Parent assignment expression').

	((commonStatement property: #variables) comment:
		 'List of variable names, array names, and array declarators ')
	<>- ((variable property: #parentCommonStatement) comment:
			 'Parent common expression').

	((declarationStatement property: #declarators) comment: 'declarators')
	<>-*
	((variable property: #parentDeclaration) comment:
		 'Parent declaration').

	((declarationStatement property: #type) comment: 'type')
	<>-
	((type property: #parentDeclaration) comment: 'Parent declaration').

	((dimensionStatement property: #arrays) comment: 'Specifies the name and dimensions of the arrays')
	<>-*
	((type property: #parentDimensionStatement) comment: 'Parent dimension statement').

	((doStatement property: #loopControl) comment: 'loop control')
	<>-
	((loopControlExpression property: #parentLoop) comment: 'Parent loop').

	((doStatement property: #statementBlock) comment:
		 'Statement block containing statements of the do body ')
	<>- ((tStatementBlock property: #parentDoStatement) comment:
			 'Parent do statement').

	((functionStatement property: #expression) comment:
		 'Expression thats being assigned upon declaration to the var')
	<>- ((tExpression property: #assignementExpressionOwner) comment:
			 'The AssignementExpression owner (if possible)').

	((ifBlockStatement property: #thenStatementBlock) comment:
		 'Statement block containing statements of then branch ')
	<>-
	((tStatementBlock property: #parentIfBlock) comment:
		 'Parent if block').

	((ifBlockStatement property: #elseStatementBlock) comment:
		 'Statement block containing statements of else branch ')
	<>-
	((tStatementBlock property: #parentIfBlock) comment:
		 'Parent if block').

	((ifBlockStatement property: #condition) comment: 'Condition')
	<>-
	((tExpression property: #parentIfBlock) comment: 'Parent if block').

	"((ifLogicalStatement property: #statement) comment:
		 'Statement of the logical if')
	<>- ((tStatement property: #parentIfBlock) comment: 'Parent if block').

	((ifLogicalStatement property: #condition) comment: 'Condition')
	<>-
	((tExpression property: #parentIfBlock) comment: 'Parent if block')."

	((loopControlExpression property: #init) comment:
		 'initial assignment')
	<>- ((assignmentExpression property: #parentLoopControlExpresison)
			 comment: 'Parent loop control expresison').

	((programFile property: #programUnit) comment:
		 'Program Units in a program file')
	<>-* ((programUnit property: #parentProgramFile) comment:
			 'Parent program file').

	((tBinaryExpression property: #left) comment:
		 'left part of a binary expression')
	<>- ((tExpression property: #parentExpression) comment:
			 'Parent expression (if possible)').

	((tBinaryExpression property: #right) comment:
		 'left part of the expression')
	<>- ((tExpression property: #parentExpression) comment:
			 'Parent expression (if possible)').

	((tUnaryExpression property: #expression) comment: 'expression')
	<>- ((tExpression property: #parentExpression) comment:
			 'Parent expression (if possible)').

	"The number of dimensions in an array is the number of dimension declarators. The minimum number of dimensions is one; the maximum is seven. For an assumed-size array, the last dimension can be an asterisk."
	((variableArray property: #arrayDimensionDeclarator) comment:
		 'An array dimension declarator specifies lower and upper dimension bounds of an array')
	<>-* ((arrayDimensionDeclarator property: #parentArray) comment:
			 'Parent array declaration').

	((tWithFormatIdentifier property: #format) comment:
		 'format identifier')
	<>- ((tFormatIdentifier property: #formatParentStatement) comment:
			 'The owner of the format identifier')
]

{ #category : #definition }
FASTFortranGenerator >> defineStatements [
	"A statement consists of zero or more key words, symbolic names, literal constants, statement labels, operators, and special characters."

	acceptStatement := builder
		                   newClassNamed: #AcceptStatement
		                   comment: 'I represent Fortran accept statement'.

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
	endFileStatement := builder
		                    newClassNamed: #EndFileStatement
		                    comment:
		                    'I represent Fortran End File statement'.

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

	returnStatement := builder
		                   newClassNamed: #ReturnStatement
		                   comment: 'a Fortran Return Statement'.

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
		                     newClassNamed: #VolatileStatement
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

	tFortranLabelledStatement := builder newTraitNamed: #TLabelledStatement comment: 'I represent a fortran statement with a label'.
	
]
