Class {
	#name : #FASTFortranExporterVisitor,
	#superclass : #FASTFortranVisitor,
	#instVars : [
		'stream',
		'indent',
		'column',
		'breakLongCommentLines',
		'breakLongLines'
	],
	#category : #'FAST-Fortran-Visitors-Visitor'
}

{ #category : #streaming }
FASTFortranExporterVisitor >> << aString [

	((column + aString size) > 72)
		ifTrue: [ self continuationLine: aString ].

	self stream << aString.
	column := column + aString size
]

{ #category : #accessing }
FASTFortranExporterVisitor >> breakLongCommentLines: aBoolean [

	breakLongCommentLines := aBoolean
]

{ #category : #accessing }
FASTFortranExporterVisitor >> breakLongLines: aBoolean [

	breakLongLines := aBoolean.
	breakLongLines ifFalse: [ self breakLongCommentLines: false ]
]

{ #category : #streaming }
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

{ #category : #streaming }
FASTFortranExporterVisitor >> indent [
	indent := indent + 1
]

{ #category : #initialization }
FASTFortranExporterVisitor >> initialize [
	super initialize.

	indent := 0.
	column := 0.
	breakLongLines := true.
	breakLongCommentLines := false
]

{ #category : #testing }
FASTFortranExporterVisitor >> isComment: aLine [

	^( #($c $C $*) includes: aLine first) and: [ column = 0 ]
]

{ #category : #streaming }
FASTFortranExporterVisitor >> newLine [

	self stream cr.
	column := 0
]

{ #category : #accessing }
FASTFortranExporterVisitor >> resetStream [
	stream := nil
]

{ #category : #accessing }
FASTFortranExporterVisitor >> rootEntitiesIn: aFASTFortranModel [
	^aFASTFortranModel entities select: [ :entity |
		entity parents isEmpty
	]
]

{ #category : #streaming }
FASTFortranExporterVisitor >> sixSpaces [
	"mandatory six spaces at the begining of line + optional indent (2 spaces per level)"

	self upToSixSpaces: 0
	
]

{ #category : #streaming }
FASTFortranExporterVisitor >> spaces: number [

	self << (String space repeat: number)
]

{ #category : #accessing }
FASTFortranExporterVisitor >> stream [
	^stream ifNil: [ stream := WriteStream on: '' ]
]

{ #category : #streaming }
FASTFortranExporterVisitor >> streamPosition [

	^self stream position
]

{ #category : #streaming }
FASTFortranExporterVisitor >> unindent [
	self assert: (indent > 0).
	indent := indent - 1
]

{ #category : #streaming }
FASTFortranExporterVisitor >> upToSixSpaces: preceedingSize [
	"mandatory six spaces at the begining of line + optional indent (2 spaces per level)"

	| nbSpaces |
	nbSpaces := 6 + (indent * 2) - preceedingSize.
	self spaces: nbSpaces
	
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

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranArrayDimension: aFASTFortranArrayDimension [

	(aFASTFortranArrayDimension lowerBound)
		ifNotNil: [ :lb |
			self
				visitFASTFortranArrayBound: lb	;
				<< ':'
		].
	self visitFASTFortranArrayBound: aFASTFortranArrayDimension upperBound

]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranArrayVariable: aFASTFortranArrayVariable [

	self
		<< aFASTFortranArrayVariable name ;
		<< '(' ;
		visitNodeListSeparatedByCommas: aFASTFortranArrayVariable indices ;
		<< ')'
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

	aFASTFortranBinaryExpression left accept: self.
	self
		<< ' ' ;
		<< aFASTFortranBinaryExpression operator ;
		<< ' ' .
	aFASTFortranBinaryExpression right accept: self.
	
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranCallStatement: aFASTFortranCallStatement [

	self
		visitFASTFortranAbstractStatement: aFASTFortranCallStatement ;
		<< 'call ' ;
		<< aFASTFortranCallStatement name.
		
	aFASTFortranCallStatement arguments
		ifNotEmpty: [
			self << '('.
			self visitFASTFortranTWithArguments: aFASTFortranCallStatement.
			self << ')'
	].
	self newLine
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranCharacterType: aFASTFortranType [
	self << 'character'.
	self visitFASTFortranType: aFASTFortranType
]

{ #category : #testing }
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
		visitNodeListSeparatedByCommas: aFASTFortranDataGroup dataVariables ;
		<< ' /' ;
		visitNodeListSeparatedByCommas: aFASTFortranDataGroup dataConstants ;
		<< '/ '
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranDataStatement: aFASTFortranDataStatement [

	self
		visitFASTFortranAbstractStatement: aFASTFortranDataStatement ;
		<< 'data ' ;
		visitNodeListSeparatedByCommas: aFASTFortranDataStatement dataGroups ;
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

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranEntryStatement: aFASTFortranEntryStatementNode [

	self
		visitFASTFortranAbstractStatement: aFASTFortranEntryStatementNode ;
		<< 'entry ' ;
		<< aFASTFortranEntryStatementNode name ;
		<< '('.
	self visitNodeListSeparatedByCommas: aFASTFortranEntryStatementNode entryArguments.
	self
		<< ')' ;
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

	self << aFASTFortranFunctionCall name.
	aFASTFortranFunctionCall arguments
		ifNotEmpty: [
			self << '('.
			self visitFASTFortranTWithArguments: aFASTFortranFunctionCall.
			self << ')'
	]
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranFunctionStatement: aFASTFortranFunctionStatement [

	self visitFASTFortranAbstractStatement: aFASTFortranFunctionStatement.
	self
		<< aFASTFortranFunctionStatement name ;
		<< '(' ;
		visitNodeListSeparatedByCommas: aFASTFortranFunctionStatement arguments ;
		<< ') = '.
	aFASTFortranFunctionStatement expression accept: self.
	self newLine
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranGoToComputedStatement: aFASTFortranGoToComputedStatement [
	"note: an unconditional goto use TWithLabelReferences, but it actually has only one"

	self
		visitFASTFortranAbstractStatement: aFASTFortranGoToComputedStatement ;
		<< 'goto (' ;
		visitNodeListSeparatedByCommas: aFASTFortranGoToComputedStatement labelReferences ;
		<< ') '.
	aFASTFortranGoToComputedStatement selectorExpression accept: self.
	self newLine
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranGoToStatement: aFASTFortranGoToStatement [
	"note: an unconditional goto use TWithLabelReferences, but it actually has only one"

	self
		visitFASTFortranAbstractStatement: aFASTFortranGoToStatement ;
		<< 'goto '.
	aFASTFortranGoToStatement labelReferences anyOne accept: self.
	self newLine
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatementNode [

	self
		visitFASTFortranAbstractStatement: aFASTFortranIfArithmeticStatementNode ;
		<< 'if ('.
	aFASTFortranIfArithmeticStatementNode condition accept: self.
	self << ') '.
	aFASTFortranIfArithmeticStatementNode lessLabel accept: self.
	self << ', '.
	aFASTFortranIfArithmeticStatementNode equalLabel accept: self.
	self << ', '.
	aFASTFortranIfArithmeticStatementNode greaterLabel accept: self.
	self newLine.
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [
	"note: can we have a label on an else line ?"

	self
		visitFASTFortranAbstractStatement: aFASTFortranIfBlockStatement ;
		<< 'if ('.
	aFASTFortranIfBlockStatement condition accept: self.
	self
		<< ') then' ;
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

	| tmp |
	self
		visitFASTFortranAbstractStatement: aFASTFortranIfLogicalStatement ;
		<< 'if ('.
	aFASTFortranIfLogicalStatement condition accept: self.
	self << ') '.
	tmp := indent.
	indent := -3.
	aFASTFortranIfLogicalStatement statement accept: self.
	indent := tmp
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranImplicitStatement: aFASTFortranImplicitStatement [

	self
		visitFASTFortranAbstractStatement: aFASTFortranImplicitStatement ;
		<< 'implicit none' ;
		newLine
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranIntegerType: aFASTFortranType [
	self << 'integer'.
	self visitFASTFortranType: aFASTFortranType
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranLabelReference: aFASTFortranLabelReference [

	self << aFASTFortranLabelReference label
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranLogicalType: aFASTFortranType [
	self << 'logical'.
	self visitFASTFortranType: aFASTFortranType
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranLoopControlExpression: aFASTFortranLoopControlExpression [

	aFASTFortranLoopControlExpression init accept: self.
	aFASTFortranLoopControlExpression increment
	ifNotNil: [ :incr |
		self << ','.
		incr accept: self ].
	aFASTFortranLoopControlExpression limit
	ifNotNil: [ :limit |
		self << ','.
		limit accept: self ].

]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranModel: aFASTFortranModel [
	(self rootEntitiesIn: aFASTFortranModel) do: [ :rootEntity |
			rootEntity accept: self
	].
	^self stream
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranParameterStatement: aFASTFortranParameterStatement [

	self
		visitFASTFortranAbstractStatement: aFASTFortranParameterStatement ;
		<< 'parameter (' ;
		visitNodeListSeparatedByCommas: aFASTFortranParameterStatement declarators ;
		<< ')' ;
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

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranRealType: aFASTFortranType [
	self << 'real'.
	self visitFASTFortranType: aFASTFortranType
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
	aFASTFortranTAssignment expression accept: self
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
FASTFortranExporterVisitor >> visitFASTFortranTWithFormatIdentifier: aFASTFortranTWithFormatIdentifier [
	self << '('.
	self visitNodeListSeparatedByCommas: aFASTFortranTWithFormatIdentifier format.
	self << ')'.
]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTWithParameters: aFASTFortranTWithParameters [
	self << '('.
	self visitNodeListSeparatedByCommas: aFASTFortranTWithParameters parameters.
	self << ')'.
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranType: aFASTFortranType [

	aFASTFortranType size ifNotNil: [ :length |
		self << '*'.
		super visitFASTFortranType: aFASTFortranType
	]
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

	self << aFASTFortranVariableDeclarator variable.

	aFASTFortranVariableDeclarator dimensions
		ifNotEmpty: [ :dimensions |
			self << '('.
			self visitNodeListSeparatedByCommas: dimensions.
			self << ')'.
		].

	aFASTFortranVariableDeclarator expression
		ifNotNil: [ :expression |
			self <<'='.
			expression accept: self
		]

]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranWriteStatement: aFASTFortranWriteStatement [
	self
		visitFASTFortranAbstractStatement: aFASTFortranWriteStatement ;
		<< 'write'.
	self visitFASTFortranTWithFormatIdentifier: aFASTFortranWriteStatement.
	self << ' '.
	self visitFASTFortranTWithArguments: aFASTFortranWriteStatement.
	self newLine
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
