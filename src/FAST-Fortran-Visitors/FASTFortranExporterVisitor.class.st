Class {
	#name : #FASTFortranExporterVisitor,
	#superclass : #FASTFortranVisitor,
	#traits : 'FASTTExporter',
	#classTraits : 'FASTTExporter classTrait',
	#instVars : [
		'column',
		'breakLongCommentLines',
		'breakLongLines'
	],
	#category : #'FAST-Fortran-Visitors-Visitor'
}

{ #category : #outputting }
FASTFortranExporterVisitor >> breakLongCommentLines: aBoolean [

	breakLongCommentLines := aBoolean
]

{ #category : #outputting }
FASTFortranExporterVisitor >> breakLongLines: aBoolean [

	breakLongLines := aBoolean.
	breakLongLines ifFalse: [ self breakLongCommentLines: false ]
]

{ #category : #outputting }
FASTFortranExporterVisitor >> continuationLine: line [

	breakLongLines ifFalse: [ ^self ].

	breakLongCommentLines ifFalse: [
			(self isComment: line) ifTrue: [ ^self ]
		].

	self
		newLine ;
		spaces: 5 ;
		<< '& '
]

{ #category : #settings }
FASTFortranExporterVisitor >> doBreakLongCommentLines [

	self breakLongCommentLines: true
]

{ #category : #settings }
FASTFortranExporterVisitor >> doBreakLongLines [

	self breakLongLines: true
]

{ #category : #settings }
FASTFortranExporterVisitor >> dontBreakLongCommentLines [

	self breakLongCommentLines: false
]

{ #category : #settings }
FASTFortranExporterVisitor >> dontBreakLongLines [

	self breakLongLines: false
]

{ #category : #initialization }
FASTFortranExporterVisitor >> initialize [
	super initialize.

	column := 0.
	breakLongLines := true.
	breakLongCommentLines := false
]

{ #category : #testing }
FASTFortranExporterVisitor >> isComment: aLine [

	^( #($c $C $*) includes: aLine first) and: [ column = 0 ]
]

{ #category : #precedence }
FASTFortranExporterVisitor >> languageOperatorsPrecedence [
	"redefined to introduce fortran operators
	
	precedences taken from: https://www.tutorialspoint.com/fortran/fortran_operators_precedence.htm
	and: https://www.ibm.com/docs/en/xl-fortran-aix/13.1.0?topic=expressions-logical"

	 "unary operators"
	operatorsPrecedence at: #'.not.' put: 110.

	"exponentiation operator between NOT and multiplicative operator"
	operatorsPrecedence at: #'**' put: 100.

	"relational operators"
	operatorsPrecedence at: #'.gt.' put: 60.
	operatorsPrecedence at: #'.ge.' put: 60.
	operatorsPrecedence at: #'.lt.' put: 60.
	operatorsPrecedence at: #'.le.' put: 60.

	"equality operators"
	operatorsPrecedence at: #'.eq.' put: 50.
	operatorsPrecedence at: #'.ne.' put: 50.
	operatorsPrecedence at: #'/=' put: 50.

	"logical operators"
	operatorsPrecedence at: #'.and.' put: 40.
	operatorsPrecedence at: #'.or.' put: 30.
	operatorsPrecedence at: #'.xor.' put: 25.
	operatorsPrecedence at: #'.eqv.' put: 25.
	operatorsPrecedence at: #'.neqv.' put: 25.

]

{ #category : #outputting }
FASTFortranExporterVisitor >> newLine [
	"redefines to deal with line length
	 writes directly to the outputStream so that the return does not count for one column"

	column := 0.
	self outputStream cr.
]

{ #category : #outputting }
FASTFortranExporterVisitor >> output: aString [
	"redefines to deal with line length"

	((column + aString size) > 72)
		ifTrue: [ self continuationLine: aString ].

	self outputStream << aString.
	column := column + aString size
]

{ #category : #accessing }
FASTFortranExporterVisitor >> rootEntitiesIn: aFASTFortranModel [
	^aFASTFortranModel entities select: [ :entity |
		entity parents isEmpty
	]
]

{ #category : #outputting }
FASTFortranExporterVisitor >> sixSpaces [
	"mandatory six spaces at the begining of line + optional indent (2 spaces per level)"

	self upToSixSpaces: 0
	
]

{ #category : #outputting }
FASTFortranExporterVisitor >> upToSixSpaces: preceedingSize [
	"mandatory six spaces at the begining of line + optional indent (2 spaces per level)"

	| nbSpaces |
	nbSpaces := 6 + (self indentLevel * 2) - preceedingSize.
	self spaces: nbSpaces
	
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranAbstractIOStatement: aFASTFortranIOStatement named: aString [
	self
		visitFASTFortranAbstractStatement: aFASTFortranIOStatement ;
		<< aString ;
		visitFASTFortranTWithIOParameters: aFASTFortranIOStatement ioParameters ;
		visitFASTFortranTWithArguments: aFASTFortranIOStatement ;
		newLine
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranAbstractStatement: aFASTFortranAbstractStatement [
	"main role is to print the 'header' of the line:
	 - six spaces, or
	 - a label + spaces to complete 6 columns"

	aFASTFortranAbstractStatement label
		ifNil: [ self sixSpaces ]
		ifNotNil: [ :label |
			self
				<< label ;
				upToSixSpaces: label size ]
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranArrayRange: aFASTFortranArrayDimension [

	self outputTopLevelExpression: [ 
		(aFASTFortranArrayDimension lowerBound)
			ifNotNil: [ :lb |
				self
					visitFASTFortranArrayBound: lb	;
					<< ':'
			].
		self visitFASTFortranArrayBound: aFASTFortranArrayDimension upperBound
	]
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranArrayVariable: aFASTFortranArrayVariable [
	"call to #outputExpression:inParentheses: is oportunistic.
	 It is not an operator precedence case"

	self
		<< aFASTFortranArrayVariable name ;
		outputExpression: [ self visitNodeListSeparatedByCommas: aFASTFortranArrayVariable indices ]
		inParentheses: true
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranAssignmentStatement: aFASTFortranAssignmentStatement [

	self visitFASTFortranAbstractStatement: aFASTFortranAssignmentStatement.
	super visitFASTFortranAssignmentStatement: aFASTFortranAssignmentStatement.
	self newLine
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranAsterisk: aFASTFortranAsterisk [

	self << '*'
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranBinaryExpression: aFASTFortranBinaryExpression [

	self outputExpression: [
		aFASTFortranBinaryExpression left accept: self.
		self
			<< ' ' ;
			<< aFASTFortranBinaryExpression operator ;
			<< ' ' .
		aFASTFortranBinaryExpression right accept: self
		]
		withOperator: aFASTFortranBinaryExpression operator.
	
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranCallStatement: aFASTFortranCallStatement [
	"call to #outputExpression:inParentheses: is oportunistic.
	 It is not an operator precedence case"

	self
		visitFASTFortranAbstractStatement: aFASTFortranCallStatement ;
		<< 'call ' ;
		<< aFASTFortranCallStatement name.
		
	aFASTFortranCallStatement arguments
		ifNotEmpty: [
			self
				outputExpression: [ self visitFASTFortranTWithArguments: aFASTFortranCallStatement ]
				inParentheses: true
	].
	self newLine
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranCharacterType: aFASTFortranType [
	self << 'character'.
	self visitFASTFortranType: aFASTFortranType
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranCommonGroup: aFASTFortranCommonGroup [

	aFASTFortranCommonGroup name
		ifNotNil: [ :name |
			self
				<< ' /' ;
				<< name ;
				<< '/'
		].

	self
		<< ' ' ;
		visitNodeListSeparatedByCommas: aFASTFortranCommonGroup declarators
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranCommonStatement: aFASTFortranCommonStatement [

	self
		visitFASTFortranAbstractStatement: aFASTFortranCommonStatement ;
		<< 'common'.
		aFASTFortranCommonStatement groups do: [ :commonGroup | commonGroup accept: self ].
		self newLine
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranContinueStatement: aFASTFortranContinueStatement [

	self
		visitFASTFortranAbstractStatement: aFASTFortranContinueStatement ;
		<< 'continue' ;
		newLine
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranDataGroup: aFASTFortranDataGroup [

	self
		visitNodeListSeparatedByCommas: aFASTFortranDataGroup variables ;
		<< ' /' ;
		visitNodeListSeparatedByCommas: aFASTFortranDataGroup dataConstants ;
		<< '/ '
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranDataStatement: aFASTFortranDataStatement [

	self
		visitFASTFortranAbstractStatement: aFASTFortranDataStatement ;
		<< 'data ' ;
		visitNodeListSeparatedByCommas: aFASTFortranDataStatement variableGroups ;
		newLine
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranDimensionStatement: aFASTFortranDimensionStatement [

	self
		visitFASTFortranAbstractStatement: aFASTFortranDimensionStatement ;
		<< 'dimension ' ;
		visitNodeListSeparatedByCommas: aFASTFortranDimensionStatement declarators ;
		newLine
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [
	"FASTFortranDoStatement uses TWithLabelReferences, but it makes only one such reference"
	self
		visitFASTFortranAbstractStatement: aFASTFortranDoStatement ;
		<< 'do '.
	aFASTFortranDoStatement labelReferences ifNotEmpty: [ :references |
		"there is only 1 reference"
		references anyOne accept: self.
		self << ' '
	].

	aFASTFortranDoStatement loopControl accept: self.
	self newLine.
	aFASTFortranDoStatement statementBlock accept: self.

	aFASTFortranDoStatement labelReferences ifEmpty: [
		self
			sixSpaces ;
			<< 'end do' ;
			newLine
	].
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranDoublePrecisionType: aFASTFortranType [
	self << 'double precision'.
	self visitFASTFortranType: aFASTFortranType
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranEntryStatement: aFASTFortranEntryStatementNode [
	"call to #outputExpression:inParentheses: is oportunistic.
	 It is not an operator precedence case"

	self
		visitFASTFortranAbstractStatement: aFASTFortranEntryStatementNode ;
		<< 'entry ' ;
		<< aFASTFortranEntryStatementNode name ;
		outputExpression: [
			self visitNodeListSeparatedByCommas: aFASTFortranEntryStatementNode entryArguments ]
		inParentheses: true ;
		newLine.

]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranEquivalenceGroup: aFASTFortranEquivalenceGroup [
	"call to #outputExpression:inParentheses: is oportunistic.
	 It is not an operator precedence case"

	self space.
	self
		outputExpression: [
			self visitNodeListSeparatedByCommas: aFASTFortranEquivalenceGroup variables
		]
		inParentheses: true

]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranEquivalenceStatement: aFASTFortranEquivalenceStatement [

	self
		visitFASTFortranAbstractStatement: aFASTFortranEquivalenceStatement ;
		<< 'equivalence' ;
		visitNodeListSeparatedByCommas: aFASTFortranEquivalenceStatement variableGroups ;
		newLine
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranExitStatement: aFASTFortranExitStatement [

	self
		visitFASTFortranAbstractStatement: aFASTFortranExitStatement ;
		<< 'exit' ;
		newLine.

]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranExternalStatement: aFASTFortranExternalStatement [
	self
		visitFASTFortranAbstractStatement: aFASTFortranExternalStatement ;
		<< 'external ' ;
		<< aFASTFortranExternalStatement name ;
		newLine
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranFormatStatement: aFASTFortranFormatStatement [

	self
		visitFASTFortranAbstractStatement: aFASTFortranFormatStatement ;
		<< 'format '.

	"splitting the format string on comma because the importer gathers everything in a sometimes
	 long line"
	($, split: aFASTFortranFormatStatement formatDescription) 
		do: [ :string | self << string ]
		separatedBy: [ self << ',' ].
	self newLine
]

{ #category : #'visiting - programUnits' }
FASTFortranExporterVisitor >> visitFASTFortranFunction: aFASTFortranFunction [

	self sixSpaces.
	aFASTFortranFunction returnType
		ifNotNil: [ :returnType |
			returnType accept: self.
			self spaces: 1
		].
	self
		<< 'function ' ;
		<< aFASTFortranFunction name.
	self visitFASTFortranTWithParameters: aFASTFortranFunction.
	self newLine.
	self visitFASTFortranTBehaviouralEntity: aFASTFortranFunction
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranFunctionCall: aFASTFortranFunctionCall [

	self outputTopLevelExpression: [
		self << aFASTFortranFunctionCall name.
		aFASTFortranFunctionCall arguments
			ifNotEmpty: [
				self << '('.
				self visitFASTFortranTWithArguments: aFASTFortranFunctionCall.
				self << ')'
		]
	]
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranFunctionStatement: aFASTFortranFunctionStatement [
	"call to #outputExpression:inParentheses: is oportunistic.
	 It is not an operator precedence case"

	self visitFASTFortranAbstractStatement: aFASTFortranFunctionStatement.
	self
		<< aFASTFortranFunctionStatement name ;
		outputExpression: [ self visitNodeListSeparatedByCommas: aFASTFortranFunctionStatement arguments ]
		inParentheses: true ;
		<< ' = '.
	self outputTopLevelExpression: [aFASTFortranFunctionStatement expression accept: self].
	self newLine
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranGoToComputedStatement: aFASTFortranGoToComputedStatement [
	"note: an unconditional goto use TWithLabelReferences, but it actually has only one"

	self
		visitFASTFortranAbstractStatement: aFASTFortranGoToComputedStatement ;
		<< 'goto ' ;
		outputExpression: [self visitNodeListSeparatedByCommas: aFASTFortranGoToComputedStatement labelReferences]
		inParentheses: true ;
		space.
	self outputTopLevelExpression: [aFASTFortranGoToComputedStatement selectorExpression accept: self].
	self newLine
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranGoToStatement: aFASTFortranGoToStatement [
	"note: an unconditional goto use TWithLabelReferences, but it actually has only one"

	self
		visitFASTFortranAbstractStatement: aFASTFortranGoToStatement ;
		<< 'goto '.
	self outputTopLevelExpression: [ aFASTFortranGoToStatement labelReferences anyOne accept: self].
	self newLine
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatementNode [

	self
		visitFASTFortranAbstractStatement: aFASTFortranIfArithmeticStatementNode ;
		<< 'if ' ;
		outputExpression: [ aFASTFortranIfArithmeticStatementNode condition accept: self ]
		inParentheses: true ;
		space.
	self outputTopLevelExpression: [ aFASTFortranIfArithmeticStatementNode lessLabel accept: self].
	self << ', '.
	self outputTopLevelExpression: [aFASTFortranIfArithmeticStatementNode equalLabel accept: self].
	self << ', '.
	self outputTopLevelExpression: [aFASTFortranIfArithmeticStatementNode greaterLabel accept: self].
	self newLine.
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [
	"note: can we have a label on an else line ?"

	self
		visitFASTFortranAbstractStatement: aFASTFortranIfBlockStatement ;
		<< 'if ' ;
		outputExpression: [ aFASTFortranIfBlockStatement condition accept: self ]
		inParentheses: true ;
		<< ' then' ;
		newLine.
	aFASTFortranIfBlockStatement thenStatementBlock accept: self.
	(aFASTFortranIfBlockStatement elseStatementBlock)
		ifNotNil: [ :statementBlock |
			self
				sixSpaces ;
				<< 'else' ;
				newLine.
			statementBlock accept: self.
	].
	self
		sixSpaces ;
		<< 'end if' ;
		newLine
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [
	"Need to fiddle with indentationLevel because THEN statement is on the same line
	 as IfLogical
	 Sets the indentationLevel to -3 so that it gives zero spaces when combined with the
	 customary six spaces at the begining of all statements"

	| tmp |

	self
		visitFASTFortranAbstractStatement: aFASTFortranIfLogicalStatement ;
		<< 'if ' ;
		outputExpression: [ aFASTFortranIfLogicalStatement condition accept: self ]
		inParentheses: true ;
		space.

	tmp := self indentLevel.
	indentLevel := -3.
	aFASTFortranIfLogicalStatement statement accept: self.
	indentLevel := tmp
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranImplicitRange: aFASTFortranImplicitRange [

	self << aFASTFortranImplicitRange from.
	aFASTFortranImplicitRange to
		ifNotNil: [ :to |
			self
				<< '-' ;
				<< to
		]
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranImplicitStatement: aFASTFortranImplicitStatement [

	self
		visitFASTFortranAbstractStatement: aFASTFortranImplicitStatement ;
		<< 'implicit'.
	aFASTFortranImplicitStatement typingRules
		ifEmpty: [ self << ' none' ]
		ifNotEmpty: [
			self visitNodeListSeparatedByCommas: aFASTFortranImplicitStatement typingRules
		].
	self newLine
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranImplicitTypingRule: aFortranImplicitTypingRule [
	"call to #outputExpression:inParentheses: is oportunistic.
	 It is not an operator precedence case"

	self space.
	aFortranImplicitTypingRule type accept: self.
	self space.
	self
		outputExpression: [ self visitNodeListSeparatedByCommas: aFortranImplicitTypingRule ranges ]
		inParentheses: true

]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranImpliedDo: aFASTFortranImpliedDo [

	self
		outputExpression: [
			self
				visitNodeListSeparatedByCommas: aFASTFortranImpliedDo variables ;
				<< ','.
			aFASTFortranImpliedDo loopControl accept: self
		]
		inParentheses: true
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranInquireStatement: aFASTFortranInquireStatement [

	self
		visitFASTFortranAbstractStatement: aFASTFortranInquireStatement ;
		<< 'inquire ' ;
		outputExpression: [
			self visitNodeListSeparatedByCommas: aFASTFortranInquireStatement ioParameters ]
		inParentheses: true ;
		newLine.

]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranIntegerType: aFASTFortranType [
	self << 'integer'.
	self visitFASTFortranType: aFASTFortranType
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranLabelReference: aFASTFortranLabelReference [

	self << aFASTFortranLabelReference label
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranLogicalType: aFASTFortranType [
	self << 'logical'.
	self visitFASTFortranType: aFASTFortranType
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranLoopControlExpression: aFASTFortranLoopControlExpression [

	aFASTFortranLoopControlExpression init accept: self.

	aFASTFortranLoopControlExpression limit
	ifNotNil: [ :limit |
		self << ','.
		self outputTopLevelExpression: [ limit accept: self]
	].

	aFASTFortranLoopControlExpression increment
	ifNotNil: [ :incr |
		self << ','.
		self outputTopLevelExpression: [ incr accept: self]
	].

]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranModel: aFASTFortranModel [
	(self rootEntitiesIn: aFASTFortranModel) do: [ :rootEntity |
			rootEntity accept: self
	].
	^self outputStream
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranParameterStatement: aFASTFortranParameterStatement [

	self
		visitFASTFortranAbstractStatement: aFASTFortranParameterStatement ;
		<< 'parameter ' ;
		outputExpression: [ self visitNodeListSeparatedByCommas: aFASTFortranParameterStatement declarators ]
		inParentheses: true ;
		newLine
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranPauseStatement: aFASTFortranPausetStatement [

	self
		visitFASTFortranAbstractStatement: aFASTFortranPausetStatement ;
		<< 'pause '.
	aFASTFortranPausetStatement displayArgument
		ifNotNil: [ :message | self << message ].
	self newLine
]

{ #category : #'visiting - programUnits' }
FASTFortranExporterVisitor >> visitFASTFortranProgramMain: aFASTFortranProgramMain [

	self
		sixSpaces ;
		<< 'program ' ;
		<< aFASTFortranProgramMain name.
	self newLine.
	self visitFASTFortranTBehaviouralEntity: aFASTFortranProgramMain
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranReadStatement: aFASTFortranReadStatement [
	self visitFASTFortranAbstractIOStatement: aFASTFortranReadStatement named: 'read'.
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranRealType: aFASTFortranType [
	self << 'real'.
	self visitFASTFortranType: aFASTFortranType
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranRewindStatement: aFASTFortranRewindStatement [

	self
		visitFASTFortranAbstractStatement: aFASTFortranRewindStatement ;
		<< 'rewind ' ;
		outputExpression: [
			self visitNodeListSeparatedByCommas: aFASTFortranRewindStatement ioParameters ]
		inParentheses: true ;
		newLine.

]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranScalarVariable: aFASTFortranScalarVariable [
	self << aFASTFortranScalarVariable name
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatementBlock [
	"must output statements and comments in the right order"

	self indent.
	
	(SortedCollection sortBlock: [ :a :b | a startPos < b startPos ])
		addAll: aFASTFortranStatementBlock statements	;
		addAll: aFASTFortranStatementBlock comments	 ;
		do: [ :each | each accept: self ].

	self unindent
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranStopStatement: aFASTFortranStoptStatement [

	self
		visitFASTFortranAbstractStatement: aFASTFortranStoptStatement ;
		<< 'stop '.
	aFASTFortranStoptStatement displayArgument
		ifNotNil: [ :message | self << message ].
	self newLine
]

{ #category : #'visiting - programUnits' }
FASTFortranExporterVisitor >> visitFASTFortranSubroutine: aFASTFortranSubroutine [
	self
		sixSpaces ;
		<< 'subroutine ' ;
		<< aFASTFortranSubroutine name.
	self visitFASTFortranTWithParameters: aFASTFortranSubroutine.
	self newLine.
	self visitFASTFortranTBehaviouralEntity: aFASTFortranSubroutine
]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTAssignment: aFASTFortranTAssignment [

	aFASTFortranTAssignment variable accept: self.
	self << ' = '.
	self outputTopLevelExpression: [ aFASTFortranTAssignment expression accept: self]
]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTBehaviouralEntity: aFASTFortranTBehaviouralEntity [
	aFASTFortranTBehaviouralEntity statementBlock accept: self.
	self
		sixSpaces ;
		<< 'end' ;
		newLine

]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTCharacterLiteral: aFASTFortranTLiteral [
	"note: the ' are part of the text, cannot split line on them"

	| text |
	text := '''' , aFASTFortranTLiteral primitiveValue , ''''.
	self << text
]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTComment: aFASTFortranTComment [

	self
		<< aFASTFortranTComment content ;
		newLine
]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTLiteral: aFASTFortranTLiteral [
	self << aFASTFortranTLiteral primitiveValue
]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTReturnStatement: aFASTFortranTReturnStatement [

	self
		visitFASTFortranAbstractStatement: aFASTFortranTReturnStatement ;
		<< 'return '.
	aFASTFortranTReturnStatement expression
		ifNotNil: [ :expr | expr accept: self ].
	self newLine
]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTWithArguments: aFASTFortranTWithArguments [

	self visitNodeListSeparatedByCommas: aFASTFortranTWithArguments arguments
]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTWithFormat: aFASTFortranTWithFormatIdentifier [
	"call to #outputExpression:inParentheses: is oportunistic.
	 It is not an operator precedence case"

	self
		outputExpression: [ self visitNodeListSeparatedByCommas: aFASTFortranTWithFormatIdentifier format ]
		inParentheses: true

]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTWithIOParameters: anIOParametersCollection [
	"call to #outputExpression:inParentheses: is oportunistic.
	 It is not an operator precedence case"

	self
		space ;
		outputExpression: [ self visitNodeListSeparatedByCommas: anIOParametersCollection ]
		inParentheses: true ;
		space
]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTWithParameters: aFASTFortranTWithParameters [
	"call to #outputExpression:inParentheses: is oportunistic.
	 It is not an operator precedence case"

	self outputExpression: [ self visitNodeListSeparatedByCommas: aFASTFortranTWithParameters parameters ]
	inParentheses: true
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranType: aFASTFortranType [

	aFASTFortranType size ifNotNil: [ :length |
		self << '*'.
		length class = FASTFortranAsterisk
			ifTrue: [ self << '(*)' ]
			ifFalse: [ length accept: self ]
	]
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranUnaryExpression: aFASTFortranUnaryExpression [

	self outputExpression: [
		self
			<< aFASTFortranUnaryExpression operator ;
			space.
		aFASTFortranUnaryExpression expression accept: self
		]
		withOperator: aFASTFortranUnaryExpression operator.
	
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranVariableDeclarationStatement: aFASTFortranVariableDeclarationStatement [
	self visitFASTFortranAbstractStatement: aFASTFortranVariableDeclarationStatement.
	aFASTFortranVariableDeclarationStatement type accept: self.
	self << ' '.
	self visitNodeListSeparatedByCommas: aFASTFortranVariableDeclarationStatement declarators.
	self newLine
		
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranVariableDeclarator: aFASTFortranVariableDeclarator [
	"call to #outputExpression:inParentheses: is oportunistic.
	 It is not an operator precedence case"

	self << aFASTFortranVariableDeclarator variable.

	aFASTFortranVariableDeclarator dimensions
		ifNotEmpty: [ :dimensions |
			self
				outputExpression: [ self visitNodeListSeparatedByCommas: dimensions ]
				inParentheses: true
		].

	aFASTFortranVariableDeclarator expression
		ifNotNil: [ :expression |
			self << '='.
			self outputTopLevelExpression: [ expression accept: self]
		]

]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranWriteStatement: aFASTFortranWriteStatement [
	self visitFASTFortranAbstractIOStatement: aFASTFortranWriteStatement named: 'write'.
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTTEntity: aFASTTEntity [
	"all children visit are explicit, so don't do anything here"
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitNodeListSeparatedByCommas: aCollection [

	aCollection
		do: [ :node | node accept: self ]
		separatedBy: [ self << ',' ]
]
