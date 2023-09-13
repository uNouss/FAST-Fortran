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
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranAssignmentStatement new
		variable: (self scalarVariable: aName) ;
		expression: rhs ;
		startPos: 1 ;
		endPos: aName size + 3 ;
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
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranCallStatement new
		name: aName ;
		arguments: aCollection ;
		startPos: 1 ;
		endPos: aName size + 4 ;
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
FASTFortranExporterVisitorTest >> comment: text [
	^FASTFortranComment new
		content: text asString ;
		startPos: 1 ;
		endPos: text asString size + 1 ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> declarationStatement: type variables: aCollection [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranDeclarationStatement new
		type: type ;
		declarators: (self scalarVariables: aCollection)  ;
		startPos: 1 ;
		endPos: 10 ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> doStatement: control statements: stmtBlock [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranDoStatement new
		loopControl: control ;
		statementBlock: (self statementBlock: stmtBlock) ;
		startPos: 1 ;
		endPos: 20 ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> entity: owner parameters: aCollection [
	^owner
		parameters: (self scalarVariables: aCollection) ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> externalStatement: aName [
	^FASTFortranExternalStatement new
		name: aName ;
		startPos: 1 ;
		endPos: 8 ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> functionCall: aName arguments: aCollection [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranFunctionCall new
		name: aName ;
		arguments: aCollection ;
		startPos: 1 ;
		endPos: aName size + 3 ;
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
		startPos: 1 ;
		endPos: 13 ;
		yourself

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
FASTFortranExporterVisitorTest >> loopControlInit: init increment: incr limit: limit [
	"incr is nil or a integerLiteral, limit is assumed to be a scalarVariable name"
	| entity |
	entity := FASTFortranLoopControlExpression new.
	entity init: init.
	incr ifNotNil: [ entity increment: (self integerLiteral: incr) ].
	entity limit: (self scalarVariable: limit).
	^entity
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
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranReturnStatement new
		expression: expression ;
		startPos: 1 ;
		endPos: 6 ;
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
		startPos: 1 ;
		endPos: (aCollection ifNotEmpty: [ aCollection last endPos ] ifEmpty: [ 2 ]) ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> subroutine: aName [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranSubroutine new
		name: aName ;
		statementBlock: (self statementBlock: #()) ;
		startPos: 1 ;
		endPos: 50 ;
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
FASTFortranExporterVisitorTest >> testBlockStatementWithCommentAndStatement [
	"note: positions are approximate, all we need is that the assignement is after the comment"
	| stmt cmt block |

	stmt := self assignementStatement: 'i' value: (self integerLiteral: '1').
	stmt startPos: 34.
	stmt endPos: 38.

	cmt := self comment: ' comment before assignement'.
	cmt startPos: 1.
	cmt endPos: 26.

	block := self statementBlock: { stmt }.
	block addComment: cmt.

	self
		assertExport: block
		equals: 
'C comment before assignement
      i = 1
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
FASTFortranExporterVisitorTest >> testComment [
	| cmt |
	cmt := self comment: 'This is a comment'.

	self
		assertExport: cmt
		equals: 
'CThis is a comment
'.
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testDoStatement [
	| stmt init |
	self skip: 'init in control should be an expression, not a statement'.

	init := self assignementStatement: 'i' value: (self integerLiteral: '1').
	stmt := self
		doStatement: (self loopControlInit: init increment: '1' limit: 'max')
		statements: #().

	self
		assertExport: stmt
		equals: 
'      do i=1, 1, max
      end do
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testDoStatementNoIncrement [
	| stmt init |
	self skip: 'init in control should be an expression, not a statement'.

	init := self assignementStatement: 'i' value: (self integerLiteral: '1').
	stmt := self
		doStatement: (self loopControlInit: init increment: nil limit: 'max')
		statements: #().

	self
		assertExport: stmt
		equals: 
'      do i=1, max
      end do
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
FASTFortranExporterVisitorTest >> testIfBlockStatementNested [
	| stmt |
	stmt := self
		ifBlock: (self scalarVariable: 'bool1')
		then: { self
			ifBlock: (self scalarVariable: 'bool2')
			then: #()
			else: #() }
		else: #().

	self
		assertExport: stmt
		equals: 
'      if (bool1) then
        if (bool2) then
        end if
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
	| sub stmt |
	sub := self subroutine: 'blah'.

	stmt := self
		declarationStatement: (self integerType: nil)
		variables: #(i).
	sub statementBlock addStatement: stmt.

	stmt := self
		declarationStatement: (self integerType: nil)
		variables: #(j).
	stmt startPos: 11.
	stmt endPos: 15.
	sub statementBlock addStatement: stmt.

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
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranWriteStatement new
		format: { FASTFortranAsterisk new . FASTFortranAsterisk new  } ;
		arguments: aCollection ;
		startPos: 1 ;
		endPos: 30 ;
		yourself
]