"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.
"
Trait {
	#name : #FASTFortranTEntityCreator,
	#category : #'FAST-Fortran-Entities-Model'
}

{ #category : #meta }
FASTFortranTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newAbstractExpression [

	<generated>
	^ self add: FASTFortranAbstractExpression new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newAbstractLiteral [

	<generated>
	^ self add: FASTFortranAbstractLiteral new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newAbstractStatement [

	<generated>
	^ self add: FASTFortranAbstractStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newAcceptStatement [

	<generated>
	^ self add: FASTFortranAcceptStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newAmpersand [

	<generated>
	^ self add: FASTFortranAmpersand new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newArrayDimensionDeclarator [

	<generated>
	^ self add: FASTFortranArrayDimensionDeclarator new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newArrayVariable [

	<generated>
	^ self add: FASTFortranArrayVariable new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newAssignmentExpression [

	<generated>
	^ self add: FASTFortranAssignmentExpression new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newAssignmentStatement [

	<generated>
	^ self add: FASTFortranAssignmentStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newAsterisk [

	<generated>
	^ self add: FASTFortranAsterisk new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newAutomaticStatement [

	<generated>
	^ self add: FASTFortranAutomaticStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newBackspaceStatement [

	<generated>
	^ self add: FASTFortranBackspaceStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newBinaryExpression [

	<generated>
	^ self add: FASTFortranBinaryExpression new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newBlockData [

	<generated>
	^ self add: FASTFortranBlockData new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newBooleanLiteral [

	<generated>
	^ self add: FASTFortranBooleanLiteral new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newByteType [

	<generated>
	^ self add: FASTFortranByteType new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newCallStatement [

	<generated>
	^ self add: FASTFortranCallStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newCharacterLiteral [

	<generated>
	^ self add: FASTFortranCharacterLiteral new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newCharacterType [

	<generated>
	^ self add: FASTFortranCharacterType new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newCloseStatement [

	<generated>
	^ self add: FASTFortranCloseStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newComment [

	<generated>
	^ self add: FASTFortranComment new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newCommonStatement [

	<generated>
	^ self add: FASTFortranCommonStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newComplexLiteral [

	<generated>
	^ self add: FASTFortranComplexLiteral new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newComplexType [

	<generated>
	^ self add: FASTFortranComplexType new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newContinueStatement [

	<generated>
	^ self add: FASTFortranContinueStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newDataGroup [

	<generated>
	^ self add: FASTFortranDataGroup new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newDataStatement [

	<generated>
	^ self add: FASTFortranDataStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newDecodeStatement [

	<generated>
	^ self add: FASTFortranDecodeStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newDimensionStatement [

	<generated>
	^ self add: FASTFortranDimensionStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newDoStatement [

	<generated>
	^ self add: FASTFortranDoStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newDoWhileStatement [

	<generated>
	^ self add: FASTFortranDoWhileStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newDoubleComplexLiteral [

	<generated>
	^ self add: FASTFortranDoubleComplexLiteral new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newDoubleComplexType [

	<generated>
	^ self add: FASTFortranDoubleComplexType new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newDoublePrecisionLiteral [

	<generated>
	^ self add: FASTFortranDoublePrecisionLiteral new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newDoublePrecisionType [

	<generated>
	^ self add: FASTFortranDoublePrecisionType new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newElseStatement [

	<generated>
	^ self add: FASTFortranElseStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newEncodeStatement [

	<generated>
	^ self add: FASTFortranEncodeStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newEndFileStatement [

	<generated>
	^ self add: FASTFortranEndFileStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newEntryStatement [

	<generated>
	^ self add: FASTFortranEntryStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newEquivalenceStatement [

	<generated>
	^ self add: FASTFortranEquivalenceStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newExitStatement [

	<generated>
	^ self add: FASTFortranExitStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newExternalStatement [

	<generated>
	^ self add: FASTFortranExternalStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newFormatStatement [

	<generated>
	^ self add: FASTFortranFormatStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newFunction [

	<generated>
	^ self add: FASTFortranFunction new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newFunctionCall [

	<generated>
	^ self add: FASTFortranFunctionCall new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newFunctionStatement [

	<generated>
	^ self add: FASTFortranFunctionStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newGoToAssignedStatement [

	<generated>
	^ self add: FASTFortranGoToAssignedStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newGoToComputedStatement [

	<generated>
	^ self add: FASTFortranGoToComputedStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newGoToStatement [

	<generated>
	^ self add: FASTFortranGoToStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newGoToUnconditionalStatement [

	<generated>
	^ self add: FASTFortranGoToUnconditionalStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newIfArithmeticStatement [

	<generated>
	^ self add: FASTFortranIfArithmeticStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newIfBlockStatement [

	<generated>
	^ self add: FASTFortranIfBlockStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newIfLogicalStatement [

	<generated>
	^ self add: FASTFortranIfLogicalStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newImplicitStatement [

	<generated>
	^ self add: FASTFortranImplicitStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newIncludeStatement [

	<generated>
	^ self add: FASTFortranIncludeStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newInquireStatement [

	<generated>
	^ self add: FASTFortranInquireStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newIntegerLiteral [

	<generated>
	^ self add: FASTFortranIntegerLiteral new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newIntegerType [

	<generated>
	^ self add: FASTFortranIntegerType new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newIntrinsicStatement [

	<generated>
	^ self add: FASTFortranIntrinsicStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newLabelReference [

	<generated>
	^ self add: FASTFortranLabelReference new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newLogicalType [

	<generated>
	^ self add: FASTFortranLogicalType new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newLoopControlExpression [

	<generated>
	^ self add: FASTFortranLoopControlExpression new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newMapStatement [

	<generated>
	^ self add: FASTFortranMapStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newNameListStatement [

	<generated>
	^ self add: FASTFortranNameListStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newOpenStatement [

	<generated>
	^ self add: FASTFortranOpenStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newOptionsStatement [

	<generated>
	^ self add: FASTFortranOptionsStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newParameterStatement [

	<generated>
	^ self add: FASTFortranParameterStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newPauseStatement [

	<generated>
	^ self add: FASTFortranPauseStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newPragmaStatement [

	<generated>
	^ self add: FASTFortranPragmaStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newPrintStatement [

	<generated>
	^ self add: FASTFortranPrintStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newProcedure [

	<generated>
	^ self add: FASTFortranProcedure new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newProgramFile [

	<generated>
	^ self add: FASTFortranProgramFile new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newProgramMain [

	<generated>
	^ self add: FASTFortranProgramMain new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newProgramUnit [

	<generated>
	^ self add: FASTFortranProgramUnit new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newReadStatement [

	<generated>
	^ self add: FASTFortranReadStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newRealLiteral [

	<generated>
	^ self add: FASTFortranRealLiteral new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newRealType [

	<generated>
	^ self add: FASTFortranRealType new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newReturnStatement [

	<generated>
	^ self add: FASTFortranReturnStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newRewindStatement [

	<generated>
	^ self add: FASTFortranRewindStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newSaveStatement [

	<generated>
	^ self add: FASTFortranSaveStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newScalarVariable [

	<generated>
	^ self add: FASTFortranScalarVariable new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newStatementBlock [

	<generated>
	^ self add: FASTFortranStatementBlock new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newStaticStatement [

	<generated>
	^ self add: FASTFortranStaticStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newStopStatement [

	<generated>
	^ self add: FASTFortranStopStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newSubprogram [

	<generated>
	^ self add: FASTFortranSubprogram new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newSubroutine [

	<generated>
	^ self add: FASTFortranSubroutine new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newSubstring [

	<generated>
	^ self add: FASTFortranSubstring new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newType [

	<generated>
	^ self add: FASTFortranType new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newUnaryExpression [

	<generated>
	^ self add: FASTFortranUnaryExpression new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newUnionStatement [

	<generated>
	^ self add: FASTFortranUnionStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newVariable [

	<generated>
	^ self add: FASTFortranVariable new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newVariableDeclarationStatement [

	<generated>
	^ self add: FASTFortranVariableDeclarationStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newVirtualStatement [

	<generated>
	^ self add: FASTFortranVirtualStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newVolatileStatement [

	<generated>
	^ self add: FASTFortranVolatileStatement new
]

{ #category : #'entity creation' }
FASTFortranTEntityCreator >> newWriteStatement [

	<generated>
	^ self add: FASTFortranWriteStatement new
]
