Class {
	#name : #FortranToFASTBasicTests,
	#superclass : #FortranToFASTTestSetUp,
	#category : #'FAST-Fortran-JSON-Visitor-Tests'
}

{ #category : #tests }
FortranToFASTBasicTests >> testBlockData [


	| bd |
	
	result := self
		        parse: '      block data myblck
      common /mycom/ i
      end
 '.
	bd := result first first. "unpacking"
	self assert: bd class equals: FASTFortranBlockData.
	self assert: bd name equals: 'myblck'.  
]

{ #category : #tests }
FortranToFASTBasicTests >> testCallSubroutine [

	| mainProgram subroutine |
	
	result := self parse: '
      PROGRAM call_sub
       CHARACTER *25 TEXT
       TEXT = ''Some kind of text string'' 
       CALL OOPS ( TEXT )
      END
      SUBROUTINE OOPS ( S )
       CHARACTER S*(*) 
       WRITE (*,*) S 
      END
 '.

	mainProgram := result first first.
	subroutine := result first last.
	
	self assert: mainProgram name equals: 'call_sub'.
	self assert: mainProgram class equals: FASTFortranProgramMain.
	self assert: subroutine name equals: 'oops'.
	self assert: subroutine class equals: FASTFortranSubroutine.
]

{ #category : #tests }
FortranToFASTBasicTests >> testFunctionNoParameter [
	| fct |
	result := self parse: '
      integer function aFct()
      end
 '.

	self assert: result isNotEmpty.
	fct := result first first.

	self assert: fct class equals: FASTFortranFunction.
	self assert: fct name equals: 'afct'.
	self assert: fct parameters isCollection.
	self assert: fct parameters isEmpty.
	"self assert: fct returnType class equals: FASTFortranType.
	self assert: fct returnType name equals: 'integer'."
	
]

{ #category : #tests }
FortranToFASTBasicTests >> testFunctionWithParameter [
	| fct |
	result := self parse: '
      integer function aFct(i,j)
      end
 '.

	self assert: result isNotEmpty.
	fct := result first first.

	self assert: fct class equals: FASTFortranFunction.
	self assert: fct name equals: 'afct'.
	self assert: fct parameters isCollection.
	self assert: fct parameters size equals: 2.

	self flag: 'should test the name of each parameter'.

	"self assert: fct returnType class equals: FASTFortranType.
	self assert: fct returnType name equals: 'integer'."
	
]

{ #category : #tests }
FortranToFASTBasicTests >> testHelloWorld [

	| mainProgram |
	result := self parse: '      
      program hello
      ! This is a comment line; it is ignored by the compiler
      print *, ''Hello, World!''
      end program hello
 '.

	self assert: result isCollection.
	mainProgram := result first first.
	self assert: mainProgram class equals: FASTFortranProgramMain.
	self assert: mainProgram name equals: 'hello'.
]

{ #category : #tests }
FortranToFASTBasicTests >> testIf [
	
	| conditional |
	result := self parse: '
      PROGRAM MYPROG
       IF ( A ) THEN
        I = 1
        print *, ''Hello, World!''
       END IF
      END
'.
	conditional := result first first statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
	self assert: conditional condition class equals: FASTFortranVariableExpression.
	self assert: conditional condition name equals: 'a'.
	self assert: conditional thenStatements size = 2.
	self assert: conditional parentProgramUnit class equals: FASTFortranProgramMain.
]

{ #category : #tests }
FortranToFASTBasicTests >> testIfElse [

	| conditional |
	
	result := self parse: '
      PROGRAM MYPROG
       IF ( X .LT. Y ) THEN 
        M = 0
       ELSE
        M = 0
        I = 1 
       END IF
      END
'.

	conditional := result first first statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement.
]

{ #category : #tests }
FortranToFASTBasicTests >> testIfElseXTimes [

	| conditional |
	result := self parse: '      PROGRAM MYPROG
         IF ( A ) THEN
            I = 1
         else if ( b ) then
            i = 2
            M = 0
         else if ( c ) then
            i = 3         
         ELSE
            I = 4
         END IF
      END
'.

	conditional := result first first statements first.
	self assert: conditional class equals: FASTFortranIfBlockStatement
]

{ #category : #tests }
FortranToFASTBasicTests >> testIntegerVariableDeclaration [
	| mainProgram stmt var |
	result := self parse: '      program main
      integer i
      end
'.

	self assert: result isCollection.

	mainProgram := result first first.
	self assert: mainProgram statements isCollection.
	self assert: mainProgram statements size equals: 1.

	stmt := mainProgram statements first.	
	self assert: stmt class equals: FASTFortranVariablesDeclaration.
	self assert: stmt variables size equals: 1.
	
	var := stmt variables first.
	self assert: var class equals: FASTFortranVariableExpression.
	self assert: var name equals: 'i'.
	self assert: var type equals: 'integer'
]

{ #category : #tests }
FortranToFASTBasicTests >> testMainProgram [
	| body |

	result := self parse: '      program main
      implicit none
c23456789 123456789 123456789 123456789 123456789 123456789 12
      end
 '.

	self assert: result first class equals: FASTFortranProgramMain.

	body := result first statements.
	self assert: body isCollection.
	self assert: body size equals: 2.
	self assert: body first class equals: FASTFortranImplicitStatement.
	self assert: body second class equals: FASTFortranComment.
	self assert: body second content equals: '23456789 123456789 123456789 123456789 123456789 123456789 12'.
]

{ #category : #tests }
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

{ #category : #tests }
FortranToFASTBasicTests >> testMainProgramEmpty [

	result := self parse: '      program main
      end
 '.
	
	self assert: result isCollection.
	self assert: result size equals: 1.
	self assert: result first class equals: FASTFortranProgramMain.
	self assert: result first name equals: 'main'.
]

{ #category : #tests }
FortranToFASTBasicTests >> testStatementCallSubroutine [

	| body |
	result := self parse: '      PROGRAM TESTALT
       CALL RANK ( N, *8, *9 )
      END 
'.

	self assert: result first class equals: FASTFortranProgramMain.

	body := result first statements.
	self fail
]

{ #category : #tests }
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

{ #category : #tests }
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

{ #category : #tests }
FortranToFASTBasicTests >> testStatementStopLabel [

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

{ #category : #tests }
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

{ #category : #tests }
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

{ #category : #tests }
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
