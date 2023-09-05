Class {
	#name : #FASTFortranVisitor,
	#superclass : #FASTCoreVisitor,
	#category : #'FAST-Fortran-Visitor'
}

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranAcceptStatement: aFASTFortranAcceptStatement [
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranAmpersand: aFASTFortranAmpersand [
	self visitFASTFortranTCharacterLiteral: aFASTFortranAmpersand.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranArrayDimensionDeclarator: aFASTFortranArrayDimensionDeclarator [
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranArrayVariable: aFASTFortranArrayVariable [
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranAssignmentStatement: aFASTFortranAssignmentStatement [
	self visitFASTFortranTAssignment: aFASTFortranAssignmentStatement.
	self visitFASTFortranTLabelledStatement: aFASTFortranAssignmentStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranAsterisk: aFASTFortranAsterisk [
	self visitFASTFortranTFormatIdentifier: aFASTFortranAsterisk.
	self visitFASTFortranTNumericalLiteral: aFASTFortranAsterisk.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranAutomaticStatement: aFASTFortranAutomaticStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranAutomaticStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranBackspaceStatement: aFASTFortranBackspaceStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranBackspaceStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranBinaryExpression: aFASTFortranBinaryExpression [
	self visitFASTFortranTExpression: aFASTFortranBinaryExpression.
	self visitFASTFortranTFortranBinaryExpression: aFASTFortranBinaryExpression.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranBlockData: aFASTFortranBlockData [
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranBooleanLiteral: aFASTFortranBooleanLiteral [
	self visitFASTFortranTBooleanLiteral: aFASTFortranBooleanLiteral.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranByteType: aFASTFortranByteType [
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranCallStatement: aFASTFortranCallStatement [
	self visitFASTFortranTWithArguments: aFASTFortranCallStatement.
	self visitFASTFortranTLabelledStatement: aFASTFortranCallStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranCharacterLiteral: aFASTFortranCharacterLiteral [
	self visitFASTFortranTCharacterLiteral: aFASTFortranCharacterLiteral.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranCharacterType: aFASTFortranCharacterType [
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranCloseStatement: aFASTFortranCloseStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranCloseStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranComment: aFASTFortranComment [
	self visitFASTFortranTComment: aFASTFortranComment.
	self visitFASTFortranTEntity: aFASTFortranComment.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranCommonStatement: aFASTFortranCommonStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranCommonStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranComplexLiteral: aFASTFortranComplexLiteral [
	self visitFASTFortranTNumericalLiteral: aFASTFortranComplexLiteral.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranComplexType: aFASTFortranComplexType [
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranContinueStatement: aFASTFortranContinueStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranContinueStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranDataStatement: aFASTFortranDataStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranDataStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranDeclarationStatement: aFASTFortranDeclarationStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranDeclarationStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranDecodeStatement: aFASTFortranDecodeStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranDecodeStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranDimensionStatement: aFASTFortranDimensionStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranDimensionStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranDoStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranDoWhileStatement: aFASTFortranDoWhileStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranDoWhileStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranDoubleComplexLiteral: aFASTFortranDoubleComplexLiteral [
	self visitFASTFortranTNumericalLiteral: aFASTFortranDoubleComplexLiteral.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranDoubleComplexType: aFASTFortranDoubleComplexType [
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranDoublePrecisionLiteral: aFASTFortranDoublePrecisionLiteral [
	self visitFASTFortranTNumericalLiteral: aFASTFortranDoublePrecisionLiteral.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranDoublePrecisionType: aFASTFortranDoublePrecisionType [
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranElseStatement: aFASTFortranElseStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranElseStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranEncodeStatement: aFASTFortranEncodeStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranEncodeStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranEndFileStatement: aFASTFortranEndFileStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranEndFileStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranEntity: aFASTFortranEntity [
	self visitFASTFortranTEntity: aFASTFortranEntity.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranEntryStatement: aFASTFortranEntryStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranEntryStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranEquivalenceStatement: aFASTFortranEquivalenceStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranEquivalenceStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranExitStatement: aFASTFortranExitStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranExitStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranExternalStatement: aFASTFortranExternalStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranExternalStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranFormatStatement: aFASTFortranFormatStatement [
	self visitFASTFortranTFormatIdentifier: aFASTFortranFormatStatement.
	self visitFASTFortranTLabelledStatement: aFASTFortranFormatStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranFunction: aFASTFortranFunction [
	self visitFASTFortranTWithParameters: aFASTFortranFunction.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranFunctionCall: aFASTFortranFunctionCall [
	self visitFASTFortranTExpression: aFASTFortranFunctionCall.
	self visitFASTFortranTWithArguments: aFASTFortranFunctionCall.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranFunctionStatement: aFASTFortranFunctionStatement [
	self visitFASTFortranTWithArguments: aFASTFortranFunctionStatement.
	self visitFASTFortranTLabelledStatement: aFASTFortranFunctionStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranGoToAssignedStatement: aFASTFortranGoToAssignedStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranGoToAssignedStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranGoToComputedStatement: aFASTFortranGoToComputedStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranGoToComputedStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranGoToStatement: aFASTFortranGoToStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranGoToStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranGoToUnconditionalStatement: aFASTFortranGoToUnconditionalStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranGoToUnconditionalStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranIfArithmeticStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranIfBlockStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranIfLogicalStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranImplicitStatement: aFASTFortranImplicitStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranImplicitStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranIncludeStatement: aFASTFortranIncludeStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranIncludeStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranInquireStatement: aFASTFortranInquireStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranInquireStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranIntegerLiteral: aFASTFortranIntegerLiteral [
	self visitFASTFortranTNumericalLiteral: aFASTFortranIntegerLiteral.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranIntegerType: aFASTFortranIntegerType [
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranIntrinsicStatement: aFASTFortranIntrinsicStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranIntrinsicStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranLogicalType: aFASTFortranLogicalType [
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranLoopControlExpression: aFASTFortranLoopControlExpression [
	self visitFASTFortranTExpression: aFASTFortranLoopControlExpression.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranMapStatement: aFASTFortranMapStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranMapStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranNameListStatement: aFASTFortranNameListStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranNameListStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranOpenStatement: aFASTFortranOpenStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranOpenStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranOptionsStatement: aFASTFortranOptionsStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranOptionsStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranParameterStatement: aFASTFortranParameterStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranParameterStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranPauseStatement: aFASTFortranPauseStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranPauseStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranPointer: aFASTFortranPointer [
	self visitFASTFortranTExpression: aFASTFortranPointer.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranPragmaStatement: aFASTFortranPragmaStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranPragmaStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranPrintStatement: aFASTFortranPrintStatement [
	self visitFASTFortranTWithArguments: aFASTFortranPrintStatement.
	self visitFASTFortranTWithFormatIdentifier: aFASTFortranPrintStatement.
	self visitFASTFortranTLabelledStatement: aFASTFortranPrintStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranProcedure: aFASTFortranProcedure [
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranProgramFile: aFASTFortranProgramFile [
	self visitFASTFortranTWithComments: aFASTFortranProgramFile.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranProgramMain: aFASTFortranProgramMain [
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranProgramUnit: aFASTFortranProgramUnit [
	self visitFASTFortranTEntity: aFASTFortranProgramUnit.
	self visitFASTFortranTNamedBehaviouralEntity: aFASTFortranProgramUnit.
	self visitFASTFortranTWithComments: aFASTFortranProgramUnit.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranReadStatement: aFASTFortranReadStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranReadStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranRealLiteral: aFASTFortranRealLiteral [
	self visitFASTFortranTNumericalLiteral: aFASTFortranRealLiteral.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranRealType: aFASTFortranRealType [
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranRecord: aFASTFortranRecord [
	self visitFASTFortranTExpression: aFASTFortranRecord.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranReturnStatement: aFASTFortranReturnStatement [
	self visitFASTFortranTReturnStatement: aFASTFortranReturnStatement.
	self visitFASTFortranTLabelledStatement: aFASTFortranReturnStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranRewindStatement: aFASTFortranRewindStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranRewindStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranSaveStatement: aFASTFortranSaveStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranSaveStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranScalarVariable: aFASTFortranScalarVariable [
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatementBlock [
	self visitFASTFortranTStatementBlock: aFASTFortranStatementBlock.
	self visitFASTFortranTWithComments: aFASTFortranStatementBlock.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranStaticStatement: aFASTFortranStaticStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranStaticStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranStopStatement: aFASTFortranStopStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranStopStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranStructure: aFASTFortranStructure [
	self visitFASTFortranTExpression: aFASTFortranStructure.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranSubprogram: aFASTFortranSubprogram [
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranSubroutine: aFASTFortranSubroutine [
	self visitFASTFortranTWithParameters: aFASTFortranSubroutine.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranSubstring: aFASTFortranSubstring [
	self visitFASTFortranTExpression: aFASTFortranSubstring.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTAssignment: aFASTFortranTAssignment [
	self visitFASTFortranTExpression: aFASTFortranTAssignment.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTBehaviouralEntity: aFASTFortranTBehaviouralEntity [
	self visitFASTFortranTScopableEntity: aFASTFortranTBehaviouralEntity.
	self visitFASTFortranTWithParameters: aFASTFortranTBehaviouralEntity.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTBooleanLiteral: aFASTFortranTBooleanLiteral [
	self visitFASTFortranTLiteral: aFASTFortranTBooleanLiteral.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTCharacterLiteral: aFASTFortranTCharacterLiteral [
	self visitFASTFortranTLiteral: aFASTFortranTCharacterLiteral.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTComment: aFASTFortranTComment [
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTEntity: aFASTFortranTEntity [
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTEntityCreator: aFASTFortranTEntityCreator [
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTExpression: aFASTFortranTExpression [
	self visitFASTFortranTEntity: aFASTFortranTExpression.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTExpressionStatement: aFASTFortranTExpressionStatement [
	self visitFASTFortranTStatement: aFASTFortranTExpressionStatement.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTFormatIdentifier: aFASTFortranTFormatIdentifier [
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTFortranBinaryExpression: aFASTFortranTFortranBinaryExpression [
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTFortranUnaryExpression: aFASTFortranTFortranUnaryExpression [
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTInvocation: aFASTFortranTInvocation [
	self visitFASTFortranTExpression: aFASTFortranTInvocation.
	self visitFASTFortranTWithArguments: aFASTFortranTInvocation.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTLabelledStatement: aFASTFortranTLabelledStatement [
	self visitFASTFortranTStatement: aFASTFortranTLabelledStatement.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTLiteral: aFASTFortranTLiteral [
	self visitFASTFortranTExpression: aFASTFortranTLiteral.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTNamedBehaviouralEntity: aFASTFortranTNamedBehaviouralEntity [
	self visitFASTFortranTBehaviouralEntity: aFASTFortranTNamedBehaviouralEntity.
	self visitFASTFortranTNamedEntity: aFASTFortranTNamedBehaviouralEntity.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTNamedEntity: aFASTFortranTNamedEntity [
	self visitFASTFortranTEntity: aFASTFortranTNamedEntity.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTNullPointerLiteral: aFASTFortranTNullPointerLiteral [
	self visitFASTFortranTLiteral: aFASTFortranTNullPointerLiteral.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTNumericalLiteral: aFASTFortranTNumericalLiteral [
	self visitFASTFortranTLiteral: aFASTFortranTNumericalLiteral.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTReturnStatement: aFASTFortranTReturnStatement [
	self visitFASTFortranTStatement: aFASTFortranTReturnStatement.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTScopableEntity: aFASTFortranTScopableEntity [
	self visitFASTFortranTEntity: aFASTFortranTScopableEntity.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTStatement: aFASTFortranTStatement [
	self visitFASTFortranTEntity: aFASTFortranTStatement.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTStatementBlock: aFASTFortranTStatementBlock [
	self visitFASTFortranTStatement: aFASTFortranTStatementBlock.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTStringLiteral: aFASTFortranTStringLiteral [
	self visitFASTFortranTLiteral: aFASTFortranTStringLiteral.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTVariableEntity: aFASTFortranTVariableEntity [
	self visitFASTFortranTNamedEntity: aFASTFortranTVariableEntity.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTVariableExpression: aFASTFortranTVariableExpression [
	self visitFASTFortranTExpression: aFASTFortranTVariableExpression.
	self visitFASTFortranTNamedEntity: aFASTFortranTVariableExpression.
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTWithArguments: aFASTFortranTWithArguments [
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTWithComments: aFASTFortranTWithComments [
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTWithFormatIdentifier: aFASTFortranTWithFormatIdentifier [
]

{ #category : #visiting }
FASTFortranVisitor >> visitFASTFortranTWithParameters: aFASTFortranTWithParameters [
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranType: aFASTFortranType [
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranUnaryExpression: aFASTFortranUnaryExpression [
	self visitFASTFortranTExpression: aFASTFortranUnaryExpression.
	self visitFASTFortranTFortranUnaryExpression: aFASTFortranUnaryExpression.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranUnionStatement: aFASTFortranUnionStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranUnionStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranVariable: aFASTFortranVariable [
	self visitFASTFortranTExpression: aFASTFortranVariable.
	self visitFASTFortranTVariableEntity: aFASTFortranVariable.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranVirtualStatement: aFASTFortranVirtualStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranVirtualStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranVolatileStatement: aFASTFortranVolatileStatement [
	self visitFASTFortranTLabelledStatement: aFASTFortranVolatileStatement.
]

{ #category : #'visiting - traits' }
FASTFortranVisitor >> visitFASTFortranWriteStatement: aFASTFortranWriteStatement [
	self visitFASTFortranTWithArguments: aFASTFortranWriteStatement.
	self visitFASTFortranTWithFormatIdentifier: aFASTFortranWriteStatement.
	self visitFASTFortranTLabelledStatement: aFASTFortranWriteStatement.
]
