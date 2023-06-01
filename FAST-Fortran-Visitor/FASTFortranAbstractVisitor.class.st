Class {
	#name : #FASTFortranAbstractVisitor,
	#superclass : #Object,
	#category : #'FAST-Fortran-Visitor'
}

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranAcceptStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranAmpersand: aNode [
	<generated>

	super visitFASTFortranCharacterLiteral: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranArithmeticExpression: aNode [
	<generated>

	super visitFASTFortranExpression: aNode.
	aNode left accept: self.
	aNode right accept: self.
	aNode operator accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranArithmeticLiteral: aNode [
	<generated>

	super visitFASTFortranLiteral: aNode.
	aNode isTyped accept: self.
	aNode isSigned accept: self.
	aNode sign accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranArray: aNode [
	<generated>

	super visitFASTFortranExpression: aNode.
	aNode name accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranArrayDimensionDeclarator: aNode [
	<generated>

	super visitFASTFortranArray: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranAssignmentStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.
	aNode expression accept: self.
	aNode variable accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranAsterisk: aNode [
	<generated>

	super visitFASTFortranCharacterLiteral: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranAutomaticStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranBackspaceStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranBehaviouralEntity: aNode [
	<generated>

	super visitFASTFortranScopableEntity: aNode.
	aNode statementBlock accept: self.
	aNode parameters accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranBlockData: aNode [
	<generated>

	super visitFASTFortranSubprogram: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranBooleanLiteral: aNode [
	<generated>

	super visitFASTFortranLiteral: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranByteType: aNode [
	<generated>

	super visitFASTFortranType: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranCallStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.
	aNode name accept: self.
	aNode arguments accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranCharacterExpression: aNode [
	<generated>

	super visitFASTFortranExpression: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranCharacterLiteral: aNode [
	<generated>

	super visitFASTFortranLiteral: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranCharacterType: aNode [
	<generated>

	super visitFASTFortranType: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranCloseStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranComment: aNode [
	<generated>

	super visitFASTFortranScopableEntity: aNode.
	aNode content accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranCommonStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranComplexLiteral: aNode [
	<generated>

	super visitFASTFortranArithmeticLiteral: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranComplexType: aNode [
	<generated>

	super visitFASTFortranType: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranContinueStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranDataStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranDeclarationStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.
	aNode type accept: self.
	aNode attributes accept: self.
	aNode declarators accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranDecodeStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranDimensionStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranDoStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.
	aNode loopControl accept: self.
	aNode statements accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranDoWhileStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranDoubleComplexLiteral: aNode [
	<generated>

	super visitFASTFortranArithmeticLiteral: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranDoubleComplexType: aNode [
	<generated>

	super visitFASTFortranType: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranDoublePrecisionLiteral: aNode [
	<generated>

	super visitFASTFortranArithmeticLiteral: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranDoublePrecisionType: aNode [
	<generated>

	super visitFASTFortranType: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranElseIfStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranElseStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranEncodeStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranEndDoStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranEndFileStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranEndIfStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranEndMapStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranEndStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranEndStructureStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranEndUnionStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranEntity: aNode [
	<generated>

	aNode startPos accept: self.
	aNode endPos accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranEntryStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranEquivalenceStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranExitStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranExpression: aNode [
	<generated>

	super visitFASTFortranScopableEntity: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranExpressionStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.
	aNode expression accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranExternalStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.
	aNode name accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranFormatStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranFunction: aNode [
	<generated>

	super visitFASTFortranProcedure: aNode.
	aNode parameters accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranFunctionStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.
	aNode name accept: self.
	aNode expression accept: self.
	aNode arguments accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranGoToAssignedStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranGoToComputedStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranGoToStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranGoToUnconditionalStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranIfArithmeticStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranIfBlockStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.
	aNode thenStatements accept: self.
	aNode elseStatements accept: self.
	aNode condition accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranIfLogicalStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.
	aNode condition accept: self.
	aNode statement accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranImplicitStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranIncludeStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranInquireStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranIntegerLiteral: aNode [
	<generated>

	super visitFASTFortranArithmeticLiteral: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranIntegerType: aNode [
	<generated>

	super visitFASTFortranType: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranIntrinsicStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranLiteral: aNode [
	<generated>

	super visitFASTFortranExpression: aNode.
	aNode value accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranLogicalExpression: aNode [
	<generated>

	super visitFASTFortranExpression: aNode.
	aNode left accept: self.
	aNode right accept: self.
	aNode operator accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranLogicalType: aNode [
	<generated>

	super visitFASTFortranType: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranLoopControlExpression: aNode [
	<generated>

	super visitFASTFortranExpression: aNode.
	aNode init accept: self.
	aNode increment accept: self.
	aNode limit accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranMapStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranNameListStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranNamedBehaviouralEntity: aNode [
	<generated>

	super visitFASTFortranBehaviouralEntity: aNode.
	aNode name accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranNullPointerLiteral: aNode [
	<generated>

	super visitFASTFortranLiteral: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranOpenStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranOptionsStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranParameterStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranPauseStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranPointer: aNode [
	<generated>

	super visitFASTFortranExpression: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranPragmaStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranPrintStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.
	aNode format accept: self.
	aNode iolist accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranProcedure: aNode [
	<generated>

	super visitFASTFortranSubprogram: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranProgramMain: aNode [
	<generated>

	super visitFASTFortranProgramUnit: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranProgramUnit: aNode [
	<generated>

	super visitFASTFortranEntity: aNode.
	aNode name accept: self.
	aNode statements accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranReadStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranRealLiteral: aNode [
	<generated>

	super visitFASTFortranArithmeticLiteral: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranRealType: aNode [
	<generated>

	super visitFASTFortranType: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranRecord: aNode [
	<generated>

	super visitFASTFortranExpression: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranRecordField: aNode [
	<generated>

	super visitFASTFortranRecord: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranReturnStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.
	aNode alternateReturnLable accept: self.
	aNode expression accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranRewindStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranSaveStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranScopableEntity: aNode [
	<generated>

	super visitFASTFortranEntity: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranStatement: aNode [
	<generated>

	super visitFASTFortranScopableEntity: aNode.
	aNode label accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranStatementBlock: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.
	aNode statements accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranStaticStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranStopStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.
	aNode displayArgument accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranStringLiteral: aNode [
	<generated>

	super visitFASTFortranLiteral: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranStructure: aNode [
	<generated>

	super visitFASTFortranExpression: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranSubprogram: aNode [
	<generated>

	super visitFASTFortranProgramUnit: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranSubroutine: aNode [
	<generated>

	super visitFASTFortranProcedure: aNode.
	aNode parameters accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranSubstring: aNode [
	<generated>

	super visitFASTFortranExpression: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranType: aNode [
	<generated>

	super visitFASTFortranScopableEntity: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranUnionStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranVariableExpression: aNode [
	<generated>

	super visitFASTFortranExpression: aNode.
	aNode type accept: self.
	aNode value accept: self.
	aNode defined accept: self.
	aNode name accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranVariablesDeclaration: aNode [
	<generated>

	super visitFASTFortranScopableEntity: aNode.
	aNode variables accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranVirtualStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranWriteStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.
	aNode format accept: self.
	aNode iolist accept: self.

]

{ #category : #visiting }
FASTFortranAbstractVisitor >> visitFASTFortranvolatileStatement: aNode [
	<generated>

	super visitFASTFortranStatement: aNode.

]
