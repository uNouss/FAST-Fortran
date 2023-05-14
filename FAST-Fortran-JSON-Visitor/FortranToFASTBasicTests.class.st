Class {
	#name : #FortranToFASTBasicTests,
	#superclass : #FortranToFASTTestSetUp,
	#category : #'FAST-Fortran-JSON-Visitor-Tests'
}

{ #category : #'tests-programUnit' }
FortranToFASTBasicTests >> testBlockData [


	| bd |
	
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

{ #category : #'tests-programUnit' }
FortranToFASTBasicTests >> testFunctionNoParameter [
	| fct |
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
	| fct param |
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

	| conditional |
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

	conditional := result first  statements first.
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

	| conditional |
	
	result := self parse: '      PROGRAM MYPROG
       IF ( A ) THEN 
       ELSE
        I = 1 
       END IF
      END
'.

	conditional := result first  statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatements size equals: 0.
	self assert: conditional elseStatements size equals: 1.
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testIfEmpty [
	
	| conditional |
	result := self parse: '      PROGRAM MYPROG
       IF ( A ) THEN
       END IF
      END
'.
	conditional := result first  statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional condition class equals: FASTFortranVariableExpression.
	self assert: conditional condition name equals: 'a'.
	self assert: conditional thenStatements size equals: 0.
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testIfThenWithStatement [
	
	| conditional |
	result := self parse: '      PROGRAM MYPROG
       IF ( A ) THEN
        I = 1
       END IF
      END
'.

	conditional := result first  statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional thenStatements size equals: 1.
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testImplicitNoneStatement [
	
	| stmt |
	result := self parse: '      PROGRAM MYPROG
       implicit none
      END
'.

	stmt := result first  statements first.
	self assert: stmt class equals: FASTFortranImplicitStatement
]

{ #category : #'tests-programUnit' }
FortranToFASTBasicTests >> testMainProgram [
	| body |

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

	| progUnit |
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

	result := self parse: '      program main
      end
 '.
	
	self assert: result isCollection.
	self assert: result size equals: 1.
	self assert: result first class equals: FASTFortranProgramMain.
	self assert: result first name equals: 'main'.
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testStatementAssignement [

	| stmt |
	result := self parse: '      PROGRAM MYPROG
          c = 1
      END
'.

	stmt := result first  statements first.
	self assert: stmt class equals: FASTFortranAssignmentStatement.

	self assert: stmt variable class equals: FASTFortranVariableExpression.
	self assert: stmt variable name equals: 'c'.

	self assert: stmt expression class equals: FASTFortranIntegerLiteral.
	self assert: stmt expression value equals: '1'.

]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testStatementCallSubroutine [

	| body arg |
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
	self flag: 'what happened to the "*" ("*8")?'

]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testStatementCallWrite [

	| body |
	result := self parse: '      PROGRAM TESTALT
       WRITE (*,*) "OK - Normal Return [n=0]"
      END 
'.

	self assert: result first class equals: FASTFortranProgramMain.

	body := result first statements.
	self assert: body size equals: 1.
	self assert: body first class equals: FASTFortranWriteStatement.
	self assert: body first format size equals: 2.
	self assert: body first format size equals: 2.
	body first format do: [ :each |
		self assert: each class equals: FASTFortranAsterisk
	]
	
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testStatementStop [

	| body |
	result := self parse: '      PROGRAM TESTALT
       STOP
      END 
'.

	self assert: result first class equals: FASTFortranProgramMain.

	body := result first statements.
	self assert: body isCollection.
	self assert: body size equals: 1.
	self assert: body first class equals: FASTFortranStopStatement.
	self assert: body first displayArgument equals: nil.
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testStatementStopWithMessage [

	| body |
	result := self parse: '      PROGRAM TESTALT
       STOP 10
      END 
'.

	self assert: result first class equals: FASTFortranProgramMain.

	body := result first statements.
	self assert: body isCollection.
	self assert: body size equals: 1.
	self assert: body first class equals: FASTFortranStopStatement.
	self assert: body first displayArgument class equals: FASTFortranIntegerLiteral .
	self assert: body first displayArgument value equals: '10'
]

{ #category : #'tests-statement' }
FortranToFASTBasicTests >> testStatementWithLabel [

	| body |
	result := self parse: '      PROGRAM TESTALT
10     STOP
      END 
'.

	self assert: result first class equals: FASTFortranProgramMain.

	body := result first statements.
	self assert: body isCollection.
	self assert: body size equals: 1.
	self assert: body first class equals: FASTFortranStopStatement.
	self assert: body first label class equals: FASTFortranIntegerLiteral.
	self assert: body first label value equals: '10'.
]

{ #category : #'tests-programUnit' }
FortranToFASTBasicTests >> testSubroutineEmpty [

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
	| stmt var |
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
	| stmt var |
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
	| stmt var |
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
	| stmt var |
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
