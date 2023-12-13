Class {
	#name : #FortranToFASTTests,
	#superclass : #AbstractJsonToFASTTests,
	#category : #'FAST-Fortran-Visitors-Tests-Visitor'
}

{ #category : #running }
FortranToFASTTests >> jsonVisitor [

	^ FASTFortranJsonVisitor
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testArrayAccess [
	
	| result stmt arrayAccess |
	fortranCode := '      PROGRAM MYPROG
      integer arr(10)
		v = arr(1,i)
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:21)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"dims":{"anno":[],"list":[{"anno":[],"lower":null,"span":"(2:19)-(2:20)","upper":{"anno":[],"span":"(2:19)-(2:20)","tag":"value","value":{"contents":["10",null],"tag":"integer"}}}],"span":"(2:19)-(2:20)"},"initial":null,"length":null,"span":"(2:15)-(2:21)","type":"array","variable":{"anno":[],"span":"(2:15)-(2:17)","tag":"value","value":{"contents":"arr","tag":"variable"}}}],"span":"(2:15)-(2:21)"},"span":"(2:7)-(2:21)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(2:7)-(2:13)"}},"tag":"statement"},{"anno":[],"label":null,"span":"(3:7)-(3:18)","statement":{"anno":[],"expression":{"anno":[],"expression":{"anno":[],"span":"(3:11)-(3:13)","tag":"value","value":{"contents":"arr","tag":"variable"}},"indices":{"anno":[],"list":[{"anno":[],"index":{"anno":[],"span":"(3:15)-(3:15)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"name":null,"span":"(3:15)-(3:15)","tag":"single"},{"anno":[],"index":{"anno":[],"span":"(3:17)-(3:17)","tag":"value","value":{"contents":"i","tag":"variable"}},"name":null,"span":"(3:17)-(3:17)","tag":"single"}],"span":"(3:15)-(3:17)"},"span":"(3:11)-(3:18)","tag":"subscript"},"span":"(3:7)-(3:18)","tag":"assign_expression","target":{"anno":[],"span":"(3:7)-(3:7)","tag":"value","value":{"contents":"v","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.
	
	stmt := result first statementBlock statements second.
	self assert: stmt class equals: FASTFortranAssignmentStatement.

	arrayAccess := stmt expression.
	self assert: arrayAccess class equals: FASTFortranArrayVariable.
	self assert: arrayAccess name equals: 'arr'.
	self assert: arrayAccess indices size equals: 2.

	self assert: arrayAccess indices first class equals: FASTFortranIntegerLiteral.
	self assert: arrayAccess indices second class equals: FASTFortranScalarVariable.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testArrayDeclaration [
	
	| result stmt declarator |
	fortranCode := '      PROGRAM MYPROG
      integer arr(10)
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:21)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"dims":{"anno":[],"list":[{"anno":[],"lower":null,"span":"(2:19)-(2:20)","upper":{"anno":[],"span":"(2:19)-(2:20)","tag":"value","value":{"contents":["10",null],"tag":"integer"}}}],"span":"(2:19)-(2:20)"},"initial":null,"length":null,"span":"(2:15)-(2:21)","type":"array","variable":{"anno":[],"span":"(2:15)-(2:17)","tag":"value","value":{"contents":"arr","tag":"variable"}}}],"span":"(2:15)-(2:21)"},"span":"(2:7)-(2:21)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(2:7)-(2:13)"}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.
	
	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt declarators size equals: 1.

	declarator := stmt declarators first.
	self assert: declarator variable equals: 'arr'.
	self assert: declarator dimensions size equals: 1.
	self assert: declarator dimensions first class equals: FASTFortranArrayRange. 
	self assert: declarator dimensions first lowerBound equals: nil. 
	self assert: declarator dimensions first upperBound class equals: FASTFortranIntegerLiteral.
	self assert: declarator dimensions first upperBound primitiveValue equals: '10'.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testArrayDeclarationDimensionsWithOperation [
	
	| result stmt declarator |
	fortranCode := '      PROGRAM MYPROG
      integer arr(0:max-1)
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:26)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"dims":{"anno":[],"list":[{"anno":[],"lower":{"anno":[],"span":"(2:19)-(2:19)","tag":"value","value":{"contents":["0",null],"tag":"integer"}},"span":"(2:19)-(2:25)","upper":{"anno":[],"left":{"anno":[],"span":"(2:21)-(2:23)","tag":"value","value":{"contents":"max","tag":"variable"}},"op":{"tag":"subtraction"},"right":{"anno":[],"span":"(2:25)-(2:25)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(2:21)-(2:25)","tag":"binary"}}],"span":"(2:19)-(2:25)"},"initial":null,"length":null,"span":"(2:15)-(2:26)","type":"array","variable":{"anno":[],"span":"(2:15)-(2:17)","tag":"value","value":{"contents":"arr","tag":"variable"}}}],"span":"(2:15)-(2:26)"},"span":"(2:7)-(2:26)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(2:7)-(2:13)"}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.
	
	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt declarators size equals: 1.

	declarator := stmt declarators first.

	self assert: declarator dimensions first lowerBound class equals: FASTFortranIntegerLiteral.
	self assert: declarator dimensions first lowerBound primitiveValue equals: '0'.

	self assert: declarator dimensions first upperBound class equals: FASTFortranBinaryExpression.
	self assert: declarator dimensions first upperBound left class equals: FASTFortranScalarVariable.
	self assert: declarator dimensions first upperBound left name equals: 'max'.

	self assert: declarator dimensions first upperBound operator equals: '-'.

	self assert: declarator dimensions first upperBound right class equals: FASTFortranIntegerLiteral.
	self assert: declarator dimensions first upperBound right primitiveValue equals: '1'.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testArrayDeclarationImplicitLower [
	
	| result stmt declarator |
	fortranCode := '      PROGRAM MYPROG
      integer arr(-5:5)
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:23)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"dims":{"anno":[],"list":[{"anno":[],"lower":{"anno":[],"expression":{"anno":[],"span":"(2:20)-(2:20)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"minus"},"span":"(2:19)-(2:20)","tag":"unary"},"span":"(2:19)-(2:22)","upper":{"anno":[],"span":"(2:22)-(2:22)","tag":"value","value":{"contents":["5",null],"tag":"integer"}}}],"span":"(2:19)-(2:22)"},"initial":null,"length":null,"span":"(2:15)-(2:23)","type":"array","variable":{"anno":[],"span":"(2:15)-(2:17)","tag":"value","value":{"contents":"arr","tag":"variable"}}}],"span":"(2:15)-(2:23)"},"span":"(2:7)-(2:23)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(2:7)-(2:13)"}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.
	
	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt declarators size equals: 1.

	declarator := stmt declarators first.
	self assert: declarator variable equals: 'arr'.
	self assert: declarator dimensions size equals: 1.
	self assert: declarator dimensions first lowerBound class equals: FASTFortranIntegerLiteral.
	self assert: declarator dimensions first lowerBound primitiveValue equals: '-5'.
	self assert: declarator dimensions first upperBound class equals: FASTFortranIntegerLiteral.
	self assert: declarator dimensions first upperBound primitiveValue equals: '5'.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testArrayDeclarationMultipleDimensions [
	
	| result stmt declarator |
	fortranCode := '      PROGRAM MYPROG
      integer arr(1:10 , 0:5)
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:29)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"dims":{"anno":[],"list":[{"anno":[],"lower":{"anno":[],"span":"(2:19)-(2:19)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(2:19)-(2:22)","upper":{"anno":[],"span":"(2:21)-(2:22)","tag":"value","value":{"contents":["10",null],"tag":"integer"}}},{"anno":[],"lower":{"anno":[],"span":"(2:26)-(2:26)","tag":"value","value":{"contents":["0",null],"tag":"integer"}},"span":"(2:26)-(2:28)","upper":{"anno":[],"span":"(2:28)-(2:28)","tag":"value","value":{"contents":["5",null],"tag":"integer"}}}],"span":"(2:19)-(2:28)"},"initial":null,"length":null,"span":"(2:15)-(2:29)","type":"array","variable":{"anno":[],"span":"(2:15)-(2:17)","tag":"value","value":{"contents":"arr","tag":"variable"}}}],"span":"(2:15)-(2:29)"},"span":"(2:7)-(2:29)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(2:7)-(2:13)"}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.
	
	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt declarators size equals: 1.

	declarator := stmt declarators first.
	self assert: declarator variable equals: 'arr'.
	self assert: declarator dimensions size equals: 2.

	self assert: declarator dimensions first lowerBound primitiveValue equals: '1'.
	self assert: declarator dimensions first upperBound primitiveValue equals: '10'.

	self assert: declarator dimensions second lowerBound primitiveValue equals: '0'.
	self assert: declarator dimensions second upperBound primitiveValue equals: '5'.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testArrayDeclarationVariableBound [
	
	| result stmt declarator |
	fortranCode := '      PROGRAM MYPROG
      integer arr(max)
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:22)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"dims":{"anno":[],"list":[{"anno":[],"lower":null,"span":"(2:19)-(2:21)","upper":{"anno":[],"span":"(2:19)-(2:21)","tag":"value","value":{"contents":"max","tag":"variable"}}}],"span":"(2:19)-(2:21)"},"initial":null,"length":null,"span":"(2:15)-(2:22)","type":"array","variable":{"anno":[],"span":"(2:15)-(2:17)","tag":"value","value":{"contents":"arr","tag":"variable"}}}],"span":"(2:15)-(2:22)"},"span":"(2:7)-(2:22)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(2:7)-(2:13)"}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.
	
	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt declarators size equals: 1.

	declarator := stmt declarators first.
	self assert: declarator variable equals: 'arr'.
	self assert: declarator dimensions size equals: 1.
	self assert: declarator dimensions first class equals: FASTFortranArrayRange. 
	self assert: declarator dimensions first lowerBound equals: nil. 
	self assert: declarator dimensions first upperBound class equals: FASTFortranScalarVariable.
	self assert: declarator dimensions first upperBound name equals: 'max'.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testAssignement [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
          c = 1
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:11)-(2:15)","statement":{"anno":[],"expression":{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(2:11)-(2:15)","tag":"assign_expression","target":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 36.


	self assert: stmt variable class equals: FASTFortranScalarVariable.
	self assert: stmt variable name equals: 'c'.
]

{ #category : #'tests-expression' }
FortranToFASTTests >> testAssignementBooleanLiteral [

	| stmt main result |
	fortranCode := '      PROGRAM MYPROG
          c = .true.
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:11)-(2:20)","statement":{"anno":[],"expression":{"anno":[],"span":"(2:15)-(2:20)","tag":"value","value":{"contents":[true,null],"tag":"logical"}},"span":"(2:11)-(2:20)","tag":"assign_expression","target":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.
	
	main := result first.
	self assert: main class equals: FASTFortranProgramMain.
	self assert: main statementBlock class equals: FASTFortranStatementBlock.
	
	stmt := main statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.
	self assert: stmt startPos equals: 32.

	self assert: stmt expression class equals: FASTFortranBooleanLiteral.
	self assert: stmt expression primitiveValue equals: '.true.'.
	self assert: stmt expression startPos equals: 36.

]

{ #category : #'tests-expression' }
FortranToFASTTests >> testAssignementFunctionCall [

	| stmt main result |
	fortranCode := '      PROGRAM MYPROG
          c = fct()
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:11)-(2:19)","statement":{"anno":[],"expression":{"anno":[],"arguments":{"anno":[],"list":[],"span":"(2:18)-(2:19)"},"function":{"anno":[],"span":"(2:15)-(2:17)","tag":"value","value":{"contents":"fct","tag":"variable"}},"span":"(2:15)-(2:19)","tag":"function_call"},"span":"(2:11)-(2:19)","tag":"assign_expression","target":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.
	
	main := result first.
	self assert: main class equals: FASTFortranProgramMain.
	self assert: main statementBlock class equals: FASTFortranStatementBlock.
	
	stmt := main statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.
	self assert: stmt startPos equals: 32.

	self assert: stmt expression class equals: FASTFortranFunctionCall.
	self assert: stmt expression name equals: 'fct'.
	self assert: stmt expression startPos equals: 36.

]

{ #category : #'tests-expression' }
FortranToFASTTests >> testAssignementIntegerLiteral [

	| stmt main result |
	fortranCode := '      PROGRAM MYPROG
          c = 1
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:11)-(2:15)","statement":{"anno":[],"expression":{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(2:11)-(2:15)","tag":"assign_expression","target":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.
	
	main := result first.
	self assert: main class equals: FASTFortranProgramMain.
	self assert: main statementBlock class equals: FASTFortranStatementBlock.
	
	stmt := main statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.
	self assert: stmt startPos equals: 32.

	self assert: stmt expression class equals: FASTFortranIntegerLiteral.
	self assert: stmt expression primitiveValue equals: '1'.
	self assert: stmt expression startPos equals: 36.

]

{ #category : #'tests-expression' }
FortranToFASTTests >> testAssignementNegativeIntegerLiteral [

	| stmt result |
	fortranCode := '      PROGRAM MYPROG
          c = -1
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:11)-(2:16)","statement":{"anno":[],"expression":{"anno":[],"expression":{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"op":{"tag":"minus"},"span":"(2:15)-(2:16)","tag":"unary"},"span":"(2:11)-(2:16)","tag":"assign_expression","target":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.
	
	stmt := result first statementBlock statements first.

	self assert: stmt expression class equals: FASTFortranIntegerLiteral.
	self assert: stmt expression primitiveValue equals: '-1'.

]

{ #category : #'tests-expression' }
FortranToFASTTests >> testAssignementNegativeRealLiteral [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
          c = -2.12
      END
'.

	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:11)-(2:19)","statement":{"anno":[],"expression":{"anno":[],"expression":{"anno":[],"span":"(2:16)-(2:19)","tag":"value","value":{"contents":[{"exponent":{"letter":"e","num":"0"},"significand":"2.12"},null],"tag":"real"}},"op":{"tag":"minus"},"span":"(2:15)-(2:19)","tag":"unary"},"span":"(2:11)-(2:19)","tag":"assign_expression","target":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.

	self assert: stmt expression class equals: FASTFortranRealLiteral.
	self assert: stmt expression primitiveValue equals: '-2.12'
]

{ #category : #'tests-expression' }
FortranToFASTTests >> testAssignementRealLiteral [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
          c = 2.12
      END
'.

	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:11)-(2:18)","statement":{"anno":[],"expression":{"anno":[],"span":"(2:15)-(2:18)","tag":"value","value":{"contents":[{"exponent":{"letter":"e","num":"0"},"significand":"2.12"},null],"tag":"real"}},"span":"(2:11)-(2:18)","tag":"assign_expression","target":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.
	self assert: stmt startPos equals: 32.

	self assert: stmt expression class equals: FASTFortranRealLiteral.
	self assert: stmt expression primitiveValue equals: '2.12'.
	self assert: stmt expression startPos equals: 36.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testAssignementScientificNotation [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
          c = 1.0E-30
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:11)-(2:21)","statement":{"anno":[],"expression":{"anno":[],"span":"(2:15)-(2:21)","tag":"value","value":{"contents":[{"exponent":{"letter":"e","num":"-30"},"significand":"1.0"},null],"tag":"real"}},"span":"(2:11)-(2:21)","tag":"assign_expression","target":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.
	self assert: stmt startPos equals: 32.


	self assert: stmt expression class equals: FASTFortranRealLiteral.
	self assert: stmt expression primitiveValue equals: '1.0e-30'.
]

{ #category : #'tests-expression' }
FortranToFASTTests >> testAssignementStringLiteral [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
          c = ''once upon a time there were ''''quotes''''! ''
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:11)-(2:56)","statement":{"anno":[],"expression":{"anno":[],"span":"(2:15)-(2:56)","tag":"value","value":{"contents":"once upon a time there were ''quotes''! ","tag":"string"}},"span":"(2:11)-(2:56)","tag":"assign_expression","target":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.
	self assert: stmt startPos equals: 32.

	self assert: stmt expression class equals: FASTFortranCharacterLiteral.
	self assert: stmt expression primitiveValue equals: 'once upon a time there were ''''quotes''''! '.
	self assert: stmt expression startPos equals: 36.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testAssignementToArrayRange [

	| result stmt var |
	fortranCode := '      PROGRAM MYPROG
      NOMARC(1:1) = ''c''
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:23)","statement":{"anno":[],"expression":{"anno":[],"span":"(2:21)-(2:23)","tag":"value","value":{"contents":"c","tag":"string"}},"span":"(2:7)-(2:23)","tag":"assign_expression","target":{"anno":[],"expression":{"anno":[],"span":"(2:7)-(2:12)","tag":"value","value":{"contents":"nomarc","tag":"variable"}},"indices":{"anno":[],"list":[{"anno":[],"lower":{"anno":[],"span":"(2:14)-(2:14)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(2:14)-(2:16)","stride":null,"tag":"range","upper":{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"contents":["1",null],"tag":"integer"}}}],"span":"(2:14)-(2:16)"},"span":"(2:7)-(2:17)","tag":"subscript"}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.

	var := stmt variable.
	self assert: var class equals: FASTFortranArrayVariable.
	self assert: var indices size equals: 1.
	self assert: var indices first class equals: FASTFortranArrayRange.


	self assert: var indices first lowerBound class equals: FASTFortranIntegerLiteral.
	self assert: var indices first lowerBound primitiveValue equals: '1'.
	self assert: var indices first upperBound class equals: FASTFortranIntegerLiteral.
	self assert: var indices first upperBound primitiveValue equals: '1'.
	self assert: var indices first startPos equals: 35.
	self assert: var indices first endPos equals: 37.
]

{ #category : #'tests-expression' }
FortranToFASTTests >> testBinaryExpressionDivision [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       i = 5 / 6
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:16)","statement":{"anno":[],"expression":{"anno":[],"left":{"anno":[],"span":"(2:12)-(2:12)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"division"},"right":{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:12)-(2:16)","tag":"binary"},"span":"(2:8)-(2:16)","tag":"assign_expression","target":{"anno":[],"span":"(2:8)-(2:8)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	asnmt := result first statementBlock statements first.
	self assert: asnmt class equals: FASTFortranAssignmentStatement.

	expr := asnmt expression.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '/'.
	self assert: expr startPos equals: 33.

	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr left startPos equals: 33.

	self assert: expr right class equals: FASTFortranIntegerLiteral.
	self assert: expr right startPos equals: 37.
]

{ #category : #'tests-expression' }
FortranToFASTTests >> testBinaryExpressionEqKeyword [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       IF ( 5 .eq. 6 ) THEN
       END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"left":{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"eq"},"right":{"anno":[],"span":"(2:20)-(2:20)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:13)-(2:20)","tag":"binary"},[]]],"end_label":null,"label":null,"name":null,"span":"(2:8)-(3:13)","tag":"if"}],"name":"myprog","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	asnmt := result first statementBlock statements first.
	self assert: asnmt class equals: FASTFortranIfBlockStatement.

	expr := asnmt condition.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '.eq.'.
	self assert: expr startPos equals: 34.

	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr left primitiveValue equals: '5'.
	self assert: expr left startPos equals: 34.

	self assert: expr right class equals: FASTFortranIntegerLiteral.
	self assert: expr right primitiveValue equals: '6'.
	self assert: expr right startPos equals: 41.
]

{ #category : #'tests-expression' }
FortranToFASTTests >> testBinaryExpressionExponentiation [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       i = 5 ** 6
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:17)","statement":{"anno":[],"expression":{"anno":[],"left":{"anno":[],"span":"(2:12)-(2:12)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"exponentiation"},"right":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:12)-(2:17)","tag":"binary"},"span":"(2:8)-(2:17)","tag":"assign_expression","target":{"anno":[],"span":"(2:8)-(2:8)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.
	
	asnmt := result first statementBlock statements first.
	self assert: asnmt class equals: FASTFortranAssignmentStatement.

	expr := asnmt expression.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '**'.
	self assert: expr startPos equals: 33.

	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr left startPos equals: 33.

	self assert: expr right class equals: FASTFortranIntegerLiteral.
	self assert: expr right startPos equals: 38.
	
]

{ #category : #'tests-expression' }
FortranToFASTTests >> testBinaryExpressionGtKeyword [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       IF ( 5 .gt. 6 ) THEN
       END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"left":{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"gt"},"right":{"anno":[],"span":"(2:20)-(2:20)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:13)-(2:20)","tag":"binary"},[]]],"end_label":null,"label":null,"name":null,"span":"(2:8)-(3:13)","tag":"if"}],"name":"myprog","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	asnmt := result first statementBlock statements first.
	self assert: asnmt class equals: FASTFortranIfBlockStatement.

	expr := asnmt condition.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '.gt.'.
	self assert: expr startPos equals: 34.

	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr left primitiveValue equals: '5'.
	self assert: expr left startPos equals: 34.

	self assert: expr right class equals: FASTFortranIntegerLiteral.
	self assert: expr right primitiveValue equals: '6'.
	self assert: expr right startPos equals: 41.
]

{ #category : #'tests-expression' }
FortranToFASTTests >> testBinaryExpressionGtSymbol [
	"Note: not valid in Fortran 77"

	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       IF ( 5 > 6 ) THEN
       END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"left":{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"gt"},"right":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:13)-(2:17)","tag":"binary"},[]]],"end_label":null,"label":null,"name":null,"span":"(2:8)-(3:13)","tag":"if"}],"name":"myprog","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	asnmt := result first statementBlock statements first.
	self assert: asnmt class equals: FASTFortranIfBlockStatement.

	expr := asnmt condition.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '.gt.'.
	self assert: expr startPos equals: 34.

	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr left primitiveValue equals: '5'.
	self assert: expr left startPos equals: 34.

	self assert: expr right class equals: FASTFortranIntegerLiteral.
	self assert: expr right primitiveValue equals: '6'.
	self assert: expr right startPos equals: 38.
]

{ #category : #'tests-expression' }
FortranToFASTTests >> testBinaryExpressionGteKeyword [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       IF ( 5 .ge. 6 ) THEN
       END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"FastTmp/tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"left":{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"gte"},"right":{"anno":[],"span":"(2:20)-(2:20)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:13)-(2:20)","tag":"binary"},[]]],"end_label":null,"label":null,"name":null,"span":"(2:8)-(3:13)","tag":"if"}],"name":"myprog","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	asnmt := result first statementBlock statements first.
	self assert: asnmt class equals: FASTFortranIfBlockStatement.

	expr := asnmt condition.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '.ge.'.
	self assert: expr startPos equals: 34.

	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr left primitiveValue equals: '5'.
	self assert: expr left startPos equals: 34.

	self assert: expr right class equals: FASTFortranIntegerLiteral.
	self assert: expr right primitiveValue equals: '6'.
	self assert: expr right startPos equals: 41.
]

{ #category : #'tests-expression' }
FortranToFASTTests >> testBinaryExpressionLtKeyword [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       IF ( 5 .Lt. 6 ) THEN
       END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"left":{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"lt"},"right":{"anno":[],"span":"(2:20)-(2:20)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:13)-(2:20)","tag":"binary"},[]]],"end_label":null,"label":null,"name":null,"span":"(2:8)-(3:13)","tag":"if"}],"name":"myprog","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	asnmt := result first statementBlock statements first.
	self assert: asnmt class equals: FASTFortranIfBlockStatement.

	expr := asnmt condition.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '.lt.'.
	self assert: expr startPos equals: 34.

	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr left primitiveValue equals: '5'.
	self assert: expr left startPos equals: 34.

	self assert: expr right class equals: FASTFortranIntegerLiteral.
	self assert: expr right primitiveValue equals: '6'.
	self assert: expr right startPos equals: 41.
]

{ #category : #'tests-expression' }
FortranToFASTTests >> testBinaryExpressionLtSymbol [
	"Note: not valid in Fortran 77"

	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       IF ( 5 < 6 ) THEN
       END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"left":{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"lt"},"right":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:13)-(2:17)","tag":"binary"},[]]],"end_label":null,"label":null,"name":null,"span":"(2:8)-(3:13)","tag":"if"}],"name":"myprog","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	asnmt := result first statementBlock statements first.
	self assert: asnmt class equals: FASTFortranIfBlockStatement.

	expr := asnmt condition.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '.lt.'.
	self assert: expr startPos equals: 34.

	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr left primitiveValue equals: '5'.
	self assert: expr left startPos equals: 34.

	self assert: expr right class equals: FASTFortranIntegerLiteral.
	self assert: expr right primitiveValue equals: '6'.
	self assert: expr right startPos equals: 38
]

{ #category : #'tests-expression' }
FortranToFASTTests >> testBinaryExpressionLteKeyword [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       IF ( 5 .LE. 6 ) THEN
       END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"left":{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"lte"},"right":{"anno":[],"span":"(2:20)-(2:20)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:13)-(2:20)","tag":"binary"},[]]],"end_label":null,"label":null,"name":null,"span":"(2:8)-(3:13)","tag":"if"}],"name":"myprog","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	asnmt := result first statementBlock statements first.
	self assert: asnmt class equals: FASTFortranIfBlockStatement.

	expr := asnmt condition.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '.le.'.
	self assert: expr startPos equals: 34.

	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr left primitiveValue equals: '5'.
	self assert: expr left startPos equals: 34.

	self assert: expr right class equals: FASTFortranIntegerLiteral.
	self assert: expr right primitiveValue equals: '6'.
	self assert: expr right startPos equals: 41.
]

{ #category : #'tests-expression' }
FortranToFASTTests >> testBinaryExpressionMultiplication [

	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       i = 5 * 6
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:16)","statement":{"anno":[],"expression":{"anno":[],"left":{"anno":[],"span":"(2:12)-(2:12)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"multiplication"},"right":{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:12)-(2:16)","tag":"binary"},"span":"(2:8)-(2:16)","tag":"assign_expression","target":{"anno":[],"span":"(2:8)-(2:8)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	asnmt := result first statementBlock statements first.
	self assert: asnmt class equals: FASTFortranAssignmentStatement.

	expr := asnmt expression.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '*'.
	self assert: expr startPos equals: 33.

	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr left startPos equals: 33.

	self assert: expr right class equals: FASTFortranIntegerLiteral.
	self assert: expr right startPos equals: 37.
]

{ #category : #'tests-expression' }
FortranToFASTTests >> testBinaryExpressionNeKeyword [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       IF ( 5 .ne. 6 ) THEN
       END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"left":{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"ne"},"right":{"anno":[],"span":"(2:20)-(2:20)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:13)-(2:20)","tag":"binary"},[]]],"end_label":null,"label":null,"name":null,"span":"(2:8)-(3:13)","tag":"if"}],"name":"myprog","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	asnmt := result first statementBlock statements first.
	self assert: asnmt class equals: FASTFortranIfBlockStatement.

	expr := asnmt condition.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '.ne.'.
	self assert: expr startPos equals: 34.

	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr left primitiveValue equals: '5'.
	self assert: expr left startPos equals: 34.

	self assert: expr right class equals: FASTFortranIntegerLiteral.
	self assert: expr right primitiveValue equals: '6'.
	self assert: expr right startPos equals: 41.
]

{ #category : #'tests-expression' }
FortranToFASTTests >> testBinaryExpressionSubstraction [
	
	| result expr |
	fortranCode := '      PROGRAM MYPROG
       i = max-1
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:16)","statement":{"anno":[],"expression":{"anno":[],"left":{"anno":[],"span":"(2:12)-(2:14)","tag":"value","value":{"contents":"max","tag":"variable"}},"op":{"tag":"subtraction"},"right":{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(2:12)-(2:16)","tag":"binary"},"span":"(2:8)-(2:16)","tag":"assign_expression","target":{"anno":[],"span":"(2:8)-(2:8)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	expr := result first statementBlock statements first expression.

	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: '-'.
	self assert: expr startPos equals: 33.

	self assert: expr left class equals: FASTFortranScalarVariable.
	self assert: expr left name equals: 'max'.
	self assert: expr left startPos equals: 33.

	self assert: expr right class equals: FASTFortranIntegerLiteral.
	self assert: expr right primitiveValue equals: '1'.
	self assert: expr right startPos equals: 37.

]

{ #category : #'tests-expression' }
FortranToFASTTests >> testBinaryExpressionUnaryMinus [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       i = -i
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:13)","statement":{"anno":[],"expression":{"anno":[],"expression":{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":"i","tag":"variable"}},"op":{"tag":"minus"},"span":"(2:12)-(2:13)","tag":"unary"},"span":"(2:8)-(2:13)","tag":"assign_expression","target":{"anno":[],"span":"(2:8)-(2:8)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	asnmt := result first statementBlock statements first.
	self assert: asnmt class equals: FASTFortranAssignmentStatement.	
	
	expr := asnmt expression.
	self assert: expr class equals: FASTFortranUnaryExpression.
	self assert: expr operator equals: '-'.
	self assert: expr startPos equals: 33.

	self assert: expr expression class equals: FASTFortranScalarVariable.
	self assert: expr expression name equals: 'i'.

]

{ #category : #'tests-programUnit' }
FortranToFASTTests >> testBlockData [
	| result bd |

	fortranCode := '      block data myblck
      common /mycom/ i
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:22)","statement":{"anno":[],"common_groups":{"anno":[],"list":[{"anno":[],"name":{"anno":[],"span":"(2:14)-(2:20)","tag":"value","value":{"contents":"mycom","tag":"variable"}},"span":"(2:14)-(2:22)","vars":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:22)-(2:22)","type":"scalar","variable":{"anno":[],"span":"(2:22)-(2:22)","tag":"value","value":{"contents":"i","tag":"variable"}}}],"span":"(2:22)-(2:22)"}}],"span":"(2:14)-(2:22)"},"span":"(2:7)-(2:22)","tag":"common"},"tag":"statement"}],"name":"myblck","span":"(1:7)-(3:9)","tag":"block_data"}]}'.
	result := self visitJsonCode.

	bd := result first.
	self assert: bd class equals: FASTFortranBlockData.
	self assert: bd name equals: 'myblck'.
	self assert: bd startPos equals: 7.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testCallSubroutine [

	| result call arg |
	fortranCode := '      PROGRAM TESTALT
       CALL RANK ( N, *8 )
      END 
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:26)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"expr":{"contents":{"anno":[],"span":"(2:20)-(2:20)","tag":"value","value":{"contents":"n","tag":"variable"}},"tag":"expr"},"name":null,"span":"(2:20)-(2:20)"},{"anno":[],"expr":{"contents":{"anno":[],"span":"(2:23)-(2:24)","tag":"return_spec","target":{"anno":[],"span":"(2:24)-(2:24)","tag":"value","value":{"contents":["8",null],"tag":"integer"}}},"tag":"expr"},"name":null,"span":"(2:23)-(2:24)"}],"span":"(2:18)-(2:26)"},"function":{"anno":[],"span":"(2:13)-(2:16)","tag":"value","value":{"contents":"rank","tag":"variable"}},"span":"(2:8)-(2:26)","tag":"call"},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first class equals: FASTFortranProgramMain.

	self assert: result first statementBlock statements size equals: 1.

	call := result first statementBlock statements anyOne.
	self assert: call class equals: FASTFortranCallStatement.
	self assert: call name equals: 'rank'.
	self assert: call arguments size equals: 2.
	self assert: call startPos equals: 30.
	self assert: call endPos equals: 48.


	arg := call arguments first.
	self assert: arg class equals: FASTFortranScalarVariable.
	self assert: arg name equals: 'n'.

	arg := call arguments second.
	self assert: arg class equals: FASTFortranIntegerLiteral.
	self assert: arg primitiveValue equals: '8'.
	self flag: 'what happened to "*" ("*8")?'

]

{ #category : #tests }
FortranToFASTTests >> testComment [

	| result cmt |
	fortranCode := '      integer function aFct()
C comment in a function''s body
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"fortran77.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"comment":" comment in a function''s body","span":"(2:1)-(2:30)","tag":"comment"}],"name":"afct","result":null,"span":"(1:7)-(3:9)","subprograms":null,"tag":"function","type":{"anno":[],"base_type":"integer","selector":null,"span":"(1:7)-(1:13)"}}]}'.
	result := self visitJsonCode.

	cmt := result first statementBlock comments anyOne.
	self assert: cmt content equals: 'C comment in a function''s body'.
	self assert: cmt startPos equals: 31.
	self assert: cmt endPos equals: 60.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testCommonStatementMultipleGroups [

	| result stmt commonGroup |
	fortranCode := '      program simplemain
      COMMON / name1 / var1, var2 / name2 / var3, var4
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:53)","statement":{"anno":[],"common_groups":{"anno":[],"list":[{"anno":[],"name":{"anno":[],"span":"(2:13)-(2:21)","tag":"value","value":{"contents":"name1","tag":"variable"}},"span":"(2:13)-(2:32)","vars":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:23)-(2:26)","type":"scalar","variable":{"anno":[],"span":"(2:23)-(2:26)","tag":"value","value":{"contents":"var1","tag":"variable"}}},{"anno":[],"initial":null,"length":null,"span":"(2:29)-(2:32)","type":"scalar","variable":{"anno":[],"span":"(2:29)-(2:32)","tag":"value","value":{"contents":"var2","tag":"variable"}}}],"span":"(2:23)-(2:32)"}},{"anno":[],"name":{"anno":[],"span":"(2:34)-(2:42)","tag":"value","value":{"contents":"name2","tag":"variable"}},"span":"(2:34)-(2:53)","vars":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:44)-(2:47)","type":"scalar","variable":{"anno":[],"span":"(2:44)-(2:47)","tag":"value","value":{"contents":"var3","tag":"variable"}}},{"anno":[],"initial":null,"length":null,"span":"(2:50)-(2:53)","type":"scalar","variable":{"anno":[],"span":"(2:50)-(2:53)","tag":"value","value":{"contents":"var4","tag":"variable"}}}],"span":"(2:44)-(2:53)"}}],"span":"(2:13)-(2:53)"},"span":"(2:7)-(2:53)","tag":"common"},"tag":"statement"}],"name":"simplemain","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranCommonStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 78.

	self assert: stmt groups size equals: 2.

	commonGroup := stmt groups first.
	self assert: commonGroup name equals: 'name1'.
	self assert: commonGroup declarators size equals: 2.

	commonGroup := stmt groups second.
	self assert: commonGroup name equals: 'name2'.
	self assert: commonGroup declarators size equals: 2.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testCommonStatementNamed [

	| result stmt commonGroup |
	fortranCode := '      program simplemain
      COMMON / name / var1, var2
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:32)","statement":{"anno":[],"common_groups":{"anno":[],"list":[{"anno":[],"name":{"anno":[],"span":"(2:14)-(2:21)","tag":"value","value":{"contents":"name","tag":"variable"}},"span":"(2:14)-(2:32)","vars":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:23)-(2:26)","type":"scalar","variable":{"anno":[],"span":"(2:23)-(2:26)","tag":"value","value":{"contents":"var1","tag":"variable"}}},{"anno":[],"initial":null,"length":null,"span":"(2:29)-(2:32)","type":"scalar","variable":{"anno":[],"span":"(2:29)-(2:32)","tag":"value","value":{"contents":"var2","tag":"variable"}}}],"span":"(2:23)-(2:32)"}}],"span":"(2:14)-(2:32)"},"span":"(2:7)-(2:32)","tag":"common"},"tag":"statement"}],"name":"simplemain","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranCommonStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 57.

	self assert: stmt groups size equals: 1.

	commonGroup := stmt groups first.
	self assert: commonGroup name equals: 'name'.
	self assert: commonGroup declarators size equals: 2.
	self assert: commonGroup declarators first startPos equals: 48.
	self assert: commonGroup declarators second startPos equals: 54.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testCommonStatementNoName [

	| result stmt commonGroup |
	fortranCode := '      program simplemain
      COMMON var1, var2
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:23)","statement":{"anno":[],"common_groups":{"anno":[],"list":[{"anno":[],"name":null,"span":"(2:14)-(2:23)","vars":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:14)-(2:17)","type":"scalar","variable":{"anno":[],"span":"(2:14)-(2:17)","tag":"value","value":{"contents":"var1","tag":"variable"}}},{"anno":[],"initial":null,"length":null,"span":"(2:20)-(2:23)","type":"scalar","variable":{"anno":[],"span":"(2:20)-(2:23)","tag":"value","value":{"contents":"var2","tag":"variable"}}}],"span":"(2:14)-(2:23)"}}],"span":"(2:14)-(2:23)"},"span":"(2:7)-(2:23)","tag":"common"},"tag":"statement"}],"name":"simplemain","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranCommonStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 48.

	self assert: stmt groups size equals: 1.

	commonGroup := stmt groups first.
	self assert: commonGroup name equals: nil.
	self assert: commonGroup declarators size equals: 2.

	self assert: commonGroup declarators first class equals: FASTFortranVariableDeclarator.
	self assert: commonGroup declarators first variable equals: 'var1'.
	self assert: commonGroup declarators first startPos equals: 39.

	self assert: commonGroup declarators second class equals: FASTFortranVariableDeclarator.
	self assert: commonGroup declarators second variable equals: 'var2'.
	self assert: commonGroup declarators second startPos equals: 45.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testContinueStatement [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
110   CONTINUE
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":{"anno":[],"span":"(2:1)-(2:3)","tag":"value","value":{"contents":["110",null],"tag":"integer"}},"span":"(2:1)-(2:14)","statement":{"anno":[],"span":"(2:7)-(2:14)","tag":"continue"},"tag":"statement"}],"name":"simplemain","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranContinueStatement.
	self assert: stmt startPos equals: 28.
	self assert: stmt endPos equals: 35.

	self assert: stmt label equals: '110'.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testDataStatement [

	| result stmt dataGroup |
	fortranCode := '      program simplemain
      DATA chaine1, chaine2  /''Blah'' , ''Deux'' / , chaine3 / ''Encore'' /
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:47)","statement":{"anno":[],"data_groups":{"anno":[],"list":[{"anno":[],"initializers":{"anno":[],"list":[{"anno":[],"span":"(2:31)-(2:36)","tag":"value","value":{"contents":"Blah","tag":"string"}},{"anno":[],"span":"(2:40)-(2:45)","tag":"value","value":{"contents":"Deux","tag":"string"}}],"span":"(2:31)-(2:45)"},"names":{"anno":[],"list":[{"anno":[],"span":"(2:12)-(2:18)","tag":"value","value":{"contents":"chaine1","tag":"variable"}},{"anno":[],"span":"(2:21)-(2:27)","tag":"value","value":{"contents":"chaine2","tag":"variable"}}],"span":"(2:12)-(2:27)"},"span":"(2:12)-(2:47)"},{"anno":[],"initializers":{"anno":[],"list":[{"anno":[],"span":"(2:61)-(2:68)","tag":"value","value":{"contents":"Encore","tag":"string"}}],"span":"(2:61)-(2:68)"},"names":{"anno":[],"list":[{"anno":[],"span":"(2:51)-(2:57)","tag":"value","value":{"contents":"chaine3","tag":"variable"}}],"span":"(2:51)-(2:57)"},"span":"(2:51)-(2:70)"}],"span":"(2:12)-(2:70)"},"span":"(2:7)-(2:47)","tag":"data"},"tag":"statement"}],"name":"simplemain","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDataStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 95.

	self assert: stmt variableGroups size equals: 2.

	dataGroup := stmt variableGroups first.
	self assert: dataGroup variables size equals: 2.
	self assert: dataGroup variables first class equals: FASTFortranScalarVariable.
	self assert: dataGroup variables first name equals: 'chaine1'.
	self assert: dataGroup variables first startPos equals: 37.

	self assert: dataGroup dataConstants size equals: 2.
	self assert: dataGroup dataConstants first class equals: FASTFortranCharacterLiteral.
	self assert: dataGroup dataConstants first primitiveValue equals: 'Blah'.
	self assert: dataGroup dataConstants first startPos equals: 56.

	dataGroup := stmt variableGroups second.
	self assert: dataGroup variables size equals: 1.
	self assert: dataGroup variables first class equals: FASTFortranScalarVariable.
	self assert: dataGroup variables first name equals: 'chaine3'.
	self assert: dataGroup variables first startPos equals: 76.

	self assert: dataGroup dataConstants size equals: 1.
	self assert: dataGroup dataConstants first class equals: FASTFortranCharacterLiteral.
	self assert: dataGroup dataConstants first primitiveValue equals: 'Encore'.
	self assert: dataGroup dataConstants first startPos equals: 86.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testDeclarationIntegerWithInitializer [

	| result stmt declarator |
	fortranCode := '      program main
      integer i = 1
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"FastTmp/tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:15)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:15)-(2:15)","type":"scalar","variable":{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"contents":"i","tag":"variable"}}}],"span":"(2:15)-(2:15)"},"span":"(2:7)-(2:15)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(2:7)-(2:13)"}},"tag":"statement"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 34.

	self assert: stmt declarators size equals: 1.
	declarator := stmt declarators anyOne.
	self assert: declarator class equals: FASTFortranVariableDeclarator.
	self assert: declarator variable equals: 'i'.
	self assert: declarator startPos equals: 34.

	self assert: stmt type class equals: FASTFortranIntegerType.
	self assert: stmt type startPos equals: 26.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testDimensionStatementAsterisk [

	| result stmt decl |
	fortranCode := '      program simplemain
      DIMENSION A(*), B(N,*)
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:28)","statement":{"anno":[],"declarators":{"anno":[],"list":[{"anno":[],"dims":{"anno":[],"list":[{"anno":[],"lower":null,"span":"(2:19)-(2:19)","upper":{"anno":[],"span":"(2:19)-(2:19)","tag":"value","value":{"tag":"star"}}}],"span":"(2:19)-(2:19)"},"initial":null,"length":null,"span":"(2:17)-(2:20)","type":"array","variable":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"contents":"a","tag":"variable"}}},{"anno":[],"dims":{"anno":[],"list":[{"anno":[],"lower":null,"span":"(2:25)-(2:25)","upper":{"anno":[],"span":"(2:25)-(2:25)","tag":"value","value":{"contents":"n","tag":"variable"}}},{"anno":[],"lower":null,"span":"(2:27)-(2:27)","upper":{"anno":[],"span":"(2:27)-(2:27)","tag":"value","value":{"tag":"star"}}}],"span":"(2:25)-(2:27)"},"initial":null,"length":null,"span":"(2:23)-(2:28)","type":"array","variable":{"anno":[],"span":"(2:23)-(2:23)","tag":"value","value":{"contents":"b","tag":"variable"}}}],"span":"(2:17)-(2:28)"},"span":"(2:7)-(2:28)","tag":"dimension"},"tag":"statement"}],"name":"simplemain","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDimensionStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 53.

	self assert: stmt declarators size equals: 2.

	decl := stmt declarators first.
	self assert: decl variable equals: 'a'.
	self assert: decl dimensions size equals: 1.
	self assert: decl dimensions anyOne lowerBound equals: nil. 
	self assert: decl dimensions anyOne upperBound class equals: FASTFortranAsterisk.

	decl := stmt declarators second.
	self assert: decl variable equals: 'b'.
	self assert: decl dimensions size equals: 2.
	self assert: decl dimensions first lowerBound equals: nil. 
	self assert: decl dimensions first upperBound class equals: FASTFortranScalarVariable.
	self assert: decl dimensions second lowerBound equals: nil. 
	self assert: decl dimensions second upperBound class equals: FASTFortranAsterisk.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testDimensionStatementExpression [

	| result stmt decl |
	fortranCode := '      program simplemain
      DIMENSION M(HI, HI*3 + LO)
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:32)","statement":{"anno":[],"declarators":{"anno":[],"list":[{"anno":[],"dims":{"anno":[],"list":[{"anno":[],"lower":null,"span":"(2:19)-(2:20)","upper":{"anno":[],"span":"(2:19)-(2:20)","tag":"value","value":{"contents":"hi","tag":"variable"}}},{"anno":[],"lower":null,"span":"(2:23)-(2:31)","upper":{"anno":[],"left":{"anno":[],"left":{"anno":[],"span":"(2:23)-(2:24)","tag":"value","value":{"contents":"hi","tag":"variable"}},"op":{"tag":"multiplication"},"right":{"anno":[],"span":"(2:26)-(2:26)","tag":"value","value":{"contents":["3",null],"tag":"integer"}},"span":"(2:23)-(2:26)","tag":"binary"},"op":{"tag":"addition"},"right":{"anno":[],"span":"(2:30)-(2:31)","tag":"value","value":{"contents":"lo","tag":"variable"}},"span":"(2:23)-(2:31)","tag":"binary"}}],"span":"(2:19)-(2:31)"},"initial":null,"length":null,"span":"(2:17)-(2:32)","type":"array","variable":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"contents":"m","tag":"variable"}}}],"span":"(2:17)-(2:32)"},"span":"(2:7)-(2:32)","tag":"dimension"},"tag":"statement"}],"name":"simplemain","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDimensionStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 57.

	self assert: stmt declarators size equals: 1.
	decl := stmt declarators anyOne.

	self assert: decl variable equals: 'm'.
	self assert: decl dimensions size equals: 2.
	self assert: decl dimensions first lowerBound equals: nil. 
	self assert: decl dimensions first upperBound class equals: FASTFortranScalarVariable.
	self assert: decl dimensions second lowerBound equals: nil. 
	self assert: decl dimensions second upperBound class equals: FASTFortranBinaryExpression.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testDimensionStatementMultipleDim [

	| result stmt decl |
	fortranCode := '      program simplemain
      DIMENSION V(4,4) 
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:22)","statement":{"anno":[],"declarators":{"anno":[],"list":[{"anno":[],"dims":{"anno":[],"list":[{"anno":[],"lower":null,"span":"(2:19)-(2:19)","upper":{"anno":[],"span":"(2:19)-(2:19)","tag":"value","value":{"contents":["4",null],"tag":"integer"}}},{"anno":[],"lower":null,"span":"(2:21)-(2:21)","upper":{"anno":[],"span":"(2:21)-(2:21)","tag":"value","value":{"contents":["4",null],"tag":"integer"}}}],"span":"(2:19)-(2:21)"},"initial":null,"length":null,"span":"(2:17)-(2:22)","type":"array","variable":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"contents":"v","tag":"variable"}}}],"span":"(2:17)-(2:22)"},"span":"(2:7)-(2:22)","tag":"dimension"},"tag":"statement"}],"name":"simplemain","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDimensionStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 47.

	self assert: stmt declarators size equals: 1.
	decl := stmt declarators anyOne.

	self assert: decl variable equals: 'v'.
	self assert: decl dimensions size equals: 2.
	self assert: decl dimensions first lowerBound equals: nil. 
	self assert: decl dimensions first upperBound class equals: FASTFortranIntegerLiteral.
	self assert: decl dimensions second lowerBound equals: nil. 
	self assert: decl dimensions second upperBound class equals: FASTFortranIntegerLiteral.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testDimensionStatementMultipleVariables [

	| result stmt decl |
	fortranCode := '      program simplemain
      DIMENSION M(4,4), V(100)
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:30)","statement":{"anno":[],"declarators":{"anno":[],"list":[{"anno":[],"dims":{"anno":[],"list":[{"anno":[],"lower":null,"span":"(2:19)-(2:19)","upper":{"anno":[],"span":"(2:19)-(2:19)","tag":"value","value":{"contents":["4",null],"tag":"integer"}}},{"anno":[],"lower":null,"span":"(2:21)-(2:21)","upper":{"anno":[],"span":"(2:21)-(2:21)","tag":"value","value":{"contents":["4",null],"tag":"integer"}}}],"span":"(2:19)-(2:21)"},"initial":null,"length":null,"span":"(2:17)-(2:22)","type":"array","variable":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"contents":"m","tag":"variable"}}},{"anno":[],"dims":{"anno":[],"list":[{"anno":[],"lower":null,"span":"(2:27)-(2:29)","upper":{"anno":[],"span":"(2:27)-(2:29)","tag":"value","value":{"contents":["100",null],"tag":"integer"}}}],"span":"(2:27)-(2:29)"},"initial":null,"length":null,"span":"(2:25)-(2:30)","type":"array","variable":{"anno":[],"span":"(2:25)-(2:25)","tag":"value","value":{"contents":"v","tag":"variable"}}}],"span":"(2:17)-(2:30)"},"span":"(2:7)-(2:30)","tag":"dimension"},"tag":"statement"}],"name":"simplemain","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDimensionStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 55.

	self assert: stmt declarators size equals: 2.

	decl := stmt declarators first.
	self assert: decl variable equals: 'm'.
	self assert: decl dimensions size equals: 2.

	decl := stmt declarators second.
	self assert: decl variable equals: 'v'.
	self assert: decl dimensions size equals: 1.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testDimensionStatementRange [

	| result stmt decl |
	fortranCode := '      program simplemain
      DIMENSION M(-3:3, 4, 3:9)
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:31)","statement":{"anno":[],"declarators":{"anno":[],"list":[{"anno":[],"dims":{"anno":[],"list":[{"anno":[],"lower":{"anno":[],"expression":{"anno":[],"span":"(2:20)-(2:20)","tag":"value","value":{"contents":["3",null],"tag":"integer"}},"op":{"tag":"minus"},"span":"(2:19)-(2:20)","tag":"unary"},"span":"(2:19)-(2:22)","upper":{"anno":[],"span":"(2:22)-(2:22)","tag":"value","value":{"contents":["3",null],"tag":"integer"}}},{"anno":[],"lower":null,"span":"(2:25)-(2:25)","upper":{"anno":[],"span":"(2:25)-(2:25)","tag":"value","value":{"contents":["4",null],"tag":"integer"}}},{"anno":[],"lower":{"anno":[],"span":"(2:28)-(2:28)","tag":"value","value":{"contents":["3",null],"tag":"integer"}},"span":"(2:28)-(2:30)","upper":{"anno":[],"span":"(2:30)-(2:30)","tag":"value","value":{"contents":["9",null],"tag":"integer"}}}],"span":"(2:19)-(2:30)"},"initial":null,"length":null,"span":"(2:17)-(2:31)","type":"array","variable":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"contents":"m","tag":"variable"}}}],"span":"(2:17)-(2:31)"},"span":"(2:7)-(2:31)","tag":"dimension"},"tag":"statement"}],"name":"simplemain","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDimensionStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 56.

	self assert: stmt declarators size equals: 1.
	decl := stmt declarators anyOne.

	self assert: decl variable equals: 'm'.
	self assert: decl dimensions size equals: 3.

	self assert: decl dimensions first lowerBound class equals: FASTFortranIntegerLiteral. 
	self assert: decl dimensions first upperBound class equals: FASTFortranIntegerLiteral.

	self assert: decl dimensions second lowerBound equals: nil. 
	self assert: decl dimensions second upperBound class equals: FASTFortranIntegerLiteral.
	
	self assert: decl dimensions third lowerBound class equals: FASTFortranIntegerLiteral.
	self assert: decl dimensions third upperBound class equals: FASTFortranIntegerLiteral.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testDimensionStatementSimple [

	| result stmt decl |
	fortranCode := '      program simplemain
      DIMENSION V(1000) 
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:23)","statement":{"anno":[],"declarators":{"anno":[],"list":[{"anno":[],"dims":{"anno":[],"list":[{"anno":[],"lower":null,"span":"(2:19)-(2:22)","upper":{"anno":[],"span":"(2:19)-(2:22)","tag":"value","value":{"contents":["1000",null],"tag":"integer"}}}],"span":"(2:19)-(2:22)"},"initial":null,"length":null,"span":"(2:17)-(2:23)","type":"array","variable":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"contents":"v","tag":"variable"}}}],"span":"(2:17)-(2:23)"},"span":"(2:7)-(2:23)","tag":"dimension"},"tag":"statement"}],"name":"simplemain","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDimensionStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 48.

	self assert: stmt declarators size equals: 1.
	decl := stmt declarators anyOne.

	self assert: decl variable equals: 'v'.
	self assert: decl dimensions size equals: 1.
	self assert: decl dimensions anyOne lowerBound equals: nil. 
	self assert: decl dimensions anyOne upperBound class equals: FASTFortranIntegerLiteral.
	self assert: decl dimensions anyOne upperBound primitiveValue equals: '1000'.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testDimensionStatementVarDims [

	| result stmt decl |
	fortranCode := '      program simplemain
      DIMENSION M(N,N)
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:22)","statement":{"anno":[],"declarators":{"anno":[],"list":[{"anno":[],"dims":{"anno":[],"list":[{"anno":[],"lower":null,"span":"(2:19)-(2:19)","upper":{"anno":[],"span":"(2:19)-(2:19)","tag":"value","value":{"contents":"n","tag":"variable"}}},{"anno":[],"lower":null,"span":"(2:21)-(2:21)","upper":{"anno":[],"span":"(2:21)-(2:21)","tag":"value","value":{"contents":"n","tag":"variable"}}}],"span":"(2:19)-(2:21)"},"initial":null,"length":null,"span":"(2:17)-(2:22)","type":"array","variable":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"contents":"m","tag":"variable"}}}],"span":"(2:17)-(2:22)"},"span":"(2:7)-(2:22)","tag":"dimension"},"tag":"statement"}],"name":"simplemain","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDimensionStatement.
	self assert: stmt startPos equals: 32.
	self assert: stmt endPos equals: 47.

	self assert: stmt declarators size equals: 1.
	decl := stmt declarators anyOne.

	self assert: decl variable equals: 'm'.
	self assert: decl dimensions size equals: 2.
	self assert: decl dimensions first upperBound class equals: FASTFortranScalarVariable.
	self assert: decl dimensions first upperBound name equals: 'n'.
	self assert: decl dimensions second upperBound class equals: FASTFortranScalarVariable.
	self assert: decl dimensions second upperBound name equals: 'n'.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testDoStatementEmptyInitIncrementLimit [

	| result stmt control |
	fortranCode := '      program main
      do i = len(chaine),1,-1
      end do
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"body":[],"do_spec":{"anno":[],"increment":{"anno":[],"expression":{"anno":[],"span":"(2:29)-(2:29)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"op":{"tag":"minus"},"span":"(2:28)-(2:29)","tag":"unary"},"initial":{"anno":[],"expression":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"expr":{"contents":{"anno":[],"span":"(2:18)-(2:23)","tag":"value","value":{"contents":"chaine","tag":"variable"}},"tag":"expr"},"name":null,"span":"(2:18)-(2:23)"}],"span":"(2:18)-(2:23)"},"function":{"anno":[],"span":"(2:14)-(2:16)","tag":"value","value":{"contents":"len","tag":"intrinsic"}},"span":"(2:14)-(2:24)","tag":"function_call"},"span":"(2:10)-(2:24)","tag":"assign_expression","target":{"anno":[],"span":"(2:10)-(2:10)","tag":"value","value":{"contents":"i","tag":"variable"}}},"limit":{"anno":[],"span":"(2:26)-(2:26)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(2:10)-(2:29)"},"end_label":null,"label":null,"name":null,"span":"(2:7)-(3:12)","tag":"do","target":null}],"name":"main","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDoStatement.
	self assert: stmt loopControl isNotNil.
	self assert: stmt statementBlock statements isEmpty.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 61.

	control := stmt loopControl.
	self assert: control class equals: FASTFortranLoopControlExpression.
	self assert: control startPos equals: 29.

	self assert: control init class equals: FASTFortranAssignmentExpression.
	self assert: control init startPos equals: 29.

	self assert: control increment class equals: FASTFortranIntegerLiteral.
	self assert: control increment startPos equals: 47.
	self assert: control increment primitiveValue equals: '-1'.

	self assert: control limit class equals: FASTFortranIntegerLiteral.
	self assert: control limit startPos equals: 45.
	self assert: control limit primitiveValue equals: '1'.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testDoStatementEmptyNoIncrement [

	| result stmt control |
	fortranCode := '      program main
      do i=1, max
      end do
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"body":[],"do_spec":{"anno":[],"increment":null,"initial":{"anno":[],"expression":{"anno":[],"span":"(2:12)-(2:12)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(2:10)-(2:12)","tag":"assign_expression","target":{"anno":[],"span":"(2:10)-(2:10)","tag":"value","value":{"contents":"i","tag":"variable"}}},"limit":{"anno":[],"span":"(2:15)-(2:17)","tag":"value","value":{"contents":"max","tag":"variable"}},"span":"(2:10)-(2:17)"},"end_label":null,"label":null,"name":null,"span":"(2:7)-(3:12)","tag":"do","target":null}],"name":"main","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDoStatement.
	self assert: stmt loopControl isNotNil.
	self assert: stmt statementBlock statements isEmpty.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 49.

	control := stmt loopControl.
	self assert: control class equals: FASTFortranLoopControlExpression.
	self assert: control limit class equals: FASTFortranScalarVariable.
	self assert: control limit name equals: 'max'.
	self assert: control increment isNil.
	self assert: control startPos equals: 29.

	self assert: control init class equals: FASTFortranAssignmentExpression.
	self assert: control init startPos equals: 29.

	self assert: control init variable class equals: FASTFortranScalarVariable.
	self assert: control init variable name equals: 'i'.
	self assert: control init variable startPos equals: 29.

	self assert: control init expression class equals: FASTFortranIntegerLiteral.
	self assert: control init expression primitiveValue equals: '1'.
	self assert: control init expression startPos equals: 31.


]

{ #category : #'tests-statement' }
FortranToFASTTests >> testDoStatementWithComment [

	| result stmt |
	fortranCode := '      program main
      do i=1, max
C comment in loop
      end do
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"body":[{"anno":[],"comment":" comment in loop","span":"(3:1)-(3:17)","tag":"comment"}],"do_spec":{"anno":[],"increment":null,"initial":{"anno":[],"expression":{"anno":[],"span":"(2:12)-(2:12)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(2:10)-(2:12)","tag":"assign_expression","target":{"anno":[],"span":"(2:10)-(2:10)","tag":"value","value":{"contents":"i","tag":"variable"}}},"limit":{"anno":[],"span":"(2:15)-(2:17)","tag":"value","value":{"contents":"max","tag":"variable"}},"span":"(2:10)-(2:17)"},"end_label":null,"label":null,"name":null,"span":"(2:7)-(4:12)","tag":"do","target":null}],"name":"main","span":"(1:7)-(5:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDoStatement.
	self assert: stmt loopControl isNotNil.
	self assert: stmt statementBlock statements isEmpty.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 67.

	self assert: stmt statementBlock comments size equals: 1.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testDoStatementWithLabelAndContinue [

	| result stmt |
	fortranCode := '      program main
      do 100 i=1, max
100   continue
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"body":[],"do_spec":{"anno":[],"increment":null,"initial":{"anno":[],"expression":{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(2:14)-(2:16)","tag":"assign_expression","target":{"anno":[],"span":"(2:14)-(2:14)","tag":"value","value":{"contents":"i","tag":"variable"}}},"limit":{"anno":[],"span":"(2:19)-(2:21)","tag":"value","value":{"contents":"max","tag":"variable"}},"span":"(2:14)-(2:21)"},"end_label":{"anno":[],"span":"(3:1)-(3:3)","tag":"value","value":{"contents":["100",null],"tag":"integer"}},"label":null,"name":null,"span":"(2:7)-(2:21)","tag":"do","target":{"anno":[],"span":"(2:10)-(2:12)","tag":"value","value":{"contents":["100",null],"tag":"integer"}}}],"name":"main","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDoStatement.
	self assert: stmt loopControl isNotNil.

	self assert: stmt labelReferences size equals: 1.
	self assert: stmt labelReferences anyOne class equals: FASTFortranLabelReference.
	self assert: stmt labelReferences anyOne label equals: '100'.

	self assert: stmt statementBlock statements size equals: 1.
	self assert: stmt statementBlock statements anyOne class equals: FASTFortranContinueStatement.
	self assert: stmt statementBlock statements anyOne label equals: '100'.
	self assert: stmt statementBlock statements anyOne startPos equals: 42.
	

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testDoStatementWithLabelAndTerminalStatement [

	| result stmt |
	fortranCode := '      program main
      do 100 i=1, max
100   print *,i
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"body":[{"anno":[],"label":{"anno":[],"span":"(3:1)-(3:3)","tag":"value","value":{"contents":["100",null],"tag":"integer"}},"span":"(3:1)-(3:15)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(3:15)-(3:15)","tag":"value","value":{"contents":"i","tag":"variable"}}],"span":"(3:15)-(3:15)"},"format":{"anno":[],"span":"(3:13)-(3:13)","tag":"value","value":{"tag":"star"}},"span":"(3:7)-(3:15)","tag":"print"},"tag":"statement"}],"do_spec":{"anno":[],"increment":null,"initial":{"anno":[],"expression":{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(2:14)-(2:16)","tag":"assign_expression","target":{"anno":[],"span":"(2:14)-(2:14)","tag":"value","value":{"contents":"i","tag":"variable"}}},"limit":{"anno":[],"span":"(2:19)-(2:21)","tag":"value","value":{"contents":"max","tag":"variable"}},"span":"(2:14)-(2:21)"},"end_label":{"anno":[],"span":"(3:1)-(3:3)","tag":"value","value":{"contents":["100",null],"tag":"integer"}},"label":null,"name":null,"span":"(2:7)-(3:15)","tag":"do","target":{"anno":[],"span":"(2:10)-(2:12)","tag":"value","value":{"contents":["100",null],"tag":"integer"}}}],"name":"main","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranDoStatement.
	self assert: stmt loopControl isNotNil.

	self assert: stmt labelReferences size equals: 1.
	self assert: stmt labelReferences anyOne class equals: FASTFortranLabelReference.
	self assert: stmt labelReferences anyOne label equals: '100'.

	self assert: stmt statementBlock statements size equals: 1.
	self assert: stmt statementBlock statements anyOne class equals: FASTFortranPrintStatement.
	self assert: stmt statementBlock statements anyOne label equals: '100'.
	self assert: stmt statementBlock statements anyOne startPos equals: 48.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testEntryStatement [

	| result stmt |
	fortranCode := '      SUBROUTINE SUBRTN
      ENTRY XYZ(ABC,*)
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:22)","statement":{"anno":[],"args":{"anno":[],"list":[{"anno":[],"span":"(2:17)-(2:19)","tag":"value","value":{"contents":"abc","tag":"variable"}},{"anno":[],"span":"(2:21)-(2:21)","tag":"value","value":{"tag":"star"}}],"span":"(2:16)-(2:22)"},"name":{"anno":[],"span":"(2:13)-(2:15)","tag":"value","value":{"contents":"xyz","tag":"variable"}},"return":null,"span":"(2:7)-(2:22)","tag":"entry"},"tag":"statement"}],"name":"subrtn","options":[null,null],"span":"(1:7)-(3:9)","subprograms":null,"tag":"subroutine"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranEntryStatement.
	self assert: stmt name equals: 'xyz'.
	self assert: stmt startPos equals: 31.
	self assert: stmt endPos equals: 46.

	self assert: stmt entryArguments size equals: 2.

	self assert: stmt entryArguments first class equals: FASTFortranScalarVariable.
	self assert: stmt entryArguments first name equals: 'abc'.
	self assert: stmt entryArguments first startPos equals: 41.

	self assert: stmt entryArguments second class equals: FASTFortranAsterisk.
	self assert: stmt entryArguments second startPos equals: 45.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testEquivalenceStatementOneGroupArrayVariables [

	| result stmt grp |
	fortranCode := '      SUBROUTINE SUBRTN
      EQUIVALENCE (a,b(1),c(2))
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:31)","statement":{"anno":[],"groups":{"anno":[],"list":[{"anno":[],"list":[{"anno":[],"span":"(2:20)-(2:20)","tag":"value","value":{"contents":"a","tag":"variable"}},{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"expr":{"contents":{"anno":[],"span":"(2:24)-(2:24)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"tag":"expr"},"name":null,"span":"(2:24)-(2:24)"}],"span":"(2:24)-(2:24)"},"function":{"anno":[],"span":"(2:22)-(2:22)","tag":"value","value":{"contents":"b","tag":"variable"}},"span":"(2:22)-(2:25)","tag":"function_call"},{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"expr":{"contents":{"anno":[],"span":"(2:29)-(2:29)","tag":"value","value":{"contents":["2",null],"tag":"integer"}},"tag":"expr"},"name":null,"span":"(2:29)-(2:29)"}],"span":"(2:29)-(2:29)"},"function":{"anno":[],"span":"(2:27)-(2:27)","tag":"value","value":{"contents":"c","tag":"variable"}},"span":"(2:27)-(2:30)","tag":"function_call"}],"span":"(2:19)-(2:31)"}],"span":"(2:19)-(2:31)"},"span":"(2:7)-(2:31)","tag":"equivalence"},"tag":"statement"}],"name":"subrtn","options":[null,null],"span":"(1:7)-(3:9)","subprograms":null,"tag":"subroutine"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranEquivalenceStatement.
	self assert: stmt startPos equals: 31.
	self assert: stmt endPos equals: 55.

	self assert: stmt variableGroups size equals: 1.

	grp := stmt variableGroups first.
	self assert: grp class equals: FASTFortranEquivalenceGroup.
	self assert: grp startPos equals: 43.

	self assert: grp variables size equals: 3.
	self assert: grp variables first class equals: FASTFortranScalarVariable.
	self assert: grp variables second class equals: FASTFortranArrayVariable.
	self assert: grp variables third class equals: FASTFortranArrayVariable.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testEquivalenceStatementOneGroupScalarVariables [

	| result stmt grp |
	fortranCode := '      SUBROUTINE SUBRTN
      EQUIVALENCE (a,b,c)
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:25)","statement":{"anno":[],"groups":{"anno":[],"list":[{"anno":[],"list":[{"anno":[],"span":"(2:20)-(2:20)","tag":"value","value":{"contents":"a","tag":"variable"}},{"anno":[],"span":"(2:22)-(2:22)","tag":"value","value":{"contents":"b","tag":"variable"}},{"anno":[],"span":"(2:24)-(2:24)","tag":"value","value":{"contents":"c","tag":"variable"}}],"span":"(2:19)-(2:25)"}],"span":"(2:19)-(2:25)"},"span":"(2:7)-(2:25)","tag":"equivalence"},"tag":"statement"}],"name":"subrtn","options":[null,null],"span":"(1:7)-(3:9)","subprograms":null,"tag":"subroutine"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranEquivalenceStatement.
	self assert: stmt startPos equals: 31.
	self assert: stmt endPos equals: 49.

	self assert: stmt variableGroups size equals: 1.

	grp := stmt variableGroups first.
	self assert: grp class equals: FASTFortranEquivalenceGroup.
	self assert: grp startPos equals: 43.

	self assert: grp variables size equals: 3.
	grp variables do: [ :var |
		self assert: var class equals: FASTFortranScalarVariable.
		#(44 46 48) includes: var startPos.
		#('a' 'b' 'c') includes: var name
		
	]
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testEquivalenceStatementSeveralGroups [

	| result stmt grp |
	fortranCode := '      SUBROUTINE SUBRTN
      EQUIVALENCE (a,b,c), (d,e)
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:32)","statement":{"anno":[],"groups":{"anno":[],"list":[{"anno":[],"list":[{"anno":[],"span":"(2:20)-(2:20)","tag":"value","value":{"contents":"a","tag":"variable"}},{"anno":[],"span":"(2:22)-(2:22)","tag":"value","value":{"contents":"b","tag":"variable"}},{"anno":[],"span":"(2:24)-(2:24)","tag":"value","value":{"contents":"c","tag":"variable"}}],"span":"(2:19)-(2:25)"},{"anno":[],"list":[{"anno":[],"span":"(2:29)-(2:29)","tag":"value","value":{"contents":"d","tag":"variable"}},{"anno":[],"span":"(2:31)-(2:31)","tag":"value","value":{"contents":"e","tag":"variable"}}],"span":"(2:28)-(2:32)"}],"span":"(2:19)-(2:32)"},"span":"(2:7)-(2:32)","tag":"equivalence"},"tag":"statement"}],"name":"subrtn","options":[null,null],"span":"(1:7)-(3:9)","subprograms":null,"tag":"subroutine"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranEquivalenceStatement.
	self assert: stmt startPos equals: 31.
	self assert: stmt endPos equals: 56.

	self assert: stmt variableGroups size equals: 2.

	grp := stmt variableGroups first.
	self assert: grp class equals: FASTFortranEquivalenceGroup.
	self assert: grp variables size equals: 3.
	self assert: grp startPos equals: 43.

	grp := stmt variableGroups second.
	self assert: grp class equals: FASTFortranEquivalenceGroup.
	self assert: grp variables size equals: 2.
	self assert: grp startPos equals: 52.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testExit [

	| result stmt |
	fortranCode := '      PROGRAM TESTALT
       exit
      END 
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:11)","statement":{"anno":[],"span":"(2:8)-(2:11)","tag":"exit","var":null},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranExitStatement.
	self assert: stmt startPos equals: 30.
	self assert: stmt endPos equals: 33.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testExternalStatement [

	| result stmt |
	fortranCode := '      program main
      external mypnt
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:20)","statement":{"anno":[],"span":"(2:7)-(2:20)","tag":"external","vars":{"anno":[],"list":[{"anno":[],"span":"(2:16)-(2:20)","tag":"value","value":{"contents":"mypnt","tag":"variable"}}],"span":"(2:16)-(2:20)"}},"tag":"statement"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranExternalStatement.
	self assert: stmt name equals: 'mypnt'.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 39.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testFormatStatement [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
110   FORMAT( A8, 2X, I4, F8.2, F8.2 ) 
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":{"anno":[],"span":"(2:1)-(2:3)","tag":"value","value":{"contents":["110",null],"tag":"integer"}},"span":"(2:1)-(2:38)","statement":{"anno":[],"format":"(a8,2x,i4,f8.2,f8.2)","span":"(2:7)-(2:38)","tag":"format"},"tag":"statement"}],"name":"simplemain","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranFormatStatement.
	self assert: stmt startPos equals: 28.
	self assert: stmt endPos equals: 59.

	self assert: stmt label equals: '110'.

	self assert: stmt formatDescription equals: '(a8,2x,i4,f8.2,f8.2)'

]

{ #category : #'tests-programUnit' }
FortranToFASTTests >> testFunctionNoParameter [

	| result fct |
	fortranCode := '      integer function aFct()
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[],"name":"afct","result":null,"span":"(1:7)-(2:9)","subprograms":null,"tag":"function","type":{"anno":[],"base_type":"integer","selector":null,"span":"(1:7)-(1:13)"}}]}'.
	result := self visitJsonCode.

	self assert: result isNotEmpty.
	fct := result first.

	self assert: fct class equals: FASTFortranFunction.
	self assert: fct name equals: 'afct'.
	self assert: fct parameters isEmpty.
	self assert: fct statementBlock statements isEmpty.
	self assert: fct startPos equals: 7.

	self assert: fct returnType class equals: FASTFortranIntegerType.
	self assert: fct returnType startPos equals: 7.
	

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testFunctionStatement [

	| result stmt |
	fortranCode := '      program main
      add(x,y) = x + y
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:22)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"x","tag":"variable"}},{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":"y","tag":"variable"}}],"span":"(2:11)-(2:13)"},"body":{"anno":[],"left":{"anno":[],"span":"(2:18)-(2:18)","tag":"value","value":{"contents":"x","tag":"variable"}},"op":{"tag":"addition"},"right":{"anno":[],"span":"(2:22)-(2:22)","tag":"value","value":{"contents":"y","tag":"variable"}},"span":"(2:18)-(2:22)","tag":"binary"},"name":{"anno":[],"span":"(2:7)-(2:9)","tag":"value","value":{"contents":"add","tag":"variable"}},"span":"(2:7)-(2:22)","tag":"function"},"tag":"statement"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranFunctionStatement.
	self assert: stmt name equals: 'add'.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 41.

	self assert: stmt arguments size equals: 2.
	stmt arguments do: [:arg |
		self assert: arg class equals: FASTFortranScalarVariable ].
	self assert: stmt expression class equals: FASTFortranBinaryExpression

]

{ #category : #'tests-programUnit' }
FortranToFASTTests >> testFunctionWithParameter [

	| result fct param |
	fortranCode := '
      integer function aFct(i,j)
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(2:29)-(2:29)","tag":"value","value":{"contents":"i","tag":"variable"}},{"anno":[],"span":"(2:31)-(2:31)","tag":"value","value":{"contents":"j","tag":"variable"}}],"span":"(2:29)-(2:31)"},"blocks":[],"name":"afct","result":null,"span":"(2:7)-(3:9)","subprograms":null,"tag":"function","type":{"anno":[],"base_type":"integer","selector":null,"span":"(2:7)-(2:13)"}}]}'.

	result := self visitJsonCode.

	self assert: result isNotEmpty.
	fct := result first.

	self assert: fct class equals: FASTFortranFunction.
	self assert: fct parameters size equals: 2.

	self flag: 'should be a FASTFortranParameter, not a FASTFortranVariableExpression ?'.
	param := fct parameters first.
	self assert: param class equals: FASTFortranScalarVariable.
	self assert: param name equals: 'i'.
	self assert: param startPos equals: 30.

	param := fct parameters second.
	self assert: param class equals: FASTFortranScalarVariable.
	self assert: param name equals: 'j'.
	self assert: param startPos equals: 32.

]

{ #category : #'tests-programUnit' }
FortranToFASTTests >> testFunctionWithStatement [

	| result fct |
	fortranCode := '      integer function aFct()
      return 1
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:14)","statement":{"anno":[],"span":"(2:7)-(2:14)","tag":"return","target":{"anno":[],"span":"(2:14)-(2:14)","tag":"value","value":{"contents":["1",null],"tag":"integer"}}},"tag":"statement"}],"name":"afct","result":null,"span":"(1:7)-(3:9)","subprograms":null,"tag":"function","type":{"anno":[],"base_type":"integer","selector":null,"span":"(1:7)-(1:13)"}}]}'.
	result := self visitJsonCode.

	self assert: result isNotEmpty.
	fct := result first.

	self assert: fct class equals: FASTFortranFunction.
	self assert: fct name equals: 'afct'.
	self assert: fct parameters isEmpty.
	self assert: fct startPos equals: 7.

	self assert: fct statementBlock statements size equals: 1.
	self assert: fct statementBlock startPos equals: 37.
	self assert: fct statementBlock endPos equals: 44.

	self assert: fct returnType class equals: FASTFortranIntegerType.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testGoto [

	| result stmt |
	fortranCode := '      PROGRAM TESTALT
       GOTO 100
      END 
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:15)","statement":{"anno":[],"span":"(2:8)-(2:15)","tag":"goto","target":{"anno":[],"span":"(2:13)-(2:15)","tag":"value","value":{"contents":["100",null],"tag":"integer"}}},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranGoToStatement.
	self assert: stmt startPos equals: 30.
	self assert: stmt endPos equals: 37.


	self assert: stmt labelReferences size equals: 1.
	self assert: stmt labelReferences anyOne label equals: '100'.
	self assert: stmt labelReferences anyOne startPos equals: 35.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testGotoComputed [

	| result stmt |
	fortranCode := '      PROGRAM TESTALT
       GOTO (100,200,300,400) var
      END 
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:33)","statement":{"anno":[],"labels":{"anno":[],"list":[{"anno":[],"span":"(2:14)-(2:16)","tag":"value","value":{"contents":["100",null],"tag":"integer"}},{"anno":[],"span":"(2:18)-(2:20)","tag":"value","value":{"contents":["200",null],"tag":"integer"}},{"anno":[],"span":"(2:22)-(2:24)","tag":"value","value":{"contents":["300",null],"tag":"integer"}},{"anno":[],"span":"(2:26)-(2:28)","tag":"value","value":{"contents":["400",null],"tag":"integer"}}],"span":"(2:13)-(2:29)"},"span":"(2:8)-(2:33)","tag":"goto_computed","target":{"anno":[],"span":"(2:31)-(2:33)","tag":"value","value":{"contents":"var","tag":"variable"}}},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranGoToComputedStatement.
	self assert: stmt startPos equals: 30.
	self assert: stmt endPos equals: 55.


	self assert: stmt labelReferences size equals: 4.
	stmt labelReferences do: [ :label |
		self assert: label class equals: FASTFortranLabelReference.
		self assert: (label label endsWith: '00').
		self assert: (#(36 40 44 48) includes: label startPos)
	].

	self assert: stmt selectorExpression class equals: FASTFortranScalarVariable.
	self assert: stmt selectorExpression name equals: 'var'.
	self assert: stmt selectorExpression startPos equals: 53.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testIfArithmetic [

	| result conditional |
	fortranCode := '      PROGRAM MYPROG
         IF ( A ) 10, 20, 30
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:10)-(2:28)","statement":{"anno":[],"equal":{"anno":[],"span":"(2:23)-(2:24)","tag":"value","value":{"contents":["20",null],"tag":"integer"}},"expression":{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"contents":"a","tag":"variable"}},"greater":{"anno":[],"span":"(2:27)-(2:28)","tag":"value","value":{"contents":["30",null],"tag":"integer"}},"less":{"anno":[],"span":"(2:19)-(2:20)","tag":"value","value":{"contents":["10",null],"tag":"integer"}},"span":"(2:10)-(2:28)","tag":"if_arithmetic"},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfArithmeticStatement.
	self assert: conditional startPos equals: 31.
	self assert: conditional endPos equals: 49.

	self assert: conditional condition class equals: FASTFortranScalarVariable.
	self assert: conditional condition name equals: 'a'.
	self assert: conditional condition startPos equals: 36.

	self assert: conditional lessLabel class equals: FASTFortranLabelReference.
	self assert: conditional lessLabel label equals: '10'.
	self assert: conditional lessLabel startPos equals: 40.

	self assert: conditional equalLabel class equals: FASTFortranLabelReference.
	self assert: conditional equalLabel label equals: '20'.
	self assert: conditional equalLabel startPos equals: 44.

	self assert: conditional greaterLabel class equals: FASTFortranLabelReference.
	self assert: conditional greaterLabel label equals: '30'.
	self assert: conditional greaterLabel startPos equals: 48
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testIfElseIf [
	"note: starting and ending position of else block are approximate"

	| result conditional |
	fortranCode := '      PROGRAM MYPROG
         IF ( A ) THEN
          a = 1
         else if ( b ) then
          b = 1
         else if ( c ) then
          c = 1
         ELSE
          d = 1
         END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(9:11)-(9:15)","statement":{"anno":[],"expression":{"anno":[],"span":"(9:15)-(9:15)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(9:11)-(9:15)","tag":"assign_expression","target":{"anno":[],"span":"(9:11)-(9:11)","tag":"value","value":{"contents":"d","tag":"variable"}}},"tag":"statement"}],"conditions":[[{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"contents":"a","tag":"variable"}},[{"anno":[],"label":null,"span":"(3:11)-(3:15)","statement":{"anno":[],"expression":{"anno":[],"span":"(3:15)-(3:15)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(3:11)-(3:15)","tag":"assign_expression","target":{"anno":[],"span":"(3:11)-(3:11)","tag":"value","value":{"contents":"a","tag":"variable"}}},"tag":"statement"}]],[{"anno":[],"span":"(4:20)-(4:20)","tag":"value","value":{"contents":"b","tag":"variable"}},[{"anno":[],"label":null,"span":"(5:11)-(5:15)","statement":{"anno":[],"expression":{"anno":[],"span":"(5:15)-(5:15)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(5:11)-(5:15)","tag":"assign_expression","target":{"anno":[],"span":"(5:11)-(5:11)","tag":"value","value":{"contents":"b","tag":"variable"}}},"tag":"statement"}]],[{"anno":[],"span":"(6:20)-(6:20)","tag":"value","value":{"contents":"c","tag":"variable"}},[{"anno":[],"label":null,"span":"(7:11)-(7:15)","statement":{"anno":[],"expression":{"anno":[],"span":"(7:15)-(7:15)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(7:11)-(7:15)","tag":"assign_expression","target":{"anno":[],"span":"(7:11)-(7:11)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}]]],"end_label":null,"label":null,"name":null,"span":"(2:10)-(10:15)","tag":"if"}],"name":"myprog","span":"(1:7)-(11:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1. .

	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatementBlock statements size equals: 1.
	self assert: conditional elseStatementBlock statements size equals: 1.
	self assert: conditional thenStatementBlock startPos equals: 55.
	self assert: conditional elseStatementBlock startPos equals: 77.

	conditional := conditional elseStatementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatementBlock statements size equals: 1.
	self assert: conditional elseStatementBlock statements size equals: 1.
	self assert: conditional thenStatementBlock startPos equals: 99.
	self assert: conditional elseStatementBlock startPos equals: 121.

	conditional := conditional elseStatementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatementBlock statements size equals: 1.
	self assert: conditional elseStatementBlock statements size equals: 1.
	self assert: conditional thenStatementBlock startPos equals: 143.
	self assert: conditional elseStatementBlock startPos equals: 173.
	
	conditional := conditional elseStatementBlock statements first.
	self assert: conditional class equals: FASTFortranAssignmentStatement.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testIfElseWithComment [

	| result conditional |
	
	fortranCode := '      PROGRAM MYPROG
       IF ( A ) THEN 
       ELSE
C comment in else part
       END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":[{"anno":[],"comment":" comment in else part","span":"(4:1)-(4:22)","tag":"comment"}],"conditions":[[{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":"a","tag":"variable"}},[]]],"end_label":null,"label":null,"name":null,"span":"(2:8)-(5:13)","tag":"if"}],"name":"myprog","span":"(1:7)-(6:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatementBlock statements isEmpty.
	self assert: conditional elseStatementBlock statements isEmpty.
	self assert: conditional elseStatementBlock comments size equals: 1.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testIfElseWithStatement [

	| result conditional |
	
	fortranCode := '      PROGRAM MYPROG
       IF ( A ) THEN 
       ELSE
        I = 1 
       END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(4:9)-(4:13)","statement":{"anno":[],"expression":{"anno":[],"span":"(4:13)-(4:13)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(4:9)-(4:13)","tag":"assign_expression","target":{"anno":[],"span":"(4:9)-(4:9)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"conditions":[[{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":"a","tag":"variable"}},[]]],"end_label":null,"label":null,"name":null,"span":"(2:8)-(5:13)","tag":"if"}],"name":"myprog","span":"(1:7)-(6:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatementBlock statements size equals: 0.
	self assert: conditional elseStatementBlock statements size equals: 1.
	self assert: conditional elseStatementBlock statements first class equals: FASTFortranAssignmentStatement.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testIfEmpty [

	| result conditional |
	fortranCode := '      PROGRAM MYPROG
       IF ( A ) THEN
       END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":"a","tag":"variable"}},[]]],"end_label":null,"label":null,"name":null,"span":"(2:8)-(3:13)","tag":"if"}],"name":"myprog","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.
	
	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional condition class equals: FASTFortranScalarVariable.
	self assert: conditional condition name equals: 'a'.
	self assert: conditional thenStatementBlock statements size equals: 0.
	self assert: conditional elseStatementBlock equals: nil.

	self assert: conditional startPos equals: 29.
	self assert: conditional endPos equals: 55.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testIfThenWithComment [

	| result conditional |
	fortranCode := '      PROGRAM MYPROG
       IF ( A ) THEN
C comment in then part
       END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":"a","tag":"variable"}},[{"anno":[],"comment":" comment in then part","span":"(3:1)-(3:22)","tag":"comment"}]]],"end_label":null,"label":null,"name":null,"span":"(2:8)-(4:13)","tag":"if"}],"name":"myprog","span":"(1:7)-(5:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatementBlock statements isEmpty.
	self assert: conditional thenStatementBlock comments size equals: 1.
	self assert: conditional thenStatementBlock startPos equals: 43.
	self assert: conditional thenStatementBlock endPos equals: 64.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testIfThenWithStatement [

	| result conditional |
	fortranCode := '      PROGRAM MYPROG
       IF ( A ) THEN
        I = 1
       END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":"a","tag":"variable"}},[{"anno":[],"label":null,"span":"(3:9)-(3:13)","statement":{"anno":[],"expression":{"anno":[],"span":"(3:13)-(3:13)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(3:9)-(3:13)","tag":"assign_expression","target":{"anno":[],"span":"(3:9)-(3:9)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}]]],"end_label":null,"label":null,"name":null,"span":"(2:8)-(4:13)","tag":"if"}],"name":"myprog","span":"(1:7)-(5:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatementBlock class equals: FASTFortranStatementBlock.
	self assert: conditional thenStatementBlock statements size equals: 1.
	self assert: conditional thenStatementBlock startPos equals: 51.
	self assert: conditional thenStatementBlock endPos equals: 55.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testIfThenWithTwoStatements [

	| result conditional thenStatements|
	fortranCode := '      PROGRAM MYPROG
      if (iur .eq. 0) then 
         write(*,*) '' user'',name,'' does not exist''
         return
      end if 
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"left":{"anno":[],"span":"(2:11)-(2:13)","tag":"value","value":{"contents":"iur","tag":"variable"}},"op":{"tag":"eq"},"right":{"anno":[],"span":"(2:20)-(2:20)","tag":"value","value":{"contents":["0",null],"tag":"integer"}},"span":"(2:11)-(2:20)","tag":"binary"},[{"anno":[],"label":null,"span":"(3:10)-(3:50)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(3:21)-(3:27)","tag":"value","value":{"contents":" user","tag":"string"}},{"anno":[],"span":"(3:29)-(3:32)","tag":"value","value":{"contents":"name","tag":"variable"}},{"anno":[],"span":"(3:34)-(3:50)","tag":"value","value":{"contents":" does not exist","tag":"string"}}],"span":"(3:21)-(3:50)"},"format":{"anno":[],"list":[{"anno":[],"expr":{"anno":[],"span":"(3:16)-(3:16)","tag":"value","value":{"tag":"star"}},"name":null,"span":"(3:16)-(3:16)"},{"anno":[],"expr":{"anno":[],"span":"(3:18)-(3:18)","tag":"value","value":{"tag":"star"}},"name":null,"span":"(3:18)-(3:18)"}],"span":"(3:15)-(3:19)"},"span":"(3:10)-(3:50)","tag":"write"},"tag":"statement"},{"anno":[],"label":null,"span":"(4:10)-(4:15)","statement":{"anno":[],"span":"(4:10)-(4:15)","tag":"return","target":null},"tag":"statement"}]]],"end_label":null,"label":null,"name":null,"span":"(2:7)-(5:12)","tag":"if"}],"name":"myprog","span":"(1:7)-(6:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	
	thenStatements := conditional thenStatementBlock statements.
	self assert: thenStatements size equals: 2.
	self assert: thenStatements first class equals: FASTFortranWriteStatement.
	self assert: thenStatements second class equals: FASTFortranReturnStatement

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testImplicitNoneStatement [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
       implicit none
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:20)","statement":{"anno":[],"items":null,"span":"(2:8)-(2:20)","tag":"implicit"},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranImplicitStatement.
	self assert: stmt startPos equals: 29.
	self assert: stmt endPos equals: 41.

	self assert: stmt typingRules isEmpty

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testImplicitStatement [

	| result stmt rule |
	fortranCode := '      PROGRAM MYPROG
       IMPLICIT LOGICAL (A-Z)
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:29)","statement":{"anno":[],"items":{"anno":[],"list":[{"anno":[],"elements":{"anno":[],"list":[{"anno":[],"from":"a","span":"(2:26)-(2:28)","to":"z"}],"span":"(2:26)-(2:28)"},"span":"(2:17)-(2:29)","type":{"anno":[],"base_type":"logical","selector":null,"span":"(2:17)-(2:23)"}}],"span":"(2:17)-(2:29)"},"span":"(2:8)-(2:29)","tag":"implicit"},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.

	self assert: stmt class equals: FASTFortranImplicitStatement.
	self assert: stmt startPos equals: 29.
	self assert: stmt endPos equals: 50.

	self assert: stmt typingRules size equals: 1.

	rule := stmt typingRules anyOne.
	self assert: rule type class equals: FASTFortranLogicalType.
	
	self assert: rule ranges size equals: 1.
	self assert: rule ranges anyOne class equals: FASTFortranImplicitRange.
	self assert: rule ranges anyOne from equals: 'a'.
	self assert: rule ranges anyOne to   equals: 'z'.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testImplicitStatementCharacterSize [

	| result stmt rule |
	fortranCode := '      PROGRAM MYPROG
       IMPLICIT CHARACTER*4 (C,S) 
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:33)","statement":{"anno":[],"items":{"anno":[],"list":[{"anno":[],"elements":{"anno":[],"list":[{"anno":[],"from":"c","span":"(2:30)-(2:30)","to":null},{"anno":[],"from":"s","span":"(2:32)-(2:32)","to":null}],"span":"(2:30)-(2:32)"},"span":"(2:17)-(2:33)","type":{"anno":[],"base_type":"character","selector":{"anno":[],"kind":null,"length":{"anno":[],"span":"(2:27)-(2:27)","tag":"value","value":{"contents":["4",null],"tag":"integer"}},"span":"(2:26)-(2:27)"},"span":"(2:17)-(2:27)"}}],"span":"(2:17)-(2:33)"},"span":"(2:8)-(2:33)","tag":"implicit"},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.

	self assert: stmt class equals: FASTFortranImplicitStatement.
	self assert: stmt startPos equals: 29.
	self assert: stmt endPos equals: 54.

	self assert: stmt typingRules size equals: 1.

	rule := stmt typingRules anyOne.
	self assert: rule type class equals: FASTFortranCharacterType.
	self assert: rule type size class equals: FASTFortranIntegerLiteral.
	self assert: rule type size primitiveValue equals: '4'.


]

{ #category : #'tests-statement' }
FortranToFASTTests >> testImplicitStatementNoRange [

	| result stmt rule |
	fortranCode := '      PROGRAM MYPROG
       IMPLICIT COMPLEX (U,V,W)
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:31)","statement":{"anno":[],"items":{"anno":[],"list":[{"anno":[],"elements":{"anno":[],"list":[{"anno":[],"from":"u","span":"(2:26)-(2:26)","to":null},{"anno":[],"from":"v","span":"(2:28)-(2:28)","to":null},{"anno":[],"from":"w","span":"(2:30)-(2:30)","to":null}],"span":"(2:26)-(2:30)"},"span":"(2:17)-(2:31)","type":{"anno":[],"base_type":"complex","selector":null,"span":"(2:17)-(2:23)"}}],"span":"(2:17)-(2:31)"},"span":"(2:8)-(2:31)","tag":"implicit"},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.

	self assert: stmt class equals: FASTFortranImplicitStatement.
	self assert: stmt startPos equals: 29.
	self assert: stmt endPos equals: 52.

	self assert: stmt typingRules size equals: 1.

	rule := stmt typingRules anyOne.
	self assert: rule type class equals: FASTFortranComplexType.
	
	self assert: rule ranges size equals: 3.
	rule ranges do: [ :range |
		self assert: range to equals: nil.
	]

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testImplicitStatementSeveralItems [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
       IMPLICIT LOGICAL (l-N), INTEGER (C,S) 
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:44)","statement":{"anno":[],"items":{"anno":[],"list":[{"anno":[],"elements":{"anno":[],"list":[{"anno":[],"from":"l","span":"(2:26)-(2:28)","to":"n"}],"span":"(2:26)-(2:28)"},"span":"(2:17)-(2:29)","type":{"anno":[],"base_type":"logical","selector":null,"span":"(2:17)-(2:23)"}},{"anno":[],"elements":{"anno":[],"list":[{"anno":[],"from":"c","span":"(2:41)-(2:41)","to":null},{"anno":[],"from":"s","span":"(2:43)-(2:43)","to":null}],"span":"(2:41)-(2:43)"},"span":"(2:32)-(2:44)","type":{"anno":[],"base_type":"integer","selector":null,"span":"(2:32)-(2:38)"}}],"span":"(2:17)-(2:44)"},"span":"(2:8)-(2:44)","tag":"implicit"},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.

	self assert: stmt class equals: FASTFortranImplicitStatement.
	self assert: stmt startPos equals: 29.
	self assert: stmt endPos equals: 65.

	self assert: stmt typingRules size equals: 2.

	self assert: stmt typingRules first class equals: FASTFortranImplicitTypingRule.
	self assert: stmt typingRules first type class equals: FASTFortranLogicalType.
	self assert: stmt typingRules second class equals: FASTFortranImplicitTypingRule.
	self assert: stmt typingRules second type class equals: FASTFortranIntegerType.

]

{ #category : #'tests-expression' }
FortranToFASTTests >> testImpliedDoExpression [

	| result stmt control |
	fortranCode := '      PROGRAM MYPROG
      WRITE (*,*) (SPACE,I,I=1,N)

      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:33)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"do_spec":{"anno":[],"increment":null,"initial":{"anno":[],"expression":{"anno":[],"span":"(2:30)-(2:30)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(2:28)-(2:30)","tag":"assign_expression","target":{"anno":[],"span":"(2:28)-(2:28)","tag":"value","value":{"contents":"i","tag":"variable"}}},"limit":{"anno":[],"span":"(2:32)-(2:32)","tag":"value","value":{"contents":"n","tag":"variable"}},"span":"(2:28)-(2:32)"},"expressions":{"anno":[],"list":[{"anno":[],"span":"(2:20)-(2:24)","tag":"value","value":{"contents":"space","tag":"variable"}},{"anno":[],"span":"(2:26)-(2:26)","tag":"value","value":{"contents":"i","tag":"variable"}}],"span":"(2:20)-(2:26)"},"span":"(2:19)-(2:33)","tag":"implied_do"}],"span":"(2:19)-(2:33)"},"format":{"anno":[],"list":[{"anno":[],"expr":{"anno":[],"span":"(2:14)-(2:14)","tag":"value","value":{"tag":"star"}},"name":null,"span":"(2:14)-(2:14)"},{"anno":[],"expr":{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"tag":"star"}},"name":null,"span":"(2:16)-(2:16)"}],"span":"(2:13)-(2:17)"},"span":"(2:7)-(2:33)","tag":"write"},"tag":"statement"}],"name":"myprog","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranWriteStatement.
	self assert: stmt startPos equals: 28.
	self assert: stmt endPos equals: 54.

	self assert: stmt arguments size equals: 1.

	self assert: stmt arguments anyOne class equals: FASTFortranImpliedDoExpression.
	self assert: stmt arguments first startPos equals: 40.

	self assert: stmt arguments anyOne variables size equals: 2.	

	control := stmt arguments first loopControl.
	self assert: control class equals: FASTFortranLoopControlExpression.
	self assert: control limit class equals: FASTFortranScalarVariable.
	self assert: control limit name equals: 'n'.
	self assert: control increment isNil.

	self assert: control init class equals: FASTFortranAssignmentExpression.

	self assert: control init variable class equals: FASTFortranScalarVariable.
	self assert: control init variable name equals: 'i'.

	self assert: control init expression class equals: FASTFortranIntegerLiteral.
	self assert: control init expression primitiveValue equals: '1'.


]

{ #category : #'tests-statement' }
FortranToFASTTests >> testLogicalIfEmpty [

	| result conditional |
	fortranCode := '      PROGRAM MYPROG
       IF ( A .eq. 5 ) RETURN
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"FastTmp/tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:29)","statement":{"anno":[],"condition":{"anno":[],"left":{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":"a","tag":"variable"}},"op":{"tag":"eq"},"right":{"anno":[],"span":"(2:20)-(2:20)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"span":"(2:13)-(2:20)","tag":"binary"},"span":"(2:8)-(2:29)","statement":{"anno":[],"span":"(2:24)-(2:29)","tag":"return","target":null},"tag":"if_logical"},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.
	
	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfLogicalStatement.

	self assert: conditional condition class equals: FASTFortranBinaryExpression.
	self assert: conditional condition startPos equals: 34.

	self assert: conditional statement class equals: FASTFortranReturnStatement.
	self assert: conditional statement startPos equals: 45.

	self assert: conditional startPos equals: 29.
	self assert: conditional endPos equals: 50.

]

{ #category : #'tests-programUnit' }
FortranToFASTTests >> testMainProgram [
	| result body |

	fortranCode := '      program main
      implicit none
c23456789 123456789 123456789 123456789 123456789 123456789 12
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:19)","statement":{"anno":[],"items":null,"span":"(2:7)-(2:19)","tag":"implicit"},"tag":"statement"},{"anno":[],"comment":"23456789 123456789 123456789 123456789 123456789 123456789 12","span":"(3:1)-(3:62)","tag":"comment"}],"name":"main","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result size equals: 1.
	self assert: result first class equals: FASTFortranProgramMain.

	body := result first statementBlock.
	self assert: body statements isCollection.
	self assert: body statements size equals: 1.
	self assert: body statements first class equals: FASTFortranImplicitStatement.
	
	self assert: body comments size equals: 1.
	self assert: body comments first class equals: FASTFortranComment.
	self assert: body comments first content equals: 'C23456789 123456789 123456789 123456789 123456789 123456789 12'.
]

{ #category : #'tests-programUnit' }
FortranToFASTTests >> testMainProgramAndSubroutine [

	| result progUnit |
	fortranCode := '      PROGRAM TESTALT
      END 
      
      SUBROUTINE RANK
      END
'.

	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[],"name":"testalt","span":"(1:7)-(2:9)","subprograms":null,"tag":"main"},{"anno":[],"arguments":null,"blocks":[],"name":"rank","options":[null,null],"span":"(4:7)-(5:9)","subprograms":null,"tag":"subroutine"}]}'.
	result := self visitJsonCode.

	self assert: result isCollection.
	self assert: result size equals: 2.

	progUnit := result first.
	self assert: progUnit class equals: FASTFortranProgramMain.
	self assert: progUnit name equals: 'testalt'.

	progUnit := result second.
	self assert: progUnit class equals: FASTFortranSubroutine.
	self assert: progUnit name equals: 'rank'.
]

{ #category : #'tests-programUnit' }
FortranToFASTTests >> testMainProgramEmpty [

	| result |
	fortranCode := '      program main
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[],"name":"main","span":"(1:7)-(2:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.
	
	self assert: result isCollection.
	self assert: result size equals: 1.
	self assert: result first class equals: FASTFortranProgramMain.
	self assert: result first name equals: 'main'.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testParameterStatement [

	| result stmt var |
	fortranCode := '      program main
      PARAMETER (PI=3.141593, TEXT=''Header'', T=.TRUE.)
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:54)","statement":{"anno":[],"declarators":{"anno":[],"list":[{"anno":[],"initial":{"anno":[],"span":"(2:21)-(2:28)","tag":"value","value":{"contents":[{"exponent":{"letter":"e","num":"0"},"significand":"3.141593"},null],"tag":"real"}},"length":null,"span":"(2:18)-(2:28)","type":"scalar","variable":{"anno":[],"span":"(2:18)-(2:19)","tag":"value","value":{"contents":"pi","tag":"variable"}}},{"anno":[],"initial":{"anno":[],"span":"(2:36)-(2:43)","tag":"value","value":{"contents":"Header","tag":"string"}},"length":null,"span":"(2:31)-(2:43)","type":"scalar","variable":{"anno":[],"span":"(2:31)-(2:34)","tag":"value","value":{"contents":"text","tag":"variable"}}},{"anno":[],"initial":{"anno":[],"span":"(2:48)-(2:53)","tag":"value","value":{"contents":[true,null],"tag":"logical"}},"length":null,"span":"(2:46)-(2:53)","type":"scalar","variable":{"anno":[],"span":"(2:46)-(2:46)","tag":"value","value":{"contents":"t","tag":"variable"}}}],"span":"(2:18)-(2:53)"},"span":"(2:7)-(2:54)","tag":"parameter"},"tag":"statement"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranParameterStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 73.
	
	self assert: stmt declarators size equals: 3.

	var := stmt declarators first.
	self assert: var class equals: FASTFortranVariableDeclarator.
	self assert: var variable equals: 'pi'.
	self assert: var expression class equals: FASTFortranRealLiteral.
	self assert: var expression primitiveValue equals: '3.141593'.
	self assert: var startPos equals: 37.

	var := stmt declarators second.
	self assert: var class equals: FASTFortranVariableDeclarator.
	self assert: var variable equals: 'text'.
	self assert: var expression class equals: FASTFortranCharacterLiteral.
	self assert: var expression primitiveValue equals: 'Header'.
	self assert: var startPos equals: 50.

	var := stmt declarators third.
	self assert: var class equals: FASTFortranVariableDeclarator.
	self assert: var variable equals: 't'.
	self assert: var expression class equals: FASTFortranBooleanLiteral.
	self assert: var expression primitiveValue equals: '.true.'.
	self assert: var startPos equals: 65.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testPauseStatementEmpty [

	| stmt result |
	fortranCode := '      PROGRAM MYPROG
      pause
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:11)","statement":{"anno":[],"message":null,"span":"(2:7)-(2:11)","tag":"pause"},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranPauseStatement.
	self assert: stmt startPos equals: 28.
	self assert: stmt endPos equals: 32.

	self assert: stmt displayArgument equals: nil


]

{ #category : #'tests-statement' }
FortranToFASTTests >> testPauseStatementWithInteger [

	| stmt result |
	fortranCode := '      PROGRAM MYPROG
      pause 1
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:13)","statement":{"anno":[],"message":{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(2:7)-(2:13)","tag":"pause"},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranPauseStatement.
	self assert: stmt startPos equals: 28.
	self assert: stmt endPos equals: 34.

	self assert: stmt displayArgument equals: '1'


]

{ #category : #'tests-statement' }
FortranToFASTTests >> testPauseStatementWithString [

	| stmt result |
	fortranCode := '      PROGRAM MYPROG
      stop ''error''
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:18)","statement":{"anno":[],"message":{"anno":[],"span":"(2:12)-(2:18)","tag":"value","value":{"contents":"error","tag":"string"}},"span":"(2:7)-(2:18)","tag":"stop"},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranStopStatement.
	self assert: stmt startPos equals: 28.
	self assert: stmt endPos equals: 39.

	self assert: stmt displayArgument equals: '''error'''


]

{ #category : #'tests-statement' }
FortranToFASTTests >> testPrintMultipleVariables [

	| stmt result  var arguments |
	fortranCode := '      subroutine mysub (msg)
      PRINT *, X, Y, Z
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(1:25)-(1:27)","tag":"value","value":{"contents":"msg","tag":"variable"}}],"span":"(1:25)-(1:27)"},"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:22)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"contents":"x","tag":"variable"}},{"anno":[],"span":"(2:19)-(2:19)","tag":"value","value":{"contents":"y","tag":"variable"}},{"anno":[],"span":"(2:22)-(2:22)","tag":"value","value":{"contents":"z","tag":"variable"}}],"span":"(2:16)-(2:22)"},"format":{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"tag":"star"}},"span":"(2:7)-(2:22)","tag":"print"},"tag":"statement"}],"name":"mysub","options":[null,null],"span":"(1:7)-(3:9)","subprograms":null,"tag":"subroutine"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranPrintStatement.
	self assert: stmt format class equals: FASTFortranAsterisk.
	self assert: stmt startPos equals: 36.
	self assert: stmt endPos equals: 51.

	
	arguments := stmt arguments.
	self assert: arguments size equals: 3.

	var := arguments first.
	self assert: var class equals: FASTFortranScalarVariable.
	self assert: var name equals: 'x'.

	var := arguments second.
	self assert: var class equals: FASTFortranScalarVariable.
	self assert: var name equals: 'y'.

	var := arguments third.
	self assert: var class equals: FASTFortranScalarVariable.
	self assert: var name equals: 'z'
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testPrintOneVariable [

	| stmt result arguments |
	fortranCode := '      subroutine mysub (msg)
      PRINT *, X
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(1:25)-(1:27)","tag":"value","value":{"contents":"msg","tag":"variable"}}],"span":"(1:25)-(1:27)"},"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:16)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"contents":"x","tag":"variable"}}],"span":"(2:16)-(2:16)"},"format":{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"tag":"star"}},"span":"(2:7)-(2:16)","tag":"print"},"tag":"statement"}],"name":"mysub","options":[null,null],"span":"(1:7)-(3:9)","subprograms":null,"tag":"subroutine"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranPrintStatement.
	self assert: stmt startPos equals: 36.
	self assert: stmt endPos equals: 45.

	self assert: stmt format class equals: FASTFortranAsterisk.

	arguments := stmt arguments.
	self assert: arguments size equals: 1.
	self assert: arguments first class equals: FASTFortranScalarVariable.
	self assert: arguments first name equals: 'x'
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testReadWithFormat [

	| stmt result |
	fortranCode := '      subroutine mysub ()
      READ( 3, ''(5F4.1)'') V
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:27)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(2:27)-(2:27)","tag":"value","value":{"contents":"v","tag":"variable"}}],"span":"(2:27)-(2:27)"},"format":{"anno":[],"list":[{"anno":[],"expr":{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":["3",null],"tag":"integer"}},"name":null,"span":"(2:13)-(2:13)"},{"anno":[],"expr":{"anno":[],"span":"(2:16)-(2:24)","tag":"value","value":{"contents":"(5F4.1)","tag":"string"}},"name":null,"span":"(2:16)-(2:24)"}],"span":"(2:11)-(2:25)"},"span":"(2:7)-(2:27)","tag":"read"},"tag":"statement"}],"name":"mysub","options":[null,null],"span":"(1:7)-(3:9)","subprograms":null,"tag":"subroutine"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranReadStatement.
	self assert: stmt startPos equals: 33.
	self assert: stmt endPos equals: 53.

	self assert: stmt ioParameters size equals: 2.

	self assert: stmt ioParameters first class equals: FASTFortranIntegerLiteral.
	self assert: stmt ioParameters first startPos equals: 39.
	self assert: stmt ioParameters second class equals: FASTFortranCharacterLiteral.
	self assert: stmt ioParameters second startPos equals: 42.

	self assert: stmt arguments size equals: 1.

	self assert: stmt arguments first class equals: FASTFortranScalarVariable.
	self assert: stmt arguments first startPos equals: 53.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testReturnStatementEmpty [

	| stmt result |
	fortranCode := '      PROGRAM MYPROG
      return
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:12)","statement":{"anno":[],"span":"(2:7)-(2:12)","tag":"return","target":null},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranReturnStatement.
	self assert: stmt startPos equals: 28.
	self assert: stmt endPos equals: 33.


]

{ #category : #'tests-statement' }
FortranToFASTTests >> testStatementWithLabel [

	| result stmt |
	fortranCode := '      PROGRAM TESTALT
10     STOP
      END 
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":{"anno":[],"span":"(2:1)-(2:2)","tag":"value","value":{"contents":["10",null],"tag":"integer"}},"span":"(2:1)-(2:11)","statement":{"anno":[],"message":null,"span":"(2:8)-(2:11)","tag":"stop"},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranStopStatement.
	self assert: stmt label equals: '10'.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testStopStatementEmpty [

	| stmt result |
	fortranCode := '      PROGRAM MYPROG
      stop
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:10)","statement":{"anno":[],"message":null,"span":"(2:7)-(2:10)","tag":"stop"},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranStopStatement.
	self assert: stmt startPos equals: 28.
	self assert: stmt endPos equals: 31.

	self assert: stmt displayArgument equals: nil


]

{ #category : #'tests-statement' }
FortranToFASTTests >> testStopStatementWithInteger [

	| stmt result |
	fortranCode := '      PROGRAM MYPROG
      stop 1
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:12)","statement":{"anno":[],"message":{"anno":[],"span":"(2:12)-(2:12)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(2:7)-(2:12)","tag":"stop"},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranStopStatement.
	self assert: stmt startPos equals: 28.
	self assert: stmt endPos equals: 33.

	self assert: stmt displayArgument equals: '1'


]

{ #category : #'tests-programUnit' }
FortranToFASTTests >> testSubroutineEmpty [

	| result rtn |
	fortranCode := '      SUBROUTINE RANK
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[],"name":"rank","options":[null,null],"span":"(1:7)-(2:9)","subprograms":null,"tag":"subroutine"}]}'.
	result := self visitJsonCode.
	
	self assert: result isCollection.
	self assert: result size equals: 1.

	rtn := result anyOne.
	self assert: rtn class equals: FASTFortranSubroutine.
	self assert: rtn parameters isEmpty.
	self assert: rtn statementBlock statements isEmpty.
	self assert: rtn startPos equals: 7.
	self assert: rtn endPos equals: 31
]

{ #category : #'tests-programUnit' }
FortranToFASTTests >> testSubroutineWithParameters [

	| result rtn param |
	fortranCode := '      SUBROUTINE SIMPLESUBROUTINE( a, b)
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(1:36)-(1:36)","tag":"value","value":{"contents":"a","tag":"variable"}},{"anno":[],"span":"(1:39)-(1:39)","tag":"value","value":{"contents":"b","tag":"variable"}}],"span":"(1:36)-(1:39)"},"blocks":[],"name":"simplesubroutine","options":[null,null],"span":"(1:7)-(2:9)","subprograms":null,"tag":"subroutine"}]}'.
	result := self visitJsonCode.
	
	self assert: result isCollection.

	rtn := result anyOne.
	self assert: rtn class equals: FASTFortranSubroutine.
	self assert: rtn name equals: 'simplesubroutine'.

	self assert: rtn statementBlock class equals: FASTFortranStatementBlock.
	self assert: rtn statementBlock statements size equals: 0.
	self assert: rtn statementBlock startPos equals: 42.

	self assert: rtn startPos equals: 7.
	self assert: rtn endPos equals: 50.
	
	self assert: rtn parameters size equals: 2.

	param := rtn parameters first.
	self assert: param name equals: 'a'.
	self assert: param startPos equals: 36.

	param := rtn parameters second.
	self assert: param name equals: 'b'.
	self assert: param startPos equals: 39.

]

{ #category : #'tests-programUnit' }
FortranToFASTTests >> testSubroutineWithParametersOnTwoLines [

	| result rtn |
	fortranCode := '      SUBROUTINE SIMPLESUBROUTINE( a,
     & b)
      continue
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(1:36)-(1:36)","tag":"value","value":{"contents":"a","tag":"variable"}},{"anno":[],"span":"(2:8)-(2:8)","tag":"value","value":{"contents":"b","tag":"variable"}}],"span":"(1:36)-(2:8)"},"blocks":[{"anno":[],"label":null,"span":"(3:7)-(3:14)","statement":{"anno":[],"span":"(3:7)-(3:14)","tag":"continue"},"tag":"statement"}],"name":"simplesubroutine","options":[null,null],"span":"(1:7)-(4:9)","subprograms":null,"tag":"subroutine"}]}'.
	result := self visitJsonCode.
	
	self assert: result isCollection.

	rtn := result anyOne.
	self assert: rtn class equals: FASTFortranSubroutine.
	self assert: rtn name equals: 'simplesubroutine'.

	self assert: rtn statementBlock class equals: FASTFortranStatementBlock.
	self assert: rtn statementBlock statements size equals: 1.
	self assert: rtn statementBlock startPos equals: 55.

	self assert: rtn parameters size equals: 2.
	self assert: rtn parameters first startPos equals: 36.
	self assert: rtn parameters second startPos equals: 46.

]

{ #category : #tests }
FortranToFASTTests >> testTokenPosition [

	| result stmnts stmt |
	fortranCode := '      PROGRAM MYPROG
       STOP
100    CONTINUE
       EXIT
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:11)","statement":{"anno":[],"message":null,"span":"(2:8)-(2:11)","tag":"stop"},"tag":"statement"},{"anno":[],"label":{"anno":[],"span":"(3:1)-(3:3)","tag":"value","value":{"contents":["100",null],"tag":"integer"}},"span":"(3:1)-(3:15)","statement":{"anno":[],"span":"(3:8)-(3:15)","tag":"continue"},"tag":"statement"},{"anno":[],"label":null,"span":"(4:8)-(4:11)","statement":{"anno":[],"span":"(4:8)-(4:11)","tag":"exit","var":null},"tag":"statement"}],"name":"myprog","span":"(1:7)-(5:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.
	
	stmnts := result first statementBlock statements.
	stmt := stmnts first.
	self assert: stmt startPos equals: 29.
	self assert: stmt endPos equals: 32.

	stmt := stmnts second.
	self assert: stmt startPos equals: 41.
	self assert: stmt endPos equals: 48.

	stmt := stmnts third.
	self assert: stmt startPos equals: 57.
	self assert: stmt endPos equals: 60.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testVariableDeclarationCharacter [

	| result stmt var |
	fortranCode := '      program main
      character*40 aString
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:26)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:20)-(2:26)","type":"scalar","variable":{"anno":[],"span":"(2:20)-(2:26)","tag":"value","value":{"contents":"astring","tag":"variable"}}}],"span":"(2:20)-(2:26)"},"span":"(2:7)-(2:26)","tag":"declaration","type":{"anno":[],"base_type":"character","selector":{"anno":[],"kind":null,"length":{"anno":[],"span":"(2:17)-(2:18)","tag":"value","value":{"contents":["40",null],"tag":"integer"}},"span":"(2:16)-(2:18)"},"span":"(2:7)-(2:18)"}},"tag":"statement"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 45.

	self assert: stmt type class equals: FASTFortranCharacterType.
	self assert: stmt type size class equals: FASTFortranIntegerLiteral.

	self assert: stmt declarators size equals: 1.
	var := stmt declarators first.
	self assert: var variable equals: 'astring'.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testVariableDeclarationInteger [

	| result stmt var |
	fortranCode := '      program main
      integer i
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:15)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:15)-(2:15)","type":"scalar","variable":{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"contents":"i","tag":"variable"}}}],"span":"(2:15)-(2:15)"},"span":"(2:7)-(2:15)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(2:7)-(2:13)"}},"tag":"statement"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 34.

	self assert: stmt type class equals: FASTFortranIntegerType.
	self assert: stmt declarators size equals: 1.
	
	var := stmt declarators first.
	self assert: var variable equals: 'i'.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testVariableDeclarationIntegerWithLength [

	| result stmt |
	fortranCode := '      program main
      integer*8 i
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:17)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:17)-(2:17)","type":"scalar","variable":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"contents":"i","tag":"variable"}}}],"span":"(2:17)-(2:17)"},"span":"(2:7)-(2:17)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":{"anno":[],"kind":{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"contents":["8",null],"tag":"integer"}},"length":null,"span":"(2:14)-(2:15)"},"span":"(2:7)-(2:15)"}},"tag":"statement"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt startPos equals: 26.

	self assert: stmt type class equals: FASTFortranIntegerType.
	self assert: stmt type size class equals: FASTFortranIntegerLiteral.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testVariableDeclarationLogical [

	| result stmt var |
	fortranCode := '      program main
      logical b
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:15)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:15)-(2:15)","type":"scalar","variable":{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"contents":"b","tag":"variable"}}}],"span":"(2:15)-(2:15)"},"span":"(2:7)-(2:15)","tag":"declaration","type":{"anno":[],"base_type":"logical","selector":null,"span":"(2:7)-(2:13)"}},"tag":"statement"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 34.

	self assert: stmt type class equals: FASTFortranLogicalType.
	self assert: stmt declarators size equals: 1.
	
	var := stmt declarators first.
	self assert: var variable equals: 'b'.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testVariableDeclarationReal [

	| result stmt var |
	fortranCode := '      program main
      real c
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:12)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:12)-(2:12)","type":"scalar","variable":{"anno":[],"span":"(2:12)-(2:12)","tag":"value","value":{"contents":"c","tag":"variable"}}}],"span":"(2:12)-(2:12)"},"span":"(2:7)-(2:12)","tag":"declaration","type":{"anno":[],"base_type":"real","selector":null,"span":"(2:7)-(2:10)"}},"tag":"statement"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 31.

	self assert: stmt type class equals: FASTFortranRealType.
	self assert: stmt declarators size equals: 1.
	
	var := stmt declarators first.
	self assert: var variable equals: 'c'.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testVariableDeclarationWithLength [

	| result stmt var |
	fortranCode := '      program main
      character var*10, str*(n)
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:26)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:20)-(2:26)","type":"scalar","variable":{"anno":[],"span":"(2:20)-(2:26)","tag":"value","value":{"contents":"astring","tag":"variable"}}}],"span":"(2:20)-(2:26)"},"span":"(2:7)-(2:26)","tag":"declaration","type":{"anno":[],"base_type":"character","selector":{"anno":[],"kind":null,"length":{"anno":[],"span":"(2:17)-(2:18)","tag":"value","value":{"contents":["40",null],"tag":"integer"}},"span":"(2:16)-(2:18)"},"span":"(2:7)-(2:18)"}},"tag":"statement"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 45.

	self assert: stmt type class equals: FASTFortranCharacterType.
	self assert: stmt type size class equals: FASTFortranIntegerLiteral.

	self assert: stmt declarators size equals: 1.
	var := stmt declarators first.
	self assert: var variable equals: 'astring'.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testVariableDeclarationWithStarSize [

	| result stmt |
	fortranCode := '      program main
      character*(*) str
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:23)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:21)-(2:23)","type":"scalar","variable":{"anno":[],"span":"(2:21)-(2:23)","tag":"value","value":{"contents":"str","tag":"variable"}}}],"span":"(2:21)-(2:23)"},"span":"(2:7)-(2:23)","tag":"declaration","type":{"anno":[],"base_type":"character","selector":{"anno":[],"kind":null,"length":{"anno":[],"span":"(2:18)-(2:18)","tag":"value","value":{"tag":"star"}},"span":"(2:16)-(2:19)"},"span":"(2:7)-(2:19)"}},"tag":"statement"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranVariableDeclarationStatement.
	self assert: stmt startPos equals: 26.
	self assert: stmt endPos equals: 42.

	self assert: stmt type class equals: FASTFortranCharacterType.
	self assert: stmt type size class equals: FASTFortranAsterisk.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testWriteComplexFormat [

	| stmt result |
	fortranCode := '      subroutine mysub ()
      WRITE( 3, ''(5F4.1)'') V
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:28)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(2:28)-(2:28)","tag":"value","value":{"contents":"v","tag":"variable"}}],"span":"(2:28)-(2:28)"},"format":{"anno":[],"list":[{"anno":[],"expr":{"anno":[],"span":"(2:14)-(2:14)","tag":"value","value":{"contents":["3",null],"tag":"integer"}},"name":null,"span":"(2:14)-(2:14)"},{"anno":[],"expr":{"anno":[],"span":"(2:17)-(2:25)","tag":"value","value":{"contents":"(5F4.1)","tag":"string"}},"name":null,"span":"(2:17)-(2:25)"}],"span":"(2:12)-(2:26)"},"span":"(2:7)-(2:28)","tag":"write"},"tag":"statement"}],"name":"mysub","options":[null,null],"span":"(1:7)-(3:9)","subprograms":null,"tag":"subroutine"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranWriteStatement.
	self assert: stmt startPos equals: 33.
	self assert: stmt endPos equals: 54.

	self assert: stmt ioParameters size equals: 2.

	self assert: stmt ioParameters first class equals: FASTFortranIntegerLiteral.
	self assert: stmt ioParameters first startPos equals: 40.
	self assert: stmt ioParameters second class equals: FASTFortranCharacterLiteral .
	self assert: stmt ioParameters second startPos equals: 43.

	self assert: stmt arguments size equals: 1.

	self assert: stmt arguments first class equals: FASTFortranScalarVariable.
	self assert: stmt arguments first startPos equals: 54.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testWriteFullIOParameters [

	| stmt result |
	fortranCode := '      subroutine mysub ()
      WRITE( 1, 2, REC=3, IOSTAT=N, ERR=8 ) X, Y
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:48)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(2:45)-(2:45)","tag":"value","value":{"contents":"x","tag":"variable"}},{"anno":[],"span":"(2:48)-(2:48)","tag":"value","value":{"contents":"y","tag":"variable"}}],"span":"(2:45)-(2:48)"},"format":{"anno":[],"list":[{"anno":[],"expr":{"anno":[],"span":"(2:14)-(2:14)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"name":null,"span":"(2:14)-(2:14)"},{"anno":[],"expr":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"contents":["2",null],"tag":"integer"}},"name":null,"span":"(2:17)-(2:17)"},{"anno":[],"expr":{"anno":[],"span":"(2:24)-(2:24)","tag":"value","value":{"contents":["3",null],"tag":"integer"}},"name":"rec","span":"(2:20)-(2:24)"},{"anno":[],"expr":{"anno":[],"span":"(2:34)-(2:34)","tag":"value","value":{"contents":"n","tag":"variable"}},"name":"iostat","span":"(2:27)-(2:34)"},{"anno":[],"expr":{"anno":[],"span":"(2:41)-(2:41)","tag":"value","value":{"contents":["8",null],"tag":"integer"}},"name":"err","span":"(2:37)-(2:41)"}],"span":"(2:12)-(2:43)"},"span":"(2:7)-(2:48)","tag":"write"},"tag":"statement"}],"name":"mysub","options":[null,null],"span":"(1:7)-(3:9)","subprograms":null,"tag":"subroutine"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranWriteStatement.
	self assert: stmt startPos equals: 33.
	self assert: stmt endPos equals: 74.

	self assert: stmt ioParameters size equals: 5.

	self assert: stmt ioParameters first class equals: FASTFortranIntegerLiteral.
	self assert: stmt ioParameters first startPos equals: 40.
	self assert: stmt ioParameters second class equals: FASTFortranIntegerLiteral.
	self assert: stmt ioParameters second startPos equals: 43.
	self assert: stmt ioParameters third class equals: FASTFortranAssignmentExpression.
	self assert: stmt ioParameters third startPos equals: 46.
	self assert: stmt ioParameters fourth class equals: FASTFortranAssignmentExpression.
	self assert: stmt ioParameters fourth startPos equals: 53.
	self assert: stmt ioParameters fifth class equals: FASTFortranAssignmentExpression.
	self assert: stmt ioParameters fifth startPos equals: 63.

	self assert: stmt arguments size equals: 2.

	self assert: stmt arguments first class equals: FASTFortranScalarVariable.
	self assert: stmt arguments first startPos equals: 71.
	self assert: stmt arguments second class equals: FASTFortranScalarVariable.
	self assert: stmt arguments second startPos equals: 74.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testWriteStarStarIOParameters [

	| stmt result |
	fortranCode := '      subroutine mysub ()
      WRITE( *, * ) ''I/O error'' 
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:31)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(2:21)-(2:31)","tag":"value","value":{"contents":"I/O error","tag":"string"}}],"span":"(2:21)-(2:31)"},"format":{"anno":[],"list":[{"anno":[],"expr":{"anno":[],"span":"(2:14)-(2:14)","tag":"value","value":{"tag":"star"}},"name":null,"span":"(2:14)-(2:14)"},{"anno":[],"expr":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"tag":"star"}},"name":null,"span":"(2:17)-(2:17)"}],"span":"(2:12)-(2:19)"},"span":"(2:7)-(2:31)","tag":"write"},"tag":"statement"}],"name":"mysub","options":[null,null],"span":"(1:7)-(3:9)","subprograms":null,"tag":"subroutine"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranWriteStatement.
	self assert: stmt startPos equals: 33.
	self assert: stmt endPos equals: 57.

	self assert: stmt ioParameters size equals: 2.

	self assert: stmt ioParameters first class equals: FASTFortranAsterisk.
	self assert: stmt ioParameters first startPos equals: 40.
	self assert: stmt ioParameters second class equals: FASTFortranAsterisk.
	self assert: stmt ioParameters second startPos equals: 43.

	self assert: stmt arguments size equals: 1.

	self assert: stmt arguments first class equals: FASTFortranCharacterLiteral.
	self assert: stmt arguments first startPos equals: 47.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testWriteToInternalFile [
	"Write Internal File seems to be just a String variable"

	| stmt result |
	fortranCode := '      subroutine mysub ()
      WRITE( STRING, 1) ''A message''
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"tmpFASTSource.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:35)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(2:25)-(2:35)","tag":"value","value":{"contents":"A message","tag":"string"}}],"span":"(2:25)-(2:35)"},"format":{"anno":[],"list":[{"anno":[],"expr":{"anno":[],"span":"(2:14)-(2:19)","tag":"value","value":{"contents":"string","tag":"variable"}},"name":null,"span":"(2:14)-(2:19)"},{"anno":[],"expr":{"anno":[],"span":"(2:22)-(2:22)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"name":null,"span":"(2:22)-(2:22)"}],"span":"(2:12)-(2:23)"},"span":"(2:7)-(2:35)","tag":"write"},"tag":"statement"}],"name":"mysub","options":[null,null],"span":"(1:7)-(3:9)","subprograms":null,"tag":"subroutine"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranWriteStatement.
	self assert: stmt startPos equals: 33.
	self assert: stmt endPos equals: 61.

	self assert: stmt ioParameters size equals: 2.

	self assert: stmt ioParameters first class equals: FASTFortranScalarVariable.
	self assert: stmt ioParameters first startPos equals: 40.
	self assert: stmt ioParameters second class equals: FASTFortranIntegerLiteral.
	self assert: stmt ioParameters second startPos equals: 48.

	self assert: stmt arguments size equals: 1.

	self assert: stmt arguments first class equals: FASTFortranCharacterLiteral.
	self assert: stmt arguments first startPos equals: 51.
]
