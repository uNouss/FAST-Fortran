Class {
	#name : #FASTFortranVisitor,
	#superclass : #FASTCoreVisitor,
	#category : #'FAST-Fortran-Visitors-Visitor'
}

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranAcceptStatement: aFASTFortranAcceptStatement [
	<generated>
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranAmpersand: aFASTFortranAmpersand [
	<generated>
	self visitFASTFortranTCharacterLiteral: aFASTFortranAmpersand.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranArrayBound: aFASTFortranArrayBound [

	^aFASTFortranArrayBound
		ifNil: [ nil ]
		ifNotNil: [ aFASTFortranArrayBound accept: self ]
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranArrayDimension: aFASTFortranArrayDimension [

	^{
		self visitFASTFortranArrayBound: aFASTFortranArrayDimension lowerBound .
		self visitFASTFortranArrayBound: aFASTFortranArrayDimension upperBound
	}
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranArrayVariable: aFASTFortranArrayVariable [
	<generated>
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranAssignmentStatement: aFASTFortranAssignmentStatement [
	<generated>
	self visitFASTFortranTAssignment: aFASTFortranAssignmentStatement.
	self visitFASTFortranTLabelledStatement: aFASTFortranAssignmentStatement.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranAsterisk: aFASTFortranAsterisk [

	self visitFASTFortranTNumericalLiteral: aFASTFortranAsterisk.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranAutomaticStatement: aFASTFortranAutomaticStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranAutomaticStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranBackspaceStatement: aFASTFortranBackspaceStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranBackspaceStatement.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranBinaryExpression: aFASTFortranBinaryExpression [

	self visitFASTFortranTExpression: aFASTFortranBinaryExpression.
	self visitFASTFortranTFortranBinaryExpression: aFASTFortranBinaryExpression.
	aFASTFortranBinaryExpression left accept: self.
	aFASTFortranBinaryExpression right accept: self.
	
]

{ #category : #'visiting - programUnits' }
FASTFortranVisitor >> visitFASTFortranBlockData: aFASTFortranBlockData [
	<generated>
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranBooleanLiteral: aFASTFortranBooleanLiteral [
	<generated>
	self visitFASTFortranTBooleanLiteral: aFASTFortranBooleanLiteral.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranByteType: aFASTFortranByteType [
	<generated>
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranCallStatement: aFASTFortranCallStatement [
	<generated>
	self visitFASTFortranTWithArguments: aFASTFortranCallStatement.
	self visitFASTFortranTLabelledStatement: aFASTFortranCallStatement.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranCharacterLiteral: aFASTFortranCharacterLiteral [
	<generated>
	self visitFASTFortranTCharacterLiteral: aFASTFortranCharacterLiteral.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranCharacterType: aFASTFortranCharacterType [
	<generated>
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranCloseStatement: aFASTFortranCloseStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranCloseStatement.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranComment: aFASTFortranComment [

	self visitFASTFortranTComment: aFASTFortranComment.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranCommonGroup: aFASTFortranCommonGroup [

	aFASTFortranCommonGroup variables do: [ :var | var accept: self ].
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranCommonStatement: aFASTFortranCommonStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranCommonStatement.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranComplexLiteral: aFASTFortranComplexLiteral [
	<generated>
	self visitFASTFortranTNumericalLiteral: aFASTFortranComplexLiteral.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranComplexType: aFASTFortranComplexType [
	<generated>
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranContinueStatement: aFASTFortranContinueStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranContinueStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranDataStatement: aFASTFortranDataStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranDataStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranDecodeStatement: aFASTFortranDecodeStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranDecodeStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranDimensionStatement: aFASTFortranDimensionStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranDimensionStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [

	self visitFASTFortranTLabelledStatement: aFASTFortranDoStatement.
	aFASTFortranDoStatement loopControl accept: self.
	aFASTFortranDoStatement statementBlock accept: self
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranDoWhileStatement: aFASTFortranDoWhileStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranDoWhileStatement.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranDoubleComplexLiteral: aFASTFortranDoubleComplexLiteral [
	<generated>
	self visitFASTFortranTNumericalLiteral: aFASTFortranDoubleComplexLiteral.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranDoubleComplexType: aFASTFortranDoubleComplexType [
	<generated>
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranDoublePrecisionLiteral: aFASTFortranDoublePrecisionLiteral [
	<generated>
	self visitFASTFortranTNumericalLiteral: aFASTFortranDoublePrecisionLiteral.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranDoublePrecisionType: aFASTFortranDoublePrecisionType [
	<generated>
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranElseStatement: aFASTFortranElseStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranElseStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranEncodeStatement: aFASTFortranEncodeStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranEncodeStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranEndFileStatement: aFASTFortranEndFileStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranEndFileStatement.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranEntity: aFASTFortranEntity [

	self visitFASTFortranTEntity: aFASTFortranEntity.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranEntryStatement: aFASTFortranEntryStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranEntryStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranEquivalenceStatement: aFASTFortranEquivalenceStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranEquivalenceStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranExitStatement: aFASTFortranExitStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranExitStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranExternalStatement: aFASTFortranExternalStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranExternalStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranFormatStatement: aFASTFortranFormatStatement [
	<generated>
	self visitFASTFortranTFormatIdentifier: aFASTFortranFormatStatement.
	self visitFASTFortranTLabelledStatement: aFASTFortranFormatStatement.
]

{ #category : #'visiting - programUnits' }
FASTFortranVisitor >> visitFASTFortranFunction: aFASTFortranFunction [

	self visitFASTFortranProcedure: aFASTFortranFunction.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranFunctionCall: aFASTFortranFunctionCall [
	<generated>
	self visitFASTFortranTExpression: aFASTFortranFunctionCall.
	self visitFASTFortranTWithArguments: aFASTFortranFunctionCall.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranFunctionStatement: aFASTFortranFunctionStatement [
	<generated>
	self visitFASTFortranTWithArguments: aFASTFortranFunctionStatement.
	self visitFASTFortranTLabelledStatement: aFASTFortranFunctionStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranGoToAssignedStatement: aFASTFortranGoToAssignedStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranGoToAssignedStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranGoToComputedStatement: aFASTFortranGoToComputedStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranGoToComputedStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranGoToStatement: aFASTFortranGoToStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranGoToStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranGoToUnconditionalStatement: aFASTFortranGoToUnconditionalStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranGoToUnconditionalStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranIfArithmeticStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [

	self visitFASTFortranTLabelledStatement: aFASTFortranIfBlockStatement.
	aFASTFortranIfBlockStatement condition accept: self.
	aFASTFortranIfBlockStatement thenStatementBlock accept: self.
	aFASTFortranIfBlockStatement elseStatementBlock accept: self.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranIfLogicalStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranImplicitStatement: aFASTFortranImplicitStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranImplicitStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranIncludeStatement: aFASTFortranIncludeStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranIncludeStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranInquireStatement: aFASTFortranInquireStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranInquireStatement.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranIntegerLiteral: aFASTFortranIntegerLiteral [
	<generated>
	self visitFASTFortranTNumericalLiteral: aFASTFortranIntegerLiteral.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranIntegerType: aFASTFortranIntegerType [
	<generated>
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranIntrinsicStatement: aFASTFortranIntrinsicStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranIntrinsicStatement.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranLabelReference: aFASTFortranLabelReference [

]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranLogicalType: aFASTFortranLogicalType [
	<generated>
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranLoopControlExpression: aFASTFortranLoopControlExpression [

	self visitFASTFortranTExpression: aFASTFortranLoopControlExpression.
	aFASTFortranLoopControlExpression init accept: self.
	aFASTFortranLoopControlExpression increment accept: self.
	aFASTFortranLoopControlExpression limit accept: self.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranMapStatement: aFASTFortranMapStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranMapStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranNameListStatement: aFASTFortranNameListStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranNameListStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranOpenStatement: aFASTFortranOpenStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranOpenStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranOptionsStatement: aFASTFortranOptionsStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranOptionsStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranParameterStatement: aFASTFortranParameterStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranParameterStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranPauseStatement: aFASTFortranPauseStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranPauseStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranPragmaStatement: aFASTFortranPragmaStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranPragmaStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranPrintStatement: aFASTFortranPrintStatement [
	<generated>
	self visitFASTFortranTWithArguments: aFASTFortranPrintStatement.
	self visitFASTFortranTWithFormatIdentifier: aFASTFortranPrintStatement.
	self visitFASTFortranTLabelledStatement: aFASTFortranPrintStatement.
]

{ #category : #'visiting - programUnits' }
FASTFortranVisitor >> visitFASTFortranProcedure: aFASTFortranProcedure [
	self visitFASTFortranSubprogram: aFASTFortranProcedure.
	self visitFASTFortranTWithParameters: aFASTFortranProcedure
]

{ #category : #'visiting - programUnits' }
FASTFortranVisitor >> visitFASTFortranProgramFile: aFASTFortranProgramFile [
	<generated>
	self visitFASTFortranTWithComments: aFASTFortranProgramFile.
]

{ #category : #'visiting - programUnits' }
FASTFortranVisitor >> visitFASTFortranProgramMain: aFASTFortranProgramMain [

	self visitFASTFortranProgramUnit: aFASTFortranProgramMain
]

{ #category : #'visiting - programUnits' }
FASTFortranVisitor >> visitFASTFortranProgramUnit: aFASTFortranProgramUnit [

	self visitFASTFortranTNamedBehaviouralEntity: aFASTFortranProgramUnit.
	self visitFASTFortranTWithComments: aFASTFortranProgramUnit.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranReadStatement: aFASTFortranReadStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranReadStatement.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranRealLiteral: aFASTFortranRealLiteral [
	<generated>
	self visitFASTFortranTNumericalLiteral: aFASTFortranRealLiteral.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranRealType: aFASTFortranRealType [
	<generated>
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranReturnStatement: aFASTFortranReturnStatement [
	<generated>
	self visitFASTFortranTReturnStatement: aFASTFortranReturnStatement.
	self visitFASTFortranTLabelledStatement: aFASTFortranReturnStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranRewindStatement: aFASTFortranRewindStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranRewindStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranSaveStatement: aFASTFortranSaveStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranSaveStatement.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranScalarVariable: aFASTFortranScalarVariable [
	<generated>
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatementBlock [
	<generated>
	self visitFASTFortranTStatementBlock: aFASTFortranStatementBlock.
	self visitFASTFortranTWithComments: aFASTFortranStatementBlock.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranStaticStatement: aFASTFortranStaticStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranStaticStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranStopStatement: aFASTFortranStopStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranStopStatement.
]

{ #category : #'visiting - programUnits' }
FASTFortranVisitor >> visitFASTFortranSubprogram: aFASTFortranSubprogram [
	self visitFASTFortranProgramUnit: aFASTFortranSubprogram 
]

{ #category : #'visiting - programUnits' }
FASTFortranVisitor >> visitFASTFortranSubroutine: aFASTFortranSubroutine [

	self visitFASTFortranProcedure: aFASTFortranSubroutine.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranSubstring: aFASTFortranSubstring [
	<generated>
	self visitFASTFortranTExpression: aFASTFortranSubstring.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTAssignment: aFASTFortranTAssignment [

	aFASTFortranTAssignment variable accept: self.
	aFASTFortranTAssignment expression accept: self.
	self visitFASTFortranTExpression: aFASTFortranTAssignment.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTBehaviouralEntity: aFASTFortranTBehaviouralEntity [

	self visitFASTFortranTScopableEntity: aFASTFortranTBehaviouralEntity.
	self visitFASTFortranTWithParameters: aFASTFortranTBehaviouralEntity.
	
	aFASTFortranTBehaviouralEntity statementBlock accept: self

]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTBooleanLiteral: aFASTFortranTBooleanLiteral [
	<generated>
	self visitFASTFortranTLiteral: aFASTFortranTBooleanLiteral.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTCharacterLiteral: aFASTFortranTCharacterLiteral [
	<generated>
	self visitFASTFortranTLiteral: aFASTFortranTCharacterLiteral.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTComment: aFASTFortranTComment [
	<generated>
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTEntity: aFASTFortranTEntity [
	<generated>
	self visitFASTTEntity: aFASTFortranTEntity.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTEntityCreator: aFASTFortranTEntityCreator [
	<generated>
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTExpression: aFASTFortranTExpression [
	<generated>
	self visitFASTFortranTEntity: aFASTFortranTExpression.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTExpressionStatement: aFASTFortranTExpressionStatement [
	<generated>
	self visitFASTFortranTStatement: aFASTFortranTExpressionStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTFormatIdentifier: aFASTFortranTFormatIdentifier [
	<generated>
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTFortranBinaryExpression: aFASTFortranTFortranBinaryExpression [
	<generated>
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTFortranUnaryExpression: aFASTFortranTFortranUnaryExpression [
	<generated>
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTInvocation: aFASTFortranTInvocation [
	<generated>
	self visitFASTFortranTExpression: aFASTFortranTInvocation.
	self visitFASTFortranTWithArguments: aFASTFortranTInvocation.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTLabelledStatement: aFASTFortranTLabelledStatement [
	<generated>
	self visitFASTFortranTStatement: aFASTFortranTLabelledStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTLiteral: aFASTFortranTLiteral [
	<generated>
	self visitFASTFortranTExpression: aFASTFortranTLiteral.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTNamedBehaviouralEntity: aFASTFortranTNamedBehaviouralEntity [
	<generated>
	self visitFASTFortranTBehaviouralEntity: aFASTFortranTNamedBehaviouralEntity.
	self visitFASTFortranTNamedEntity: aFASTFortranTNamedBehaviouralEntity.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTNamedEntity: aFASTFortranTNamedEntity [

]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTNullPointerLiteral: aFASTFortranTNullPointerLiteral [
	<generated>
	self visitFASTFortranTLiteral: aFASTFortranTNullPointerLiteral.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTNumericalLiteral: aFASTFortranTNumericalLiteral [
	<generated>
	self visitFASTFortranTLiteral: aFASTFortranTNumericalLiteral.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTReturnStatement: aFASTFortranTReturnStatement [
	<generated>
	self visitFASTFortranTStatement: aFASTFortranTReturnStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTScopableEntity: aFASTFortranTScopableEntity [

]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTStatement: aFASTFortranTStatement [
	<generated>
	self visitFASTFortranTEntity: aFASTFortranTStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTStatementBlock: aFASTFortranTStatementBlock [
	aFASTFortranTStatementBlock statements do: [ :statement |
		statement accept: self
	]
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTStringLiteral: aFASTFortranTStringLiteral [
	<generated>
	self visitFASTFortranTLiteral: aFASTFortranTStringLiteral.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTVariableEntity: aFASTFortranTVariableEntity [
	<generated>
	self visitFASTFortranTNamedEntity: aFASTFortranTVariableEntity.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTVariableExpression: aFASTFortranTVariableExpression [
	<generated>
	self visitFASTFortranTExpression: aFASTFortranTVariableExpression.
	self visitFASTFortranTNamedEntity: aFASTFortranTVariableExpression.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTWithArguments: aFASTFortranTWithArguments [

	
	aFASTFortranTWithArguments arguments do: [ :arg | arg accept: self ]
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTWithComments: aFASTFortranTWithComments [
	<generated>
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTWithFormatIdentifier: aFASTFortranTWithFormatIdentifier [

	aFASTFortranTWithFormatIdentifier format do: [ :fmt | fmt accept: self ]
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranTWithParameters: aFASTFortranTWithParameters [
	"introducing #visitParameter:"

	aFASTFortranTWithParameters parameters
		do: [ :param | self visitParameter: param ]

]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranType: aFASTFortranType [

	^aFASTFortranType size
		ifNil: [ nil ]
		ifNotNil: [ :length | length accept: self ]
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranUnaryExpression: aFASTFortranUnaryExpression [
	<generated>
	self visitFASTFortranTExpression: aFASTFortranUnaryExpression.
	self visitFASTFortranTFortranUnaryExpression: aFASTFortranUnaryExpression.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranUnionStatement: aFASTFortranUnionStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranUnionStatement.
]

{ #category : #'visiting - expressions' }
FASTFortranVisitor >> visitFASTFortranVariable: aFASTFortranVariable [
	<generated>
	self visitFASTFortranTExpression: aFASTFortranVariable.
	self visitFASTFortranTVariableEntity: aFASTFortranVariable.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranVariableDeclarationStatement: aFASTFortranVariableDeclarationStatement [

	self visitFASTFortranTLabelledStatement: aFASTFortranVariableDeclarationStatement.
	aFASTFortranVariableDeclarationStatement type accept: self.
	aFASTFortranVariableDeclarationStatement declarators do: [:decl | decl accept: self]
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranVariableDeclarator: aFASTFortranVariableDeclarator [

	^aFASTFortranVariableDeclarator expression
		ifNotNil: [ :expression | expression accept: self ]
		ifNil: [ nil ]
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranVirtualStatement: aFASTFortranVirtualStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranVirtualStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranVolatileStatement: aFASTFortranVolatileStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranVolatileStatement.
]

{ #category : #'visiting - statements' }
FASTFortranVisitor >> visitFASTFortranWriteStatement: aFASTFortranWriteStatement [
	<generated>
	self visitFASTFortranTLabelledStatement: aFASTFortranWriteStatement.
	self visitFASTFortranTWithFormatIdentifier: aFASTFortranWriteStatement.
	self visitFASTFortranTWithArguments: aFASTFortranWriteStatement.
]

{ #category : #'visiting - programUnits' }
FASTFortranVisitor >> visitParameter: aFASTFortranScalarVariable [
	"no special type for parameters, but worth having its own visit method
	 (see #visitTWithParameters:)"
	aFASTFortranScalarVariable accept: self
]
