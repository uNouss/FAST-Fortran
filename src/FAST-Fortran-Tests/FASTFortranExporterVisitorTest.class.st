"
A FASTFortranExporterVisitorTest is a test class for testing the behavior of FASTFortranExporterVisitor
"
Class {
	#name : #FASTFortranExporterVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'visitor'
	],
	#category : #'FAST-Fortran-Tests-Visitor'
}

{ #category : #running }
FASTFortranExporterVisitorTest >> assertExport: anEntity equals: expectedString [
	| generated |
	anEntity accept: visitor.
	generated := visitor stream contents.
	self assert: generated equals: expectedString
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> assignementStatement: aName value: rhs [
	^FASTFortranAssignmentStatement new
		variable: (self scalarVariable: aName) ;
		expression: rhs ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> binary: op left: lhsVar right: rhsVal [
	"a binary operation between a variable (left) and an integer value (right)"

	^FASTFortranBinaryExpression new
		operator: op ;
		left: (self scalarVariable: lhsVar) ;
		right: (self integerLiteral: rhsVal) ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> callStatement: aName arguments: aCollection [
	^FASTFortranCallStatement new
		name: aName ;
		arguments: aCollection ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> characterLiteral: value [
	^FASTFortranCharacterLiteral new
		primitiveValue: value ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> characterType: dimension [
	^FASTFortranCharacterType new
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> declarationStatement: type variables: aCollection [
	^FASTFortranDeclarationStatement new
		type: type ;
		declarators: (self scalarVariables: aCollection)  ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> entity: owner parameters: aCollection [
	^owner
		parameters: (self scalarVariables: aCollection) ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> entity: owner statementBlock: aCollection [
	^owner
		statementBlock: (FASTFortranStatementBlock new
			statements: aCollection ;
			yourself)
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> externalStatement: aName [
	^FASTFortranExternalStatement new
		name: aName ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> functionCall: aName arguments: aCollection [
	^FASTFortranFunctionCall new
		name: aName ;
		arguments: aCollection ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> ifBlock: condition then: thenBlock else: elseBlock [
	^FASTFortranIfBlockStatement new
		condition: condition ;
		thenStatementBlock: (self statementBlock: thenBlock) ;
		elseStatementBlock: (self statementBlock: elseBlock) ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> implicitStatement [
	^FASTFortranImplicitStatement new
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> integerLiteral: value [
	^FASTFortranIntegerLiteral new
		primitiveValue: value ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> integerType: dimension [
	^FASTFortranIntegerType new
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> logicalLiteral: value [
	^FASTFortranBooleanLiteral new
		primitiveValue: value ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> logicalType: dimension [
	^FASTFortranLogicalType new
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> realLiteral: value [
	^FASTFortranRealLiteral new
		primitiveValue: value ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> realType: dimension [
	^FASTFortranRealType new
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> returnStatement: expression [
	^FASTFortranReturnStatement new
		expression: expression ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> scalarVariable: aName [
	^FASTFortranScalarVariable new
		name: aName ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> scalarVariables: aCollectionOfString [
	^aCollectionOfString collect: [ :aString | self scalarVariable: aString ]
]

{ #category : #running }
FASTFortranExporterVisitorTest >> setUp [
	super setUp.

	visitor := FASTFortranExporterVisitor new
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> statementBlock: aCollection [
	^FASTFortranStatementBlock new
		statements: aCollection ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> subroutine: aName [
	^FASTFortranSubroutine new
		name: aName ;
		statementBlock: (self statementBlock: #()) ;
		yourself
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testAssignementFunctionCall [

	| stmt |
	stmt := self
		assignementStatement: 'a' 
		value: (self 
			functionCall: 'fct'
			arguments: {
				self integerLiteral: '5' .
				self scalarVariable: 'b' }).

	self
		assertExport: stmt
		equals: 
'      a = fct(5,b)
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testAssignementStatementLiteralValue [
	| stmt |
	stmt := self assignementStatement: 'aVar' value: (self logicalLiteral: '.true.').

	self
		assertExport: stmt
		equals: 
'      aVar = .true.
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testAssignementStatementVariable [
	| stmt |
	stmt := self assignementStatement: 'a' value: (self scalarVariable: 'b').

	self
		assertExport: stmt
		equals: 
'      a = b
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testCallStatementNoArgs [
	| stmt |
	stmt := self callStatement: 'subrtn' arguments: #().

	self
		assertExport: stmt
		equals: 
'      call subrtn
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testCallStatementWithArgs [
	| stmt |
	stmt := self callStatement: 'subrtn' arguments: {
		self scalarVariable: 'a' .
		self integerLiteral: '5' }.

	self
		assertExport: stmt
		equals: 
'      call subrtn(a,5)
'
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testEmptySubroutineNoParameters [
	| sub |
	sub := self subroutine: 'blah'.

	self
		assertExport: sub
		equals: 
'      subroutine blah()
      end
'
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testEmptySubroutineTwoParameters [
	| sub |
	sub := self subroutine: 'blah'.
	self
		entity: sub
		parameters: #(i j).

	self
		assertExport: sub
		equals: 
'      subroutine blah(i,j)
      end
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testExternalStatement [
	| stmt |
	stmt := self externalStatement: 'aVar'.

	self
		assertExport: stmt
		equals: 
'      external aVar
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testIfBlockStatementEmpty [
	| stmt |
	stmt := self ifBlock: (self scalarVariable: 'bool') then: #() else: #().

	self
		assertExport: stmt
		equals: 
'      if (bool) then
      end if
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testIfBlockStatementEmptyBinaryCondition [
	| stmt cond |
	cond := self binary: '.gt.' left: 'a' right: '0'.
	stmt := self ifBlock: cond then: #() else:  #().

	self
		assertExport: stmt
		equals: 
'      if (a .gt. 0) then
      end if
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testIfBlockStatementWithElseBlock [
	| stmt |
	stmt := self
		ifBlock: (self scalarVariable: 'bool')
		then: #()
		else:  {  self writeStatement: { self characterLiteral: 'message' } }.

	self
		assertExport: stmt
		equals: 
'      if (bool) then
      else
        write(*,*) ''message''
      end if
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testIfBlockStatementWithThenBlock [
	| stmt |
	stmt := self
		ifBlock: (self scalarVariable: 'bool')
		then: {  self writeStatement: { self characterLiteral: 'message' } }
		else:  #().

	self
		assertExport: stmt
		equals: 
'      if (bool) then
        write(*,*) ''message''
      end if
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testImplicitStatement [
	| stmt |
	stmt := self implicitStatement.

	self
		assertExport: stmt
		equals: 
'      implicit none
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testOneDeclarationCharacterType [
	| stmt |
	stmt := self declarationStatement: (self characterType: nil) variables: #(r).

	self
		assertExport: stmt
		equals: 
'      character r
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testOneDeclarationLogicalType [
	| stmt |
	stmt := self declarationStatement: (self logicalType: nil) variables: #(r).

	self
		assertExport: stmt
		equals: 
'      logical r
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testOneDeclarationRealType [
	| stmt |
	stmt := self declarationStatement: (self realType: nil) variables: #(r).

	self
		assertExport: stmt
		equals: 
'      real r
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testOneDeclarationTwoVariables [
	| stmt |
	stmt := self declarationStatement: (self integerType: nil) variables: #(i j).

	self
		assertExport: stmt
		equals: 
'      integer i,j
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testReturnStatementEmpty [
	| stmt |
	stmt :=  self returnStatement: nil.

	self
		assertExport: stmt
		equals: 
'      return 
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testReturnStatementLiteralValue [
	| stmt |
	stmt := self returnStatement: (self realLiteral: '3.5').

	self
		assertExport: stmt
		equals: 
'      return 3.5
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testTwoDeclarationsArray [
	| stmt |
	self skip: 'not implemented in FAST yet'.

	stmt := self declarationStatement: (self integerType: '5') variables: #(arr).

	self
		assertExport: stmt
		equals: 
'      subroutine blah()
      integer arr(5)
      end
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testTwoDeclarationsTwoVariables [
	| sub |
	sub := self subroutine: 'blah'.
	self
		entity: sub
		statementBlock: {
			self
				declarationStatement: (self integerType: nil)
				variables: #(i) .
			self
				declarationStatement: (self integerType: nil)
				variables: #(j) }.

	self
		assertExport: sub
		equals: 
'      subroutine blah()
      integer i
      integer j
      end
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testWriteStatement [
	| stmt |
	stmt := self writeStatement: { self characterLiteral: 'message' }.

	self
		assertExport: stmt
		equals: 
'      write(*,*) ''message''
'
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> writeStatement: aCollection [
	^FASTFortranWriteStatement new
		format: { FASTFortranAsterisk new . FASTFortranAsterisk new  } ;
		arguments: aCollection ;
		yourself
]
