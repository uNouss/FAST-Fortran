Class {
	#name : #FortranToFASTTests,
	#superclass : #FortranToFASTTestSetUp,
	#instVars : [
		'fortranCode',
		'jsonCode'
	],
	#category : #'FAST-Fortran-Tests-Visitor'
}

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

{ #category : #'tests-expression' }
FortranToFASTTests >> testAssignementStringLiteral [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
          c = ''once upon a time''
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:11)-(2:32)","statement":{"anno":[],"expression":{"anno":[],"span":"(2:15)-(2:32)","tag":"value","value":{"contents":"once upon a time","tag":"string"}},"span":"(2:11)-(2:32)","tag":"assign_expression","target":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.
	self assert: stmt startPos equals: 32.

	self assert: stmt expression class equals: FASTFortranCharacterLiteral.
	self assert: stmt expression primitiveValue equals: 'once upon a time'.
	self assert: stmt expression startPos equals: 36.

]

{ #category : #'tests-expression' }
FortranToFASTTests >> testBinaryExpressionAddition [
	
	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       i = 5 + 6
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:16)","statement":{"anno":[],"expression":{"anno":[],"left":{"anno":[],"span":"(2:12)-(2:12)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"addition"},"right":{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:12)-(2:16)","tag":"binary"},"span":"(2:8)-(2:16)","tag":"assign_expression","target":{"anno":[],"span":"(2:8)-(2:8)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	asnmt := result first statementBlock statements first.
	self assert: asnmt class equals: FASTFortranAssignmentStatement.	
	
	expr := asnmt expression.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: 'addition'.
	self assert: expr startPos equals: 33.

	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr left startPos equals: 33.

	self assert: expr right class equals: FASTFortranIntegerLiteral.
	self assert: expr right startPos equals: 37.
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
	self assert: expr operator equals: 'division'.
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
	self assert: expr operator equals: 'exponentiation'.
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
	self assert: expr operator equals: 'multiplication'.
	self assert: expr startPos equals: 33.

	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr left startPos equals: 33.

	self assert: expr right class equals: FASTFortranIntegerLiteral.
	self assert: expr right startPos equals: 37.
]

{ #category : #'tests-expression' }
FortranToFASTTests >> testBinaryExpressionSubtraction [

	| result asnmt expr |
	fortranCode := '      PROGRAM MYPROG
       i = 5 - 6
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:16)","statement":{"anno":[],"expression":{"anno":[],"left":{"anno":[],"span":"(2:12)-(2:12)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"subtraction"},"right":{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:12)-(2:16)","tag":"binary"},"span":"(2:8)-(2:16)","tag":"assign_expression","target":{"anno":[],"span":"(2:8)-(2:8)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	asnmt := result first statementBlock statements first.
	self assert: asnmt class equals: FASTFortranAssignmentStatement.

	expr := asnmt expression.
	self assert: expr class equals: FASTFortranBinaryExpression.
	self assert: expr operator equals: 'subtraction'.
	self assert: expr startPos equals: 33.

	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr left startPos equals: 33.

	self assert: expr right class equals: FASTFortranIntegerLiteral.
	self assert: expr right startPos equals: 37.
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
FortranToFASTTests >> testContinueStatement [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
       CONTINUE
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:15)","statement":{"anno":[],"span":"(2:8)-(2:15)","tag":"continue"},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranContinueStatement.
	self assert: stmt startPos equals: 29
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

	control := stmt loopControl.
	self assert: control class equals: FASTFortranLoopControlExpression.
	self assert: control limit class equals: FASTFortranScalarVariable.
	self assert: control limit name equals: 'max'.
	self assert: control increment isNil.
	self assert: control startPos equals: 29.

	self assert: control init class equals: FASTFortranAssignmentStatement.
	self assert: control init variable class equals: FASTFortranScalarVariable.
	self assert: control init variable name equals: 'i'.

	self assert: control init expression class equals: FASTFortranIntegerLiteral.
	self assert: control init expression primitiveValue equals: '1'.


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

	self assert: stmt statementBlock comments size equals: 1.
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
	"self assert: fct returnType class equals: FASTFortranType.
	self assert: fct returnType name equals: 'integer'."

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
]

{ #category : #'tests-programUnit' }
FortranToFASTTests >> testFunctionWithComment [

	| result fct |
	fortranCode := '      integer function aFct()
C comment in a function''s body
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"fortran77.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"comment":" comment in a function''s body","span":"(2:1)-(2:30)","tag":"comment"}],"name":"afct","result":null,"span":"(1:7)-(3:9)","subprograms":null,"tag":"function","type":{"anno":[],"base_type":"integer","selector":null,"span":"(1:7)-(1:13)"}}]}'.
	result := self visitJsonCode.

	self assert: result isNotEmpty.
	fct := result first.

	self assert: fct class equals: FASTFortranFunction.
	self assert: fct name equals: 'afct'.
	self assert: fct statementBlock statements isEmpty.
	self assert: fct statementBlock comments size equals: 1.
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
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[],"name":"afct","result":null,"span":"(1:7)-(2:9)","subprograms":null,"tag":"function","type":{"anno":[],"base_type":"integer","selector":null,"span":"(1:7)-(1:13)"}}]}'.
	result := self visitJsonCode.

	self assert: result isNotEmpty.
	fct := result first.

	self assert: fct class equals: FASTFortranFunction.
	self assert: fct name equals: 'afct'.
	self assert: fct parameters isEmpty.
	self assert: fct statementBlock statements isEmpty.
	self assert: fct startPos equals: 7.
	"self assert: fct returnType class equals: FASTFortranType.
	self assert: fct returnType name equals: 'integer'."

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testIfElseIf [

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

	conditional := result first statementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatementBlock statements size equals: 1.
	self assert: conditional elseStatementBlock statements size equals: 1.

	conditional := conditional elseStatementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatementBlock statements size equals: 1.
	self assert: conditional elseStatementBlock statements size equals: 1.

	conditional := conditional elseStatementBlock statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatementBlock statements size equals: 1.
	self assert: conditional elseStatementBlock statements size equals: 1.
	
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
	self assert: conditional thenStatementBlock statements size equals: 1.
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
	self assert: stmt class equals: FASTFortranImplicitStatement
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
	self assert: body comments first content equals: '23456789 123456789 123456789 123456789 123456789 123456789 12'.
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

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testStatementAssignement [

	| result stmt |
	fortranCode := '      PROGRAM MYPROG
          c = 1
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:11)-(2:15)","statement":{"anno":[],"expression":{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(2:11)-(2:15)","tag":"assign_expression","target":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.

	self assert: stmt variable class equals: FASTFortranScalarVariable.
	self assert: stmt variable name equals: 'c'.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testStatementCallSubroutine [

	| result body arg |
	fortranCode := '      PROGRAM TESTALT
       CALL RANK ( N, *8 )
      END 
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:26)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"expr":{"contents":{"anno":[],"span":"(2:20)-(2:20)","tag":"value","value":{"contents":"n","tag":"variable"}},"tag":"expr"},"name":null,"span":"(2:20)-(2:20)"},{"anno":[],"expr":{"contents":{"anno":[],"span":"(2:23)-(2:24)","tag":"return_spec","target":{"anno":[],"span":"(2:24)-(2:24)","tag":"value","value":{"contents":["8",null],"tag":"integer"}}},"tag":"expr"},"name":null,"span":"(2:23)-(2:24)"}],"span":"(2:18)-(2:26)"},"function":{"anno":[],"span":"(2:13)-(2:16)","tag":"value","value":{"contents":"rank","tag":"variable"}},"span":"(2:8)-(2:26)","tag":"call"},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first class equals: FASTFortranProgramMain.

	body := result first statementBlock statements.
	self assert: body size equals: 1.
	self assert: body first class equals: FASTFortranCallStatement.
	self assert: body first name equals: 'rank'.
	self assert: body first arguments size equals: 2.

	arg := body first arguments first.
	self assert: arg class equals: FASTFortranScalarVariable.
	self assert: arg name equals: 'n'.

	arg := body first arguments second.
	self assert: arg class equals: FASTFortranIntegerLiteral.
	self assert: arg primitiveValue equals: '8'.
	self flag: 'what happened to "*" ("*8")?'

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testStatementCallWrite [

	| result body stmt |
	fortranCode := '      PROGRAM TESTALT
       WRITE (*,*) "OK - Normal Return [n=0]"
      END 
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:45)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(2:20)-(2:45)","tag":"value","value":{"contents":"OK - Normal Return [n=0]","tag":"string"}}],"span":"(2:20)-(2:45)"},"format":{"anno":[],"list":[{"anno":[],"expr":{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"tag":"star"}},"name":null,"span":"(2:15)-(2:15)"},{"anno":[],"expr":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"tag":"star"}},"name":null,"span":"(2:17)-(2:17)"}],"span":"(2:14)-(2:18)"},"span":"(2:8)-(2:45)","tag":"write"},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first class equals: FASTFortranProgramMain.

	body := result first statementBlock statements.
	self assert: body size equals: 1.

	stmt := body first.
	self assert: stmt class equals: FASTFortranWriteStatement.
	self assert: stmt format size equals: 2.
	stmt format do: [ :each |
		self assert: each class equals: FASTFortranAsterisk
	].

	self assert: stmt arguments size equals: 1.

]

{ #category : #'tests-statement' }
FortranToFASTTests >> testStatementExit [

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
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testStatementGoto [

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
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testStatementPrintMultipleVariables [

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
FortranToFASTTests >> testStatementPrintOneVariable [

	| stmt result arguments |
	fortranCode := '      subroutine mysub (msg)
      PRINT *, X
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(1:25)-(1:27)","tag":"value","value":{"contents":"msg","tag":"variable"}}],"span":"(1:25)-(1:27)"},"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:16)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"contents":"x","tag":"variable"}}],"span":"(2:16)-(2:16)"},"format":{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"tag":"star"}},"span":"(2:7)-(2:16)","tag":"print"},"tag":"statement"}],"name":"mysub","options":[null,null],"span":"(1:7)-(3:9)","subprograms":null,"tag":"subroutine"}]}'.
	result := self visitJsonCode.

	stmt := result first statementBlock statements first.
	self assert: stmt class equals: FASTFortranPrintStatement.
	self assert: stmt format class equals: FASTFortranAsterisk.
	arguments := stmt arguments.
	self assert: arguments size equals: 1.
	self assert: arguments first class equals: FASTFortranScalarVariable.
	self assert: arguments first name equals: 'x'
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testStatementStop [

	| result stmt |
	fortranCode := '      PROGRAM TESTALT
       STOP
      END 
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:11)","statement":{"anno":[],"message":null,"span":"(2:8)-(2:11)","tag":"stop"},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranStopStatement.
	self assert: stmt displayArgument equals: nil.
]

{ #category : #'tests-statement' }
FortranToFASTTests >> testStatementStopWithMessage [

	| result stmt |
	fortranCode := '      PROGRAM TESTALT
       STOP 10
      END 
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:14)","statement":{"anno":[],"message":{"anno":[],"span":"(2:13)-(2:14)","tag":"value","value":{"contents":["10",null],"tag":"integer"}},"span":"(2:8)-(2:14)","tag":"stop"},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.
	result := self visitJsonCode.

	self assert: result first statementBlock statements size equals: 1.

	stmt := result first statementBlock statements first.	
	self assert: stmt class equals: FASTFortranStopStatement.
	self assert: stmt displayArgument class equals: FASTFortranIntegerLiteral .
	self assert: stmt displayArgument primitiveValue equals: '10'
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
	self assert: stmt label class equals: FASTFortranIntegerLiteral.
	self assert: stmt label primitiveValue equals: '10'.
]

{ #category : #'tests-programUnit' }
FortranToFASTTests >> testSubroutineEmpty [

	| result |
	fortranCode := '      SUBROUTINE RANK
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[],"name":"rank","options":[null,null],"span":"(1:7)-(2:9)","subprograms":null,"tag":"subroutine"}]}'.
	result := self visitJsonCode.
	
	self assert: result isCollection.
	self assert: result size equals: 1.
	self assert: result first class equals: FASTFortranSubroutine.
	self assert: result first parameters isEmpty.
	self assert: result first statementBlock statements isEmpty
]

{ #category : #'tests-programUnit' }
FortranToFASTTests >> testSubroutineWithParameters [

	| result |
	fortranCode := '      SUBROUTINE RANK( A, B)
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(1:24)-(1:24)","tag":"value","value":{"contents":"a","tag":"variable"}},{"anno":[],"span":"(1:27)-(1:27)","tag":"value","value":{"contents":"b","tag":"variable"}}],"span":"(1:24)-(1:27)"},"blocks":[],"name":"rank","options":[null,null],"span":"(1:7)-(2:9)","subprograms":null,"tag":"subroutine"}]}'.
	result := self visitJsonCode.
	
	self assert: result isCollection.
	self assert: result size equals: 1.
	self assert: result first class equals: FASTFortranSubroutine.
	self assert: result first name equals: 'rank'.
	self assert: result first parameters size equals: 2.
]

{ #category : #'tests-statement' }
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
	self assert: stmt class equals: FASTFortranDeclarationStatement.
	self assert: stmt type class equals: FASTFortranCharacterType.
	self assert: stmt declarators size equals: 1.
	
	var := stmt declarators first.
	self assert: var class equals: FASTFortranScalarVariable.
	self assert: var name equals: 'astring'.
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
	self assert: stmt class equals: FASTFortranDeclarationStatement.
	self assert: stmt type class equals: FASTFortranIntegerType.
	self assert: stmt declarators size equals: 1.
	
	var := stmt declarators first.
	self assert: var class equals: FASTFortranScalarVariable.
	self assert: var name equals: 'i'.
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
	self assert: stmt class equals: FASTFortranDeclarationStatement.
	self assert: stmt type class equals: FASTFortranLogicalType.
	self assert: stmt declarators size equals: 1.
	
	var := stmt declarators first.
	self assert: var class equals: FASTFortranScalarVariable.
	self assert: var name equals: 'b'.
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
	self assert: stmt class equals: FASTFortranDeclarationStatement.
	self assert: stmt type class equals: FASTFortranRealType.
	self assert: stmt declarators size equals: 1.
	
	var := stmt declarators first.
	self assert: var class equals: FASTFortranScalarVariable.
	self assert: var name equals: 'c'.
]

{ #category : #running }
FortranToFASTTests >> visitJsonCode [
	| visitor |
	visitor := FASTFortranJsonVisitor new.
	visitor initLineSizes: fortranCode.
	^visitor visitProgramFile: (NeoJSONReader fromString: jsonCode)
]
