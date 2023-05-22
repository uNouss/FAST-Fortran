Class {
	#name : #FortranToFASTBasicTests,
	#superclass : #FortranToFASTTestSetUp,
	#category : #'FAST-Fortran-JSON-Visitor-Tests'
}

{ #category : #'tests-expression' }
FortranToFASTBasicTests >> testAssignementIntegerLiteral [

	| stmt result |
	result := self parse: '      PROGRAM MYPROG
          c = 1
      END
'.

	stmt := result first  statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.

	self assert: stmt expression class equals: FASTFortranIntegerLiteral.
	self assert: stmt expression value equals: '1'.

]

{ #category : #'tests-expression' }
FortranToFASTBasicTests >> testAssignementRealLiteral [

	| result stmt |
	result := self parse: '      PROGRAM MYPROG
          c = 2.12
      END
'.

	stmt := result first  statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.

	self assert: stmt expression class equals: FASTFortranRealLiteral.
	self assert: stmt expression value equals: '2.12'.

]

{ #category : #'tests-expression' }
FortranToFASTBasicTests >> testAssignementStringLiteral [

	| result stmt |
	result := self parse: '      PROGRAM MYPROG
          c = ''once upon a time''
      END
'.

	stmt := result first  statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.

	self assert: stmt expression class equals: FASTFortranStringLiteral.
	self assert: stmt expression value equals: 'once upon a time'.

]

{ #category : #'tests-expression' }
FortranToFASTBasicTests >> testBinaryExpressionAddition [
	
	| result expr |
	result := self parse: '      PROGRAM MYPROG
       i = 5 + 6
      END
'.

	self assert: result first statements first class equals: FASTFortranAssignmentStatement.

	expr := result first statements first expression.
	self assert: expr class equals: FASTFortranArithmeticExpression.
	self assert: expr operator equals: 'addition'.
	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr right class equals: FASTFortranIntegerLiteral
]

{ #category : #'tests-expression' }
FortranToFASTBasicTests >> testBinaryExpressionDivision [
	
	| result expr |
	result := self parse: '      PROGRAM MYPROG
       i = 5 / 6
      END
'.

	self assert: result first statements first class equals: FASTFortranAssignmentStatement.

	expr := result first statements first expression.
	self assert: expr class equals: FASTFortranArithmeticExpression.
	self assert: expr operator equals: 'division'.
	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr right class equals: FASTFortranIntegerLiteral
]

{ #category : #'tests-expression' }
FortranToFASTBasicTests >> testBinaryExpressionEqKeyword [
	
	| result expr |
	result := self parse: '      PROGRAM MYPROG
       IF ( 5 .eq. 6 ) THEN
       END IF
      END
'.

	self assert: result first  statements first class equals: FASTFortranIfBlockStatement.

	expr := result first  statements first condition.
	self assert: expr class equals: FASTFortranLogicalExpression.
	self assert: expr operator equals: 'eq'.
	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr right class equals: FASTFortranIntegerLiteral
]

{ #category : #'tests-expression' }
FortranToFASTBasicTests >> testBinaryExpressionExponentiation [
	
	| result expr |
	result := self parse: '      PROGRAM MYPROG
       i = 5 ** 6
      END
'.

	self assert: result first statements first class equals: FASTFortranAssignmentStatement.

	expr := result first statements first expression.
	self assert: expr class equals: FASTFortranArithmeticExpression.
	self assert: expr operator equals: 'exponentiation'.
	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr right class equals: FASTFortranIntegerLiteral
]

{ #category : #'tests-expression' }
FortranToFASTBasicTests >> testBinaryExpressionGtKeyword [
	
	| result expr |
	result := self parse: '      PROGRAM MYPROG
       IF ( 5 .gt. 6 ) THEN
       END IF
      END
'.

	self assert: result first  statements first class equals: FASTFortranIfBlockStatement.

	expr := result first  statements first condition.
	self assert: expr class equals: FASTFortranLogicalExpression.
	self assert: expr operator equals: 'gt'.
	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr right class equals: FASTFortranIntegerLiteral
]

{ #category : #'tests-expression' }
FortranToFASTBasicTests >> testBinaryExpressionGtSymbol [
	
	| result expr |
	result := self parse: '      PROGRAM MYPROG
       IF ( 5 > 6 ) THEN
       END IF
      END
'.

	self assert: result first  statements first class equals: FASTFortranIfBlockStatement.

	expr := result first  statements first condition.
	self assert: expr class equals: FASTFortranLogicalExpression.
	self assert: expr operator equals: 'gt'.
	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr right class equals: FASTFortranIntegerLiteral
]

{ #category : #'tests-expression' }
FortranToFASTBasicTests >> testBinaryExpressionLtKeyword [
	
	| result expr |
	result := self parse: '      PROGRAM MYPROG
       IF ( 5 .Lt. 6 ) THEN
       END IF
      END
'.

	self assert: result first  statements first class equals: FASTFortranIfBlockStatement.

	expr := result first  statements first condition.
	self assert: expr class equals: FASTFortranLogicalExpression.
	self assert: expr operator equals: 'lt'.
	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr right class equals: FASTFortranIntegerLiteral
]

{ #category : #'tests-expression' }
FortranToFASTBasicTests >> testBinaryExpressionLtSymbol [
	
	| result expr |
	result := self parse: '      PROGRAM MYPROG
       IF ( 5 < 6 ) THEN
       END IF
      END
'.

	self assert: result first  statements first class equals: FASTFortranIfBlockStatement.

	expr := result first  statements first condition.
	self assert: expr class equals: FASTFortranLogicalExpression.
	self assert: expr operator equals: 'lt'.
	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr right class equals: FASTFortranIntegerLiteral
]

{ #category : #'tests-expression' }
FortranToFASTBasicTests >> testBinaryExpressionMultiplication [
	
	| result expr |
	result := self parse: '      PROGRAM MYPROG
       i = 5 * 6
      END
'.

	self assert: result first statements first class equals: FASTFortranAssignmentStatement.

	expr := result first statements first expression.
	self assert: expr class equals: FASTFortranArithmeticExpression.
	self assert: expr operator equals: 'multiplication'.
	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr right class equals: FASTFortranIntegerLiteral
]

{ #category : #'tests-expression' }
FortranToFASTBasicTests >> testBinaryExpressionSubtraction [
	
	| result expr |
	result := self parse: '      PROGRAM MYPROG
       i = 5 - 6
      END
'.

	self assert: result first statements first class equals: FASTFortranAssignmentStatement.

	expr := result first statements first expression.
	self assert: expr class equals: FASTFortranArithmeticExpression.
	self assert: expr operator equals: 'subtraction'.
	self assert: expr left class equals: FASTFortranIntegerLiteral.
	self assert: expr right class equals: FASTFortranIntegerLiteral
]

{ #category : #'tests-programUnit' }
FortranToFASTBasicTests >> testBlockData [


	| result bd |
	
	result := self
		        parse: '      block data myblck
      common /mycom/ i
      end
 '.

	self skip.
	bd := result first first. "unpacking"
	self assert: bd class equals: FASTFortranBlockData.
	self assert: bd name equals: 'myblck'.  
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testDoStatementEmptyNoIncrement [
	| result stmt control |
	result := self parse: '      program main
      do i=1, max
      end do
      end
'.

	self assert: result first statements size equals: 1.

	stmt := result first statements first.	
	self assert: stmt class equals: FASTFortranDoStatement.
	self assert: stmt loopControl isNotNil.
	self assert: stmt statements isEmpty.

	control := stmt loopControl.
	self assert: control class equals: FASTFortranLoopControlExpression.
	self assert: control limit class equals: FASTFortranVariableExpression.
	self assert: control limit name equals: 'max'.
	self assert: control increment isNil.

	self assert: control init class equals: FASTFortranAssignmentStatement.
	self assert: control init variable class equals: FASTFortranVariableExpression.
	self assert: control init variable name equals: 'i'.
	self assert: control init expression class equals: FASTFortranIntegerLiteral.
	self assert: control init expression value equals: '1'.
	

]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testExternalStatement [
	| result stmt |
	result := self parse: '      program main
      external mypnt
      end
'.

	self assert: result first statements size equals: 1.

	stmt := result first statements first.	
	self assert: stmt class equals: FASTFortranExternalStatement.
	self assert: stmt name equals: 'mypnt'

]

{ #category : #'tests-programUnit' }
FortranToFASTBasicTests >> testFunctionNoParameter [
	| result fct |
	result := self parse: '      integer function aFct()
      end
 '.

	self assert: result isNotEmpty.
	fct := result first.

	self assert: fct class equals: FASTFortranFunction.
	self assert: fct name equals: 'afct'.
	self assert: fct parameters isEmpty.
	self assert: fct statements isEmpty.
	"self assert: fct returnType class equals: FASTFortranType.
	self assert: fct returnType name equals: 'integer'."

]

{ #category : #'tests-programUnit' }
FortranToFASTBasicTests >> testFunctionWithParameter [
	| result fct param |
	result := self parse: '
      integer function aFct(i,j)
      end
 '.

	self assert: result isNotEmpty.
	fct := result first.

	self assert: fct class equals: FASTFortranFunction.
	self assert: fct parameters size equals: 2.

	self flag: 'should be a FASTFortranParameter, not a FASTFortranVariableExpression ?'.
	param := fct parameters first.
	self assert: param class equals: FASTFortranVariableExpression.
	self assert: param name equals: 'i'.

	param := fct parameters second.
	self assert: param class equals: FASTFortranVariableExpression.
	self assert: param name equals: 'j'.

]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testIfElseIf [

	| result conditional |
	result := self parse: '      PROGRAM MYPROG
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

	conditional := result first statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatements size equals: 1.
	self assert: conditional elseStatements size equals: 1.

	conditional := conditional elseStatements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatements size equals: 1.
	self assert: conditional elseStatements size equals: 1.

	conditional := conditional elseStatements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatements size equals: 1.
	self assert: conditional elseStatements size equals: 1.
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testIfElseWithStatement [

	| result conditional |
	
	result := self parse: '      PROGRAM MYPROG
       IF ( A ) THEN 
       ELSE
        I = 1 
       END IF
      END
'.

	conditional := result first statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatements size equals: 0.
	self assert: conditional elseStatements size equals: 1.
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testIfEmpty [
	
	| result conditional |
	result := self parse: '      PROGRAM MYPROG
       IF ( A ) THEN
       END IF
      END
'.
	conditional := result first statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional condition class equals: FASTFortranVariableExpression.
	self assert: conditional condition name equals: 'a'.
	self assert: conditional thenStatements size equals: 0.
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testIfThenWithStatement [
	
	| result conditional |
	result := self parse: '      PROGRAM MYPROG
       IF ( A ) THEN
        I = 1
       END IF
      END
'.

	conditional := result first statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatements size equals: 1.
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testIfThenWithTwoStatements [
	
	| result conditional |
	result := self parse: '      PROGRAM MYPROG
      if (iur .eq. 0) then 
         write(*,*) '' user'',name,'' does not exist''
         return
      end if 
      END
'.

	conditional := result first statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatements size equals: 2.

	self assert: conditional thenStatements first class equals: FASTFortranWriteStatement.
	self assert: conditional thenStatements second class equals: FASTFortranReturnStatement

]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testImplicitNoneStatement [
	
	| result stmt |
	result := self parse: '      PROGRAM MYPROG
       implicit none
      END
'.

	stmt := result first statements first.
	self assert: stmt class equals: FASTFortranImplicitStatement
]

{ #category : #'tests-programUnit' }
FortranToFASTBasicTests >> testMainProgram [
	| result body |

	result := self parse: '      program main
      implicit none
c23456789 123456789 123456789 123456789 123456789 123456789 12
      end
 '.

	self assert: result size equals: 1.
	self assert: result first class equals: FASTFortranProgramMain.

	body := result first statements.
	self assert: body isCollection.
	self assert: body size equals: 2.
	self assert: body first class equals: FASTFortranImplicitStatement.
	self assert: body second class equals: FASTFortranComment.
	self assert: body second content equals: '23456789 123456789 123456789 123456789 123456789 123456789 12'.
]

{ #category : #'tests-programUnit' }
FortranToFASTBasicTests >> testMainProgramAndSubroutine [

	| result progUnit |
	result := self parse: '      PROGRAM TESTALT
      END 
      
      SUBROUTINE RANK
      END
'.

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
FortranToFASTBasicTests >> testMainProgramEmpty [

	| result |
	result := self parse: '      program main
      end
 '.
	
	self assert: result isCollection.
	self assert: result size equals: 1.
	self assert: result first class equals: FASTFortranProgramMain.
	self assert: result first name equals: 'main'.
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testReturnStatementEmpty [
	
	| stmt result |
	result := self parse: '      PROGRAM MYPROG
      return
      END
'.

	stmt := result first statements first.
	self assert: stmt class equals: FASTFortranReturnStatement.

]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testStatementAssignement [

	| result stmt |
	result := self parse: '      PROGRAM MYPROG
          c = 1
      END
'.

	stmt := result first statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.

	self assert: stmt variable class equals: FASTFortranVariableExpression.
	self assert: stmt variable name equals: 'c'.
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testStatementCallSubroutine [

	| result body arg |
	result := self parse: '      PROGRAM TESTALT
       CALL RANK ( N, *8 )
      END 
'.

	self assert: result first class equals: FASTFortranProgramMain.

	body := result first statements.
	self assert: body size equals: 1.
	self assert: body first class equals: FASTFortranCallStatement.
	self assert: body first name equals: 'rank'.
	self assert: body first arguments size equals: 2.

	arg := body first arguments first.
	self assert: arg class equals: FASTFortranVariableExpression.
	self assert: arg name equals: 'n'.

	arg := body first arguments second.
	self assert: arg class equals: FASTFortranIntegerLiteral.
	self assert: arg value equals: '8'.
	self flag: 'what happened to "*" ("*8")?'

]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testStatementCallWrite [

	| result body stmt |
	result := self parse: '      PROGRAM TESTALT
       WRITE (*,*) "OK - Normal Return [n=0]"
      END 
'.

	self assert: result first class equals: FASTFortranProgramMain.

	body := result first statements.
	self assert: body size equals: 1.

	stmt := body first.
	self assert: stmt class equals: FASTFortranWriteStatement.
	self assert: stmt format size equals: 2.
	stmt format do: [ :each |
		self assert: each class equals: FASTFortranAsterisk
	].

	self assert: stmt iolist size equals: 1.

]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testStatementExit [

	| result stmt |
	result := self parse: '      PROGRAM TESTALT
       exit
      END 
'.

	self assert: result first statements size equals: 1.

	stmt := result first statements first.	
	self assert: stmt class equals: FASTFortranExitStatement.
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testStatementGoto [

	| result stmt |
	result := self parse: '      PROGRAM TESTALT
       GOTO 100
      END 
'.

	self assert: result first statements size equals: 1.

	stmt := result first statements first.
	self assert: stmt class equals: FASTFortranGoToStatement.
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testStatementPrintMultipleVariables [
	
	| stmt result  var |
	result := self parse: '      subroutine mysub (msg)
      PRINT *, X, Y, Z
      end
'.

	stmt := result first statements first.
	self assert: stmt class equals: FASTFortranPrintStatement.
	self assert: stmt format class equals: FASTFortranAsterisk.
	self assert: stmt iolist size equals: 3.

	var := stmt iolist first.
	self assert: var class equals: FASTFortranVariableExpression.
	self assert: var name equals: 'x'.

	var := stmt iolist second.
	self assert: var class equals: FASTFortranVariableExpression.
	self assert: var name equals: 'y'.

	var := stmt iolist third.
	self assert: var class equals: FASTFortranVariableExpression.
	self assert: var name equals: 'z'
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testStatementPrintOneVariable [
	
	| stmt result |
	result := self parse: '      subroutine mysub (msg)
      PRINT *, X
      end
'.

	stmt := result first statements first.
	self assert: stmt class equals: FASTFortranPrintStatement.
	self assert: stmt format class equals: FASTFortranAsterisk.
	self assert: stmt iolist size equals: 1.
	self assert: stmt iolist first class equals: FASTFortranVariableExpression.
	self assert: stmt iolist first name equals: 'x'
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testStatementStop [

	| result stmt |
	result := self parse: '      PROGRAM TESTALT
       STOP
      END 
'.

	self assert: result first statements size equals: 1.

	stmt := result first statements first.	
	self assert: stmt class equals: FASTFortranStopStatement.
	self assert: stmt displayArgument equals: nil.
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testStatementStopWithMessage [

	| result stmt |
	result := self parse: '      PROGRAM TESTALT
       STOP 10
      END 
'.

	self assert: result first statements size equals: 1.

	stmt := result first statements first.	
	self assert: stmt class equals: FASTFortranStopStatement.
	self assert: stmt displayArgument class equals: FASTFortranIntegerLiteral .
	self assert: stmt displayArgument value equals: '10'
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testStatementWithLabel [

	| result stmt |
	result := self parse: '      PROGRAM TESTALT
10     STOP
      END 
'.

	self assert: result first statements size equals: 1.

	stmt := result first statements first.	
	self assert: stmt class equals: FASTFortranStopStatement.
	self assert: stmt label class equals: FASTFortranIntegerLiteral.
	self assert: stmt label value equals: '10'.
]

{ #category : #'tests-programUnit' }
FortranToFASTBasicTests >> testSubroutineEmpty [

	| result |
	result := self parse: '      SUBROUTINE RANK
      end
 '.
	
	self assert: result isCollection.
	self assert: result size equals: 1.
	self assert: result first class equals: FASTFortranSubroutine.
	self assert: result first parameters isEmpty.
	self assert: result first statements isEmpty
]

{ #category : #'tests-programUnit' }
FortranToFASTBasicTests >> testSubroutineWithParameters [

	| result |
	result := self parse: '      SUBROUTINE RANK( A, B)
      end
 '.
	
	self assert: result isCollection.
	self assert: result size equals: 1.
	self assert: result first class equals: FASTFortranSubroutine.
	self assert: result first name equals: 'rank'.
	self assert: result first parameters size equals: 2.
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testVariableDeclarationCharacter [
	| result stmt var |
	result := self parse: '      program main
      character*40 aString
      end
'.

	self assert: result first statements size equals: 1.

	stmt := result first statements first.	
	self assert: stmt class equals: FASTFortranDeclarationStatement.
	self assert: stmt type class equals: FASTFortranCharacterType.
	self assert: stmt declarators size equals: 1.
	
	var := stmt declarators first.
	self assert: var class equals: FASTFortranVariableExpression.
	self assert: var name equals: 'astring'.
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testVariableDeclarationInteger [
	| result stmt var |
	result := self parse: '      program main
      integer i
      end
'.

	self assert: result first statements size equals: 1.

	stmt := result first statements first.	
	self assert: stmt class equals: FASTFortranDeclarationStatement.
	self assert: stmt type class equals: FASTFortranIntegerType.
	self assert: stmt declarators size equals: 1.
	
	var := stmt declarators first.
	self assert: var class equals: FASTFortranVariableExpression.
	self assert: var name equals: 'i'.
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testVariableDeclarationLogical [
	| result stmt var |
	result := self parse: '      program main
      logical b
      end
'.

	self assert: result first statements size equals: 1.

	stmt := result first statements first.	
	self assert: stmt class equals: FASTFortranDeclarationStatement.
	self assert: stmt type class equals: FASTFortranLogicalType.
	self assert: stmt declarators size equals: 1.
	
	var := stmt declarators first.
	self assert: var class equals: FASTFortranVariableExpression.
	self assert: var name equals: 'b'.
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testVariableDeclarationReal [
	| result stmt var |
	result := self parse: '      program main
      real c
      end
'.

	self assert: result first statements size equals: 1.

	stmt := result first statements first.	
	self assert: stmt class equals: FASTFortranDeclarationStatement.
	self assert: stmt type class equals: FASTFortranRealType.
	self assert: stmt declarators size equals: 1.
	
	var := stmt declarators first.
	self assert: var class equals: FASTFortranVariableExpression.
	self assert: var name equals: 'c'.
]
