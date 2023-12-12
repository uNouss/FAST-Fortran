Class {
	#name : #FASTFortranGenerator,
	#superclass : #FASTMetamodelGenerator,
	#instVars : [
		'acceptStatement',
		'assignmentStatement',
		'automaticStatement',
		'backspaceStatement',
		'blockData',
		'callStatement',
		'closeStatement',
		'comment',
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
		'function',
		'goToStatement',
		'goToAssignedStatement',
		'goToComputed',
		'ifArithmeticStatement',
		'ifBlockStatement',
		'ifLogicalStatement',
		'implicitStatement',
		'includeStatement',
		'inquireStatement',
		'intrinsicStatement',
		'loopControlExpression',
		'mainprogram',
		'mapStatement',
		'nameListStatement',
		'openStatement',
		'optionsStatement',
		'parameterStatement',
		'pauseStatement',
		'pragmaStatement',
		'printStatement',
		'procedure',
		'programUnit',
		'readStatement',
		'rewindStatement',
		'saveStatement',
		'staticStatement',
		'subprogram',
		'substring',
		'stopStatement',
		'subroutine',
		'unionStatement',
		'virtualStatement',
		'volatileStatement',
		'writeStatement',
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
		'asterisk',
		'ampersand',
		'functionStatement',
		'returnStatement',
		'variable',
		'binaryExpression',
		'unaryExpression',
		'programFile',
		'functionCall',
		'booleanConstant',
		'characterConstant',
		'statementBlock',
		'assignmentExpression',
		'tConditionalStatement',
		'tEntryArgument',
		'dataGroup',
		'labelReference',
		'abstractStatement',
		'abstractExpression',
		'abstractLiteral',
		'scalarVariable',
		'arrayVariable',
		'variableDeclarationStatement',
		'tWithDeclarators',
		'tVariableDeclarator',
		'variableDeclarator',
		'commonGroup',
		'tWithLabelReferences',
		'equivalenceGroup',
		'tVariableGroup',
		'tWithVariableGroup',
		'tWithFormat',
		'tFormat',
		'tIOParameter',
		'tWithIOParameters',
		'arrayRange',
		'implicitTypingRule',
		'implicitRange'
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
	"sorted alphabetically, please keep the order"

	abstractExpression := builder
		                   newClassNamed: #AbstractExpression
		                   comment: 'I am the super class of all Fortran expressions'.

	abstractLiteral := builder
		                   newClassNamed: #AbstractLiteral
		                   comment: 'I am the super class of all Fortran Literals'.

	ampersand := builder
		             newClassNamed: #Ampersand
		             comment:
		             'I represent an Ampersand Character Literal (Constant) that is often used in parameters and format identifiers'.

	arrayRange := builder
		                            newClassNamed: #ArrayRange
		                            comment:
		                            'I represent an array lower/upper bounds'.

	arrayVariable := builder
		                            newClassNamed: #ArrayVariable
		                            comment:
		                            'An array Fortran Variable, accessed in the code'.

	assignmentExpression := builder
		                        newClassNamed: #AssignmentExpression
		                        comment:
		                        'I represent an assignment expression as a part of assignment statement'.

	asterisk := builder
		            newClassNamed: #Asterisk
		            comment:
		            'I represent an Asterisk Character Literal (Constant) that is often used as a format identifier'.

	binaryExpression := builder
		                    newClassNamed: #BinaryExpression
		                    comment:
		                    'a Fortran Binary Expression (arithmetic, logical)'.

	booleanConstant := builder
		                   newClassNamed: #BooleanLiteral
		                   comment:
		                   'I represent Fortran Boolean Literal (Constant) statement'.

	byteType := builder
		            newClassNamed: #ByteType
		            comment:
			            'I represent Fortran Byte statement. The BYTE data type provides a data type that uses only one byte of storage. It is a logical data type, and has the synonym,
LOGICAL*1. A variable of type BYTE can hold any of the following: 1)one character, 2)an integer between -128 and 127, 3)the logical values, .TRUE. or .FALSE. If it is interpreted as a logical value, a value of 0 represents .FALSE., and any other value is interpreted as .TRUE.
f77 allows the BYTE type as an array index, just as it allows the REAL type, but it does not allow BYTE as a DO loop index (where it allows only INTEGER, REAL, and DOUBLE PRECISION). Wherever the compiler expects INTEGER explicitly, it will not allow BYTE.'.

	characterConstant := builder
		                     newClassNamed: #CharacterLiteral
		                     comment:
		                     'I represent Fortran Character Literal (Constant) statement'.

	characterType := builder
		                 newClassNamed: #CharacterType
		                 comment:
		                 'I represent Fortran Character statement. The character data type, CHARACTER, which has the synonym, CHARACTER*1, holds one character. The character is enclosed in apostrophes ('') or quotes (""). @ Allowing quotes ("") is nonstandard; if you compile with the -xl option, quotes mean something else, and you must use apostrophes to enclose a string. The data of type CHARACTER is always unsigned. A CHARACTER item occupies 1 byte (8 bits) of storage and is aligned on 1-byte boundaries.'.

	commonGroup := builder
		                   newClassNamed: #CommonGroup
		                   comment: 'I represent Common group inside a Common statement'.

	complexConstant := builder
		                   newClassNamed: #ComplexLiteral
		                   comment:
		                   'I represent Fortran Arithmetic Complex Literal (Constant) statement'.

	complexType := builder
		               newClassNamed: #ComplexType
		               comment:
		               'I represent Fortran Complex statement. A complex datum is an approximation of a complex number. The complex data type, COMPLEX, which defaults to a synonym for COMPLEX*8, is a pair of REAL*4 values that represent a complex number. The first element represents the real part and the second represents the imaginary part.The default size for a COMPLEX item (no size specified) is 8 bytes. The default alignment is on 4-byte boundaries. However, these defaults can be changed by compiling with certain special options'.

	doubleComplexConstant := builder
		                         newClassNamed: #DoubleComplexLiteral
		                         comment:
		                         'I represent Fortran Arithmetic Double Complex Literal (Constant) statement'.

	doubleComplexType := builder
		                     newClassNamed: #DoubleComplexType
		                     comment:
		                     'I represent Fortran Double Complex statement. The complex data type, DOUBLE COMPLEX, which usually has the synonym, COMPLEX*16, is a pair of DOUBLE PRECISION (REAL*8)values that represents a complex number. The first element represents the real part; the second represents the imaginary part.The default size for DOUBLE COMPLEX with no size specified is 16.'.

	doublePrecisionConstant := builder
		                           newClassNamed: #DoublePrecisionLiteral
		                           comment:
		                           'I represent Fortran Arithmetic Double Precision Literal (Constant) statement'.

	doublePrecisionType := builder
		                       newClassNamed: #DoublePrecisionType
		                       comment:
		                       'I represent Fortran Double Precision statement. A double-precision datum is an approximation of a real number. The double-precision data type, DOUBLE PRECISION, which has the synonym, REAL*8, holds one double-precision datum.The default size for DOUBLE PRECISION with no size specified is 8 bytes.A DOUBLE PRECISION element has a sign bit, an 11-bit exponent, and a 52-bit fraction. These DOUBLE PRECISION elements in f77 conform to the IEEE standard for double-precision floating-point data.'.

	integerConstant := builder
		                   newClassNamed: #IntegerLiteral
		                   comment:
		                   'I represent Fortran Arithmetic Integer Literal (Constant) statement'.

	integerType := builder
		               newClassNamed: #IntegerType
		               comment:
			               'I represent Fortran Integer statement. The integer data type, INTEGER, holds a signed integer.
The default size for INTEGER with no size specified is 4, and is aligned on 4-byte boundaries. However, these defaults can be
changed by compiling with certain special options.'.

	labelReference := builder
		newClassNamed: #LabelReference
		comment: 'I represent a reference to a Fortran label, like in a GoTo statement.
I contain the value of the label referred to'.

	logicalType := builder
		               newClassNamed: #LogicalType
		               comment:
		               'I represent Fortran Logical statement. The logical data type, LOGICAL, holds a logical value .TRUE. or .FALSE. The value 0 represents .FALSE.; any other value represents .TRUE.The usual default size for an LOGICAL item with no size specified is 4, and is aligned on 4-byte boundaries. However, these defaults can be changed by compiling with certain special options.'.

	loopControlExpression := builder
		                         newClassNamed: #LoopControlExpression
		                         comment:
		                         'a Fortran Loop Control Expression'.

	realConstant := builder
		                newClassNamed: #RealLiteral
		                comment:
		                'I represent Fortran Arithmetic Real Literal (Constant) statement'.

	realType := builder
		            newClassNamed: #RealType
		            comment:
		            'I represent Fortran Real statement. A real datum is an approximation of a real number. The real data type, REAL, which usually has the synonym, REAL*4, holds one real datum.The usual default size for a REAL item with no size specified is 4 bytes, and is aligned on 4-byte boundaries. However, these defaults can be changed by compiling with certain special options.A REAL element has a sign bit, an 8-bit exponent, and a 23-bit fraction. These REAL elements in f77 conform to the IEEE standard.'.

	scalarVariable := builder
		                             newClassNamed: #ScalarVariable
		                             comment:
		                             'a scalar Fortran Variable, used in declarations'.

	substring := builder
		             newClassNamed: #Substring
		             comment: 'I represent Fortran Substring'.

	type := builder
		        newClassNamed: #Type
		        comment: 'I represent Fortran Type statement'.

	variable := builder
		            newClassNamed: #Variable
		            comment:
		            'an abstract Fortran Variable, could be an array or a scalar'.

	variableDeclarator := builder
		            newClassNamed: #VariableDeclarator
		            comment:
		            'Part of a variable declaration: name of the variable + optional initial value'.

	unaryExpression := builder
		                   newClassNamed: #UnaryExpression
		                   comment:
		                   'a Fortran Unary Expression (arithmetic, logical, character)'

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
	procedure --|> tWithParameters.
	blockData --|> subprogram.
	function --|> procedure.
	subroutine --|> procedure.

	programFile --|> tWithComments.
	programUnit --|> tWithComments.

	"other entities"
	comment --|> tEntity.
	comment --|> tComment. 

	"FORTRAN STATEMENTS"
	abstractStatement --|> tStatement.
	acceptStatement  --|> tStatement.
	assignmentStatement --|> abstractStatement.
	assignmentStatement --|> tAssignment.
	automaticStatement --|> abstractStatement.
	backspaceStatement --|> abstractStatement.
	callStatement --|> abstractStatement.
	callStatement --|> tWithArguments.
	closeStatement --|> abstractStatement.
	commonStatement --|> abstractStatement.
	continueStatement --|> abstractStatement.
	dataStatement --|> abstractStatement.
	dataStatement --|> tWithVariableGroup.
	decodeStatement --|> abstractStatement.
	dimensionStatement --|> abstractStatement.
	dimensionStatement --|> tWithDeclarators.
	doStatement --|> abstractStatement.
	doStatement --|> tWithLabelReferences.
	doWhileStatement --|> abstractStatement.
	elseStatement --|> abstractStatement.
	encodeStatement --|> abstractStatement.
	endFileStatement --|> abstractStatement.
	entryStatement --|> abstractStatement.
	entryStatement --|> tNamedEntity.
	equivalenceStatement --|> abstractStatement.
	equivalenceStatement --|> tWithVariableGroup.
	exitStatement --|> abstractStatement.
	externalStatement --|> abstractStatement.
	formatStatement --|> abstractStatement.
	formatStatement --|> tWithFormat.
	functionStatement --|> abstractStatement.
	functionStatement --|> tWithArguments.
	goToStatement --|> abstractStatement.
	goToStatement --|> tWithLabelReferences.
	goToAssignedStatement --|> abstractStatement.
	goToAssignedStatement --|> tWithLabelReferences.
	goToComputed --|> abstractStatement.
	goToComputed --|> tWithLabelReferences.
	ifArithmeticStatement --|> abstractStatement.
	ifArithmeticStatement --|> tConditionalStatement.
	ifBlockStatement --|> abstractStatement.
	ifBlockStatement --|> tConditionalStatement.
	ifLogicalStatement --|> abstractStatement.
	ifLogicalStatement --|> tConditionalStatement.
	implicitStatement --|> abstractStatement.
	includeStatement --|> abstractStatement.
	inquireStatement --|> abstractStatement.
	intrinsicStatement --|> abstractStatement.
	mapStatement --|> abstractStatement.
	nameListStatement --|> abstractStatement.
	openStatement --|> abstractStatement.
	optionsStatement --|> abstractStatement.
	parameterStatement --|> abstractStatement.
	parameterStatement --|> tWithDeclarators.
	pauseStatement --|> abstractStatement.
	pragmaStatement --|> abstractStatement.
	printStatement --|> abstractStatement.
	printStatement --|> tWithFormat.
	printStatement --|> tWithArguments.
	readStatement --|> abstractStatement.
	readStatement --|> tWithIOParameters.
	readStatement --|> tWithArguments.
	returnStatement --|> abstractStatement.
	returnStatement --|> tReturnStatement.
	rewindStatement --|> abstractStatement.
	saveStatement --|> abstractStatement.
	statementBlock --|> tStatementBlock. 
	statementBlock --|> tWithComments. 
	staticStatement --|> abstractStatement.
	stopStatement --|> abstractStatement.
	unionStatement --|> abstractStatement.
	variableDeclarationStatement --|> abstractStatement.
	variableDeclarationStatement --|> tWithDeclarators.
	virtualStatement --|> abstractStatement.
	volatileStatement --|> abstractStatement.
	writeStatement --|> abstractStatement.
	writeStatement --|> tWithIOParameters.
	writeStatement --|> tWithArguments.


	"DATA"
	abstractExpression --|> tExpression.
	arrayRange --|> tExpression.
	arrayVariable --|> variable.
	assignmentExpression --|> abstractExpression.
	assignmentExpression --|> tAssignment.
	assignmentExpression --|> tIOParameter.
	commonGroup  --|> tWithDeclarators.
	dataGroup --|> tVariableGroup.
	equivalenceGroup --|> tVariableGroup.
	functionCall --|> abstractExpression.
	functionCall --|> tWithArguments.
	loopControlExpression --|> abstractExpression.
	scalarVariable --|> variable.
	scalarVariable --|> tFormat.
	substring --|> abstractExpression.
	variable --|> abstractExpression.
	variable --|> tVariableEntity.
	variable --|> tEntryArgument.
	variableDeclarator --|> tVariableDeclarator.
	
	binaryExpression --|> abstractExpression.
	binaryExpression --|> tBinaryExpression.
	unaryExpression --|> abstractExpression.
	unaryExpression --|> tUnaryExpression.

	abstractLiteral --|> abstractExpression.
	complexConstant --|> abstractLiteral.
	complexConstant --|> tNumericalLiteral.
	doubleComplexConstant --|> abstractLiteral.
	doubleComplexConstant --|> tNumericalLiteral.
	doublePrecisionConstant --|> abstractLiteral.
	doublePrecisionConstant --|> tNumericalLiteral.
	integerConstant --|> abstractLiteral.
	integerConstant --|> tNumericalLiteral.
	integerConstant --|> tFormat.
	realConstant --|> abstractLiteral.
	realConstant --|> tNumericalLiteral.
	ampersand --|> abstractLiteral.
	ampersand --|> tCharacterLiteral.
	characterConstant --|> abstractLiteral.
	characterConstant --|> tCharacterLiteral.
	characterConstant --|> tFormat.
	booleanConstant --|> abstractLiteral.
	booleanConstant --|> tBooleanLiteral.

	byteType --|> type.
	characterType --|> type.
	complexType --|> type.
	doubleComplexType --|> type.
	doublePrecisionType --|> type.
	integerType --|> type.
	logicalType --|> type.
	realType --|> type.

	asterisk --|> tNumericalLiteral.
	asterisk --|> tEntryArgument.
	asterisk --|> tFormat.

	tFormat --|> tIOParameter
]

{ #category : #definition }
FASTFortranGenerator >> defineProperties [

	super defineProperties.

	(callStatement property: #name type: #String) comment:
		'Name of called entity (a subroutine)'.

	(comment property: #content type: #String) comment:
		'Determines a content of a comment'.

	(commonGroup property: #name type: #String) comment:
		'The name of this Common group, might be ommited'.

	(externalStatement property: #name type: #String) comment:
		'Name of external procedure, dummy procedure, or block data routine'.

	(formatStatement property: #formatDescription type: #String).

	(functionCall property: #name type: #String) comment:
		'Name of called function'.

	(functionStatement property: #name type: #String) comment:
		'Name of a function statement'.

	(implicitRange property: #from type: #String) comment:
		'Start of character range for implicit rule'.

	(implicitRange property: #to type: #String) comment:
		'End of character range for implicit rule'.

	(labelReference property: #label type: #String) comment: 'The value of the label. The value is an integer literal, stored in a String'.

	(returnStatement property: #alternateReturnLable type: #String)
		comment: 'Optional. Expression of type INTEGER or REAL'.

	(pauseStatement property: #displayArgument type: #String) comment:
		'Optional. Displayed when the program pauses. String of no more that 5 digits or a character constant'.

	(stopStatement property: #displayArgument type: #String) comment:
		'Optional. Displayed when the program stops. String of no more that 5 digits or a character constant'.

	(tBinaryExpression property: #operator type: #String) comment:
		'Binary expression operator'.

	(tStatement property: #label type: #String) comment:
		'Determines the statement label which consists of 1 to 5 digits, with at least one nonzero'.

	(tUnaryExpression property: #operator type: #String) comment:
		'Unary expression operator'.

	(variable property: #name type: #String) comment:
		'Determines the variable name'.

	((tVariableDeclarator property: #variable type: #String) comment: 'The name of the variable being declared').

]

{ #category : #definition }
FASTFortranGenerator >> defineRelations [

	super defineRelations.

	((arrayRange property: #upperBound) comment: 'An upper bound of an array dimension')
	<>- ((tExpression property: #parentArrayDimensionDeclarator) comment:
			 'Parent array dimension declarator').

	((arrayRange property: #lowerBound) comment: 'A lower bound of an array dimension')
	<>- ((tExpression property: #parentArrayDimensionDeclarator) comment:
			 'Parent array dimension declarator').

	((variableDeclarator property: #dimensions) comment: 'Possible dimensions in case this is an array declaration')
	<>-* ((arrayRange property: #parentVariableDeclarator)
			comment: 'The variable declarator I am part of').

	((arrayVariable property: #indices) comment: 'Indices used in the array access')
	-* ((tExpression property: #parentArrayExpression) comment: 'an ArrayVariable expression of which I am an indice').

	((commonStatement property: #groups) comment:
		 'List common groups in this common statement')
	<>-* ((commonGroup property: #parentCommonStatement) comment:
			 'Parent common statement I belong to').

	(dataGroup property: #dataConstants)
	-* (tExpression property: #parentDataStatement).

	(tVariableGroup property: #variables)
	-* (variable property: #parentVariableGroup).

	((tWithIOParameters property: #ioParameters) comment: 'I represent a statement with IO-parameters (read or write)')
	<>-* (tIOParameter property: #parentIOStatement).

	tWithVariableGroup <>-* tVariableGroup.
	
	((tWithDeclarators property: #declarators) comment: 'variables declared')
	<>-* (tVariableDeclarator property: #parentDeclaration).

	((tVariableDeclarator property: #expression) comment:
		 'Expression assigned to the variable declared')
	<>- (tExpression property: #variableDeclaratorOwner) .

	((variableDeclarationStatement property: #type) comment: 'type')
	<>-
	((type property: #parentDeclaration) comment: 'Parent declaration').

	((doStatement property: #loopControl) comment: 'loop control')
	<>-
	((loopControlExpression property: #parentLoop) comment: 'Parent loop').

	((doStatement property: #statementBlock) comment:
		 'Statement block containing statements of the do body ')
	<>- ((tStatementBlock property: #parentDoStatement) comment:
			 'Parent do statement').

	(entryStatement property: #entryArguments)
	<>-* (tEntryArgument property: #entryStatement).

	(function property: #returnType)
	*- (type property: #typedFunctions).

	((functionStatement property: #expression) comment:
		 'Expression thats being assigned upon declaration to the var')
	<>- ((tExpression property: #assignementExpressionOwner) comment:
			 'The AssignementExpression owner (if possible)').

	((goToComputed property: #selectorExpression) comment: 'The expression which value selects the label to go to')
	- (tExpression property: #parentGotoComputedStatement).

	((goToAssignedStatement property: #selectorExpression) comment: 'The expression which value selects the label to go to')
	- (tExpression property: #parentGotoAssignedStatement).

	((tConditionalStatement property: #condition) comment: 'Condition')
	<>-
	((tExpression property: #parentConditionalStatement) comment: 'Parent conditional statement (if-block, if-logical, ...)').

	((ifLogicalStatement property: #statement) comment:
		 'Statement of the logical if')
	<>- ((tStatement property: #parentIfStatement) comment: 'Parent if statement').

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

	(ifArithmeticStatement property: #lessLabel)
	<>- (labelReference property: #parentIfArithmeticLessBranch).

	(ifArithmeticStatement property: #equalLabel)
	<>- (labelReference property: #parentIfArithmeticEqualBranch).

	(ifArithmeticStatement property: #greaterLabel)
	<>- (labelReference property: #parentIfArithmeticMoreBranch).

	(implicitStatement property: #typingRules)
	<>-* (implicitTypingRule property: #parentImplicitStatement).

	implicitTypingRule
	<>- (type property: #parentImplicitRule).

	(implicitTypingRule property: #ranges)
	<>-* (implicitRange property: #parentImplicitRule).

	((loopControlExpression property: #init) comment:
		 'initial assignment')
	<>- (assignmentExpression property: #parentLoopControlInitialization).

	((loopControlExpression property: #increment) comment:
		'Loop control increment value')
	<>- (tExpression property: #parentLoopControlIncrement).

	((loopControlExpression property: #limit) comment:
		'Loop control limit value')
	<>- (tExpression property: #parentLoopControlLimit).

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

	((type property: #size) comment: 'a data size in bytes')
	<>- (tNumericalLiteral property: #parentTypeSize).

	((tWithFormat property: #format) comment: 'The description of the format')
	<>- ((tFormat property: #parentFormatedStatement) comment: 'A format description in a Format/Print/Read/Write statement').

	((tWithLabelReferences property: #labelReferences) comment:
		 'the label(s) referenced')
	-* ((labelReference property: #referencer) comment:
			 'A statement (like goto) referencing this label').

]

{ #category : #definition }
FASTFortranGenerator >> defineStatements [
	"A statement consists of zero or more key words, symbolic names, literal constants, statement labels, operators, and special characters."

	abstractStatement := builder
		                   newClassNamed: #AbstractStatement
		                   comment: 'I am the super class of all Fortran statements'.

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
		                 comment: 'I represent a Fortran Data statement'.

	dataGroup := builder
		                 newClassNamed: #DataGroup
		                 comment: 'I represent a Fortran Data group in a Data statement'.
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
	equivalenceGroup := builder
		                        newClassNamed: #EquivalenceGroup
		                        comment:
		                        'I represent a group of variables in an Equivalence statement'.
	equivalenceStatement := builder
		                        newClassNamed: #EquivalenceStatement
		                        comment:
		                        'I represent a Fortran Equivalence statement'.
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
		                 comment: 'I represent Fortran Go To (unconditional) statement'.

	goToAssignedStatement := builder
		                         newClassNamed: #GoToAssignedStatement
		                         comment:
		                         'I represent Fortran Go To( Assigned) statement'.
	goToComputed := builder
		                newClassNamed: #GoToComputedStatement
		                comment:
		                'I represent Fortran Go To (Computed) statement'.

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

	implicitTypingRule := builder
		                     newClassNamed: #ImplicitTypingRule
		                     comment:
		                     'I represent a rule (ie. Type+letter range) in an Implicit statement'.

	implicitRange := builder
		                     newClassNamed: #ImplicitRange
		                     comment:
		                     'I represent a range of characters in an Implicit statement'.

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

	variableDeclarationStatement := builder
		                   newClassNamed: #VariableDeclarationStatement
		                   comment:
		                   'I represent a type declaration for one or many scalar variables or arrays'.	

	virtualStatement := builder
		                    newClassNamed: #VirtualStatement
		                    comment: 'I represent Fortran Virtual statement'.
	volatileStatement := builder
		                     newClassNamed: #VolatileStatement
		                     comment: 'I represent Fortran Volatile statement'.
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

	tConditionalStatement := builder newTraitNamed: #TConditionalStatement comment: 'I represent a fortran statement with a condition: if-block, if-logical'.

	tEntryArgument := builder newTraitNamed: #TEntryStatement comment: 'I represent an argument in an entry statement: it can be a variable name, array name, formal procedure name, or an asterisk'.

	tFormat := builder newTraitNamed: #TFormat comment: 'I represent a format description (eg. in Format or Print statement)'.

	tIOParameter := builder newTraitNamed: #TIOParameter comment: 'I represent a parameter to an IO-statement (read or write)'.

	tVariableDeclarator := builder newTraitNamed: #TVariableDeclarator comment: 'I represent a variable declarator: variable declared + optional initial value'.

	tVariableGroup := builder newTraitNamed: #TVariableGroup comment: 'I represent an entity with several variables like in a DataStatement or an EquivalenceStatement'.

	tWithIOParameters := builder newTraitNamed: #TWithIOParameters.

	tWithVariableGroup := builder newTraitNamed: #TWithVariableGroups comment: 'I represent a sattement with variable groups like a DataStatement or an EquivalenceStatement'.
 
	tWithDeclarators := builder newTraitNamed: #TWithDeclarators comment: 'I represent a declaration with several variable declarators'.

	tWithFormat := builder newTraitNamed: #TWithFormat comment: 'I represent a statement with a format (format, print)'.

	tWithLabelReferences := builder newTraitNamed: #TWithLabelReferences comment: 'I represent a statement (various kind of goto) that can have label references'.

]
