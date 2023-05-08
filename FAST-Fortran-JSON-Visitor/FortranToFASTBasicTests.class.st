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

	result := self parse: '
      program main
      implicit none
c2345678901234567890123456789012345678901234567890123456789012
      end
 '.
	
	self assert: result isCollection
]

{ #category : #tests }
FortranToFASTBasicTests >> testMainProgramAndSubroutine [

	| mainProgram |
	result := self parse: '
      PROGRAM TESTALT
       CALL RANK ( N, *8, *9 )
       WRITE (*,*) ''OK - Normal Return [n=0]''
       STOP 
8      WRITE (*,*) ''Minor - 1st alternate return [n=1]'' 
       STOP 8
9      WRITE (*,*) ''Major - 2nd alternate return [n=2]'' 
      END 
      
      SUBROUTINE RANK ( N, *, * ) 
       IF ( N .EQ. 0 ) RETURN 
       IF ( N .EQ. 1 ) RETURN 1
       RETURN 2 
      END
'.

	self assert: result isCollection.
	mainProgram := result first first.
	self assert: mainProgram class equals: FASTFortranProgramMain.
	self assert: mainProgram name equals: 'hello'.
]
