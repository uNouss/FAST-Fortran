"
A FASTFortranExporterVisitorTest is a test class for testing the behavior of FASTFortranExporterVisitor
"
Class {
	#name : #FASTFortranExporterVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'visitor'
	],
	#category : #'FAST-Fortran-Visitors-Tests-Visitor'
}

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> array: name access: aCollection [

	^FASTFortranArrayVariable new
		name: name ;
		indices: aCollection ;
		yourself

]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> arrayDeclaration: variable dimensions: aCollection [

	| declarator |
	declarator := self variableDeclarator: variable.
	declarator dimensions:
		(aCollection collect: [ :dim |
			FASTFortranArrayDimension new
				lowerBound: (dim first ifNotNil: [ self integerLiteral: dim first ]) ;
				upperBound: (dim second ifNotNil: [ self integerLiteral: dim second ])
		]).

	^FASTFortranVariableDeclarationStatement new
		type: (self integerType: nil) ;
		declarators: { declarator } ;
		startPos: 1 ;
		endPos: 10 ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> arrayVariable: aName indice: anInteger [
	^FASTFortranArrayVariable new
		name: aName ;
		indices: { self integerLiteral: anInteger }
		yourself
]

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
		size: dimension ;
		yourself
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

	^FASTFortranVariableDeclarationStatement new
		type: type ;
		declarators: (self variableDeclarators: aCollection)  ;
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
FASTFortranExporterVisitorTest >> functionDeclaration: aName [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranFunction new
		name: aName ;
		returnType: FASTFortranRealType new ;
		parameters: {  } ;
		statementBlock: FASTFortranStatementBlock new
		yourself.
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> ifBlock: condition then: thenBlock else: elseBlock [
	^FASTFortranIfBlockStatement new
		condition: condition ;
		thenStatementBlock: (self statementBlock: thenBlock) ;
		elseStatementBlock: (elseBlock ifNil: [ nil ] ifNotNil: [self statementBlock: elseBlock]) ;
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
		size: dimension ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> labelReference: aString [

	^FASTFortranLabelReference new
		label: aString ;
		startPos: 1 ;
		endPos: aString size ;
		yourself
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
		size: dimension ;
		yourself
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
FASTFortranExporterVisitorTest >> testArrayDeclaration [
	| stmt |
	stmt := self arrayDeclaration: 'v' dimensions: #( #('1' '10') ).

	self
		assertExport: stmt
		equals: 
'      integer v(1:10)
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testArrayDeclarationImplicitLowerBound [
	| stmt |
	stmt := self arrayDeclaration: 'v' dimensions: #( #('1' '10') ).
	stmt declarators first dimensions first lowerBound: nil.

	self
		assertExport: stmt
		equals: 
'      integer v(10)
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testArrayDeclarationMultipleDimensions [
	| stmt |
	stmt := self arrayDeclaration: 'v' dimensions: #( #('1' '10') #('-10' '-1') ).

	self
		assertExport: stmt
		equals: 
'      integer v(1:10,-10:-1)
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testArrayVariable [
	| stmt |
	stmt := FASTFortranArrayVariable new
		name: 'arr'.

	self
		assertExport: stmt
		equals: 
'arr()'
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
FASTFortranExporterVisitorTest >> testAssignementStatementArrayAssigned [
	| stmt |
	stmt := self assignementStatement: 'a' value: (self scalarVariable: 'b').
	stmt variable: (self array: 'arr' access: { self scalarVariable: 'i' . self integerLiteral: '1'}).

	self
		assertExport: stmt
		equals: 
'      arr(i,1) = b
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
FASTFortranExporterVisitorTest >> testBinaryExpression [
	| expr |
	expr := FASTFortranBinaryExpression new
		left: (self scalarVariable: 'a') ;
		operator: '+' ;
		right: (self integerLiteral: '5').

	self
		assertExport: expr
		equals: 'a + 5'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testBinaryExpressionNe [
	| expr |
	expr := FASTFortranBinaryExpression new
		left: (self scalarVariable: 'a') ;
		operator: '.ne.' ;
		right: (self integerLiteral: '5').

	self
		assertExport: expr
		equals: 'a .ne. 5'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testBlockStatementWithCommentAndStatement [
	"note: positions are approximate, all we need is that the assignement is after the comment"
	| stmt cmt block |

	stmt := self assignementStatement: 'i' value: (self integerLiteral: '1').
	stmt startPos: 34.
	stmt endPos: 38.

	cmt := self comment: 'C comment before assignement'.
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
FASTFortranExporterVisitorTest >> testCallStatementExpressionArg [
	| stmt |
	stmt := self callStatement: 'subrtn' arguments: {
		self binary: '*' left: 'a' right: '5' }.

	self
		assertExport: stmt
		equals: 
'      call subrtn(a * 5)
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
	cmt := self comment: 'C This is a comment'.

	self
		assertExport: cmt
		equals: 
'C This is a comment
'.
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testComment72Characters [
	| cmt |
	cmt := self comment: 'C 3456789 123456789 123456789 123456789 123456789 123456789 123456789 12'.

	self
		assertExport: cmt
		equals: 
'C 3456789 123456789 123456789 123456789 123456789 123456789 123456789 12
'.
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testCommonStatement [

	| stmt |

	stmt := FASTFortranCommonStatement new
		groups: {
			FASTFortranCommonGroup new
				declarators: (self variableDeclarators: #(a b))
			.
			FASTFortranCommonGroup new
				name: 'otherGrp' ;
				declarators: (self variableDeclarators: #(c d))
		} ;
		yourself.

	self
		assertExport: stmt
		equals: 
'      common a,b /otherGrp/ c,d
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testContinueStatement [
	| cmt |
	cmt := FASTFortranContinueStatement new
		label: '110'.

	self
		assertExport: cmt
		equals: 
'110   continue
'.
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testDataStatement [

	| stmt |

	stmt := FASTFortranDataStatement new
		variableGroups: {
			FASTFortranDataGroup new
				variables: (self scalarVariables: #(a b)) ;
				dataConstants: { self characterLiteral: 'un' . self characterLiteral: 'deux' }
			.
			FASTFortranDataGroup new
				variables: (self scalarVariables: #(c)) ;
				dataConstants: { self characterLiteral: 'trois' }
		} ;
		yourself.

	self
		assertExport: stmt
		equals: 
'      data a,b /''un'',''deux''/ ,c /''trois''/ 
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testDoStatement [
	| stmt init |

	init := FASTFortranAssignmentExpression new
		variable: (self scalarVariable: 'i') ;
		expression: (self integerLiteral: '1').
	stmt := self
		doStatement: (self loopControlInit: init increment: '1' limit: 'max')
		statements: #().

	self
		assertExport: stmt
		equals: 
'      do i = 1,1,max
      end do
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testDoStatementNoIncrement [
	| stmt init |

	init := FASTFortranAssignmentExpression new
		variable: (self scalarVariable: 'i') ;
		expression: (self integerLiteral: '1').
	stmt := self
		doStatement: (self loopControlInit: init increment: nil limit: 'max')
		statements: #().

	self
		assertExport: stmt
		equals: 
'      do i = 1,max
      end do
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testDoStatementWithLabel [
	| stmt init |

	init := FASTFortranAssignmentExpression new
		variable: (self scalarVariable: 'i') ;
		expression: (self integerLiteral: '1').
	stmt := self
		doStatement: (self loopControlInit: init increment: nil limit: 'max')
		statements: { FASTFortranContinueStatement new label: '110'}.
	stmt labelReferences: { self labelReference: '110' }.

	self
		assertExport: stmt
		equals: 
'      do 110 i = 1,max
110     continue
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
FASTFortranExporterVisitorTest >> testEntryStatement [

	| stmt |
	stmt := FASTFortranEntryStatement new
		name: 'XYZ' ;
		entryArguments: { self scalarVariable: 'ABC' . FASTFortranAsterisk new } ;
		yourself.

	self
		assertExport: stmt
		equals:
'      entry XYZ(ABC,*)
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testEquivalenceStatement [

	| stmt |

	stmt := FASTFortranEquivalenceStatement new
		variableGroups: {
			FASTFortranEquivalenceGroup new
				variables: {
					self scalarVariable: #a .
					self arrayVariable: #b indice: '1'
				}
			.
			FASTFortranEquivalenceGroup new
				variables: (self scalarVariables: #(c d e))
		} ;
		yourself.

	self
		assertExport: stmt
		equals: 
'      equivalence (a,b(1)), (c,d,e)
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
FASTFortranExporterVisitorTest >> testFormatStatement [
	| stmt |
	stmt := FASTFortranFormatStatement new
		formatDescription: '(/8x)' ;
		label: '110' ;
		yourself.

	self
		assertExport: stmt
		equals: 
'110   format (/8x)
'.
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testFunctionNoParameterNoStatement [
	| node |
	node := self functionDeclaration: 'BLAH'.

	self
		assertExport: node
		equals: 
'      real function BLAH()
      end
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testFunctionNoParameterWithStatement [
	| node stmt |
	stmt := self returnStatement: (self scalarVariable: 'i').

	node := self functionDeclaration: 'BLAH'.
	node statementBlock: (self statementBlock: { stmt }).

	self
		assertExport: node
		equals: 
'      real function BLAH()
        return i
      end
'
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testFunctionNoReturnType [
	| fct |
	fct := self functionDeclaration: 'blah'.
	fct returnType: nil.

	self
		assertExport: fct
		equals: 
'      function blah()
      end
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testFunctionStatement [
	| node |
	node := FASTFortranFunctionStatement new.
	node name: 'fct'.
	node arguments: (self scalarVariables: #(x y)).
	node expression: (self binary: '+' left: 'x' right: '2').

	self
		assertExport: node
		equals: 
'      fct(x,y) = x + 2
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testFunctionWithParameterNoStatement [
	| node |
	node := self functionDeclaration: 'BLAH'.
	self entity: node parameters: #(i j).

	self
		assertExport: node
		equals: 
'      real function BLAH(i,j)
      end
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testGotoComputedStatement [
	| stmt |
	stmt := FASTFortranGoToComputedStatement new
		labelReferences: { self labelReference: '110' . self labelReference: '120' . self labelReference: '130'} ;
		selectorExpression: (self scalarVariable: 'i') ;
		yourself.

	self
		assertExport: stmt
		equals: 
'      goto (110,120,130) i
'.
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testGotoStatement [
	| stmt |
	stmt := FASTFortranGoToStatement new
		labelReferences: { self labelReference: '110' } ;
		yourself.

	self
		assertExport: stmt
		equals: 
'      goto 110
'.
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testIfArithmeticStatement [
	| stmt |

	stmt := FASTFortranIfArithmeticStatement new
		condition: (self scalarVariable: 'a') ;
		lessLabel:    (self labelReference: '10') ;
		equalLabel:   (self labelReference: '20') ;
		greaterLabel: (self labelReference: '30').

	self
		assertExport: stmt
		equals: 
'      if (a) 10, 20, 30
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testIfBlockStatementEmpty [
	| stmt |
	stmt := self ifBlock: (self scalarVariable: 'bool') then: #() else: nil.

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
	stmt := self ifBlock: cond then: #() else:  nil.

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
			else: nil }
		else: nil.

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
		else: nil.

	self
		assertExport: stmt
		equals: 
'      if (bool) then
        write(*,*) ''message''
      end if
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testIfLogicalStatementEmpty [
	| stmt |
	stmt := FASTFortranIfLogicalStatement new
		condition: (self scalarVariable: 'bool') ;
		statement: FASTFortranReturnStatement new ;
		yourself.

	self
		assertExport: stmt
		equals: 
'      if (bool) return 
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
FASTFortranExporterVisitorTest >> testLabelledStatement [
	| stmt |
	stmt := self returnStatement: nil.
	stmt label: '100'.

	self
		assertExport: stmt
		equals: 
'100   return 
'
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testLongDataStatementLine [

	| stmt |

	stmt := FASTFortranDataStatement new
		variableGroups: {
			FASTFortranDataGroup new
				variables: (self scalarVariables: #(abcde fghijk lmnopq)) ;
				dataConstants: {
					self characterLiteral: '---------------' .
					self characterLiteral: '---------------' .
					self characterLiteral: '---------------' }
		} ;
		yourself.

	self
		assertExport: stmt
		equals: 
'      data abcde,fghijk,lmnopq /''---------------'',''---------------'',
     & ''---------------''/ 
'
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testLongFormatLine [

	| stmt |

	stmt := FASTFortranFormatStatement new
		formatDescription: '(1h,//36hxabs-(156)intrinsicfunctions--//11x,26habs,iabs(absolutevalue)//20hsubsetref.-15.3)' ;
		label: '110' ;
		yourself.

	self
		assertExport: stmt
		equals: 
'110   format (1h,//36hxabs-(156)intrinsicfunctions--//11x,26habs,
     & iabs(absolutevalue)//20hsubsetref.-15.3)
'.
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testLongLine [
	| stmt |
	stmt := self declarationStatement: (self characterType: nil) variables: #(abc1 abc2 abc3 abc4 abc5 abc6 abc7 abc8 abc9 abc10 abc11 abc12 abc13 abc14 abc15 abc16 abc17 abc18 abc19 abc20 abc21 abc22 abc23 abc24 abc25).

	self
		assertExport: stmt
		equals: 
'      character abc1,abc2,abc3,abc4,abc5,abc6,abc7,abc8,abc9,abc10,abc11
     & ,abc12,abc13,abc14,abc15,abc16,abc17,abc18,abc19,abc20,abc21,
     & abc22,abc23,abc24,abc25
'
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testLongLineDontBreak [
	| stmt |
	stmt := self declarationStatement: (self characterType: nil) variables: #(abc1 abc2 abc3 abc4 abc5 abc6 abc7 abc8 abc9 abc10 abc11 abc12 abc13 abc14 abc15 abc16 abc17 abc18 abc19 abc20 abc21 abc22 abc23 abc24 abc25).

	visitor dontBreakLongLines.

	self
		assertExport: stmt
		equals: 
'      character abc1,abc2,abc3,abc4,abc5,abc6,abc7,abc8,abc9,abc10,abc11,abc12,abc13,abc14,abc15,abc16,abc17,abc18,abc19,abc20,abc21,abc22,abc23,abc24,abc25
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testMainProgram [
	| node |
	node := FASTFortranProgramMain new
		name: 'BLAH' ;
		statementBlock: FASTFortranStatementBlock new
		yourself.

	self
		assertExport: node
		equals: 
'      program BLAH
      end
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
FASTFortranExporterVisitorTest >> testOneDeclarationCharacterTypeWithSize [
	| stmt |
	stmt := self declarationStatement: (self characterType: 10) variables: #(str).

	self
		assertExport: stmt
		equals: 
'      character*10 str
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testOneDeclarationIntegerTypeWithSize [
	| stmt |
	stmt := self declarationStatement: (self integerType: 8) variables: #(i).

	self
		assertExport: stmt
		equals: 
'      integer*8 i
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
FASTFortranExporterVisitorTest >> testPauseStatementEmpty [
	| stmt |
	stmt := FASTFortranPauseStatement new.

	self
		assertExport: stmt
		equals: 
'      pause 
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testPauseStatementWithInteger [
	| stmt |
	stmt := FASTFortranParameterStatement new
		declarators: (self variableDeclarators: #(pi msg)) ;
		yourself.
	stmt declarators first expression: (self realLiteral: '3.14159').
	stmt declarators second expression: (self characterLiteral: 'hello').

	self
		assertExport: stmt
		equals: 
'      parameter (pi=3.14159,msg=''hello'')
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testPauseStatementWithString [
	| stmt |
	stmt := FASTFortranPauseStatement new
		displayArgument: '''error''' ;
		yourself.

	self
		assertExport: stmt
		equals: 
'      pause ''error''
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
FASTFortranExporterVisitorTest >> testStopStatementEmpty [
	| stmt |
	stmt := FASTFortranStopStatement new.

	self
		assertExport: stmt
		equals: 
'      stop 
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testStopStatementWithInteger [
	| stmt |
	stmt := FASTFortranStopStatement new
		displayArgument: '1' ;
		yourself.

	self
		assertExport: stmt
		equals: 
'      stop 1
'
]

{ #category : #'tests - statements' }
FASTFortranExporterVisitorTest >> testStopStatementWithString [
	| stmt |
	stmt := FASTFortranStopStatement new
		displayArgument: '''error''' ;
		yourself.

	self
		assertExport: stmt
		equals: 
'      stop ''error''
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
FASTFortranExporterVisitorTest >> variableDeclarator: aName [
	^FASTFortranVariableDeclarator new
		variable: aName ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> variableDeclarators: aCollectionOfString [
	^aCollectionOfString collect: [ :aString | self variableDeclarator: aString ]
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
