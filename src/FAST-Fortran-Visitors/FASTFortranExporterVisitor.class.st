Class {
	#name : #FASTFortranExporterVisitor,
	#superclass : #FASTFortranVisitor,
	#instVars : [
		'stream',
		'indent'
	],
	#category : #'FAST-Fortran-Visitors-Visitor'
}

{ #category : #streaming }
FASTFortranExporterVisitor >> << aString [
	self stream << aString
]

{ #category : #streaming }
FASTFortranExporterVisitor >> indent [
	indent := indent + 1
]

{ #category : #initialization }
FASTFortranExporterVisitor >> initialize [
	super initialize.

	indent := 0
]

{ #category : #streaming }
FASTFortranExporterVisitor >> newLine [
	self stream cr
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

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitAddition: aBinaryExpressionNode [

	self << '+'
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitDivision: aBinaryExpressionNode [

	self << '/'
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitExponentiation: aBinaryExpressionNode [

	self << '**'
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranAssignmentStatement: aFASTFortranAssignmentStatement [

	self sixSpaces.
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
		sixSpaces ;
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

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranCharacterType: aFASTFortranType [
	self << 'character'
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranContinueStatement: aFASTFortranContinueStatement [

	| lineStart |
	lineStart := self streamPosition.
	aFASTFortranContinueStatement label accept: self.
	
	self
		upToSixSpaces: (self streamPosition - lineStart) ;
		<< 'continue' ;
		newLine
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranDeclarationStatement: aFASTFortranDeclarationStatement [
	self sixSpaces.
	aFASTFortranDeclarationStatement type accept: self.
	self << ' '.
	self visitNodeListSeparatedByCommas: aFASTFortranDeclarationStatement declarators.
	self newLine
		
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [

	self
		sixSpaces ;
		<< 'do '.
	aFASTFortranDoStatement loopControl accept: self.
	self newLine.
	aFASTFortranDoStatement statementBlock accept: self
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranEntryStatement: aFASTFortranEntryStatementNode [

	self
		sixSpaces ;
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
		sixSpaces ;
		<< 'external ' ;
		<< aFASTFortranExternalStatement name ;
		newLine
]

{ #category : #'visiting - programUnits' }
FASTFortranExporterVisitor >> visitFASTFortranFunction: aFASTFortranFunction [

	self sixSpaces.
	aFASTFortranFunction returnType
		ifNotNil: [ :returnType |
			returnType accept: self.
			self << Character space
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
FASTFortranExporterVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [

	self
		sixSpaces ;
		<< 'if ('.
	aFASTFortranIfBlockStatement condition accept: self.
	self
		<< ') then' ;
		newLine.
	aFASTFortranIfBlockStatement thenStatementBlock accept: self.
	(aFASTFortranIfBlockStatement elseStatementBlock statements)
		ifNotEmpty: [
			self
				sixSpaces ;
				<< 'else' ;
				newLine.
			aFASTFortranIfBlockStatement elseStatementBlock accept: self.
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
		sixSpaces ;
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
		sixSpaces ;
		<< 'implicit none' ;
		newLine
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranIntegerType: aFASTFortranIntegerType [
	self << 'integer'
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranLogicalType: aFASTFortranType [
	self << 'logical'
]

{ #category : #'visiting - statements' }
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
FASTFortranExporterVisitor >> visitFASTFortranPauseStatement: aFASTFortranPausetStatement [

	self
		sixSpaces ;
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
	self << 'real'
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
		sixSpaces ;
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
	self
		<< '''' ;
		<< aFASTFortranTLiteral primitiveValue ;
		<< ''''
]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTComment: aFASTFortranTComment [

	self
		<< 'C' ;
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
		sixSpaces ;
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

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranWriteStatement: aFASTFortranWriteStatement [
	self
		sixSpaces ;
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

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitMultiplication: aBinaryExpressionNode [

	self << '*'
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitNodeListSeparatedByCommas: aCollection [

	aCollection
		do: [ :node | node accept: self ]
		separatedBy: [ self << ',' ]
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitSubtraction: aBinaryExpressionNode [

	self << '-'
]
