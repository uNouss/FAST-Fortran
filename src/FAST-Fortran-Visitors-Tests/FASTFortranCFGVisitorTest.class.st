Class {
	#name : #FASTFortranCFGVisitorTest,
	#superclass : #FASTFortranAbstractVisitorTest,
	#instVars : [
		'ast'
	],
	#category : #'FAST-Fortran-Visitors-Tests-Visitor'
}

{ #category : #'entity creation' }
FASTFortranCFGVisitorTest >> add: statementBlock statement: aStatement [

	aStatement startPos: (statementBlock statements size + 1).
	statementBlock addStatement: aStatement.

	^aStatement

]

{ #category : #'entity creation' }
FASTFortranCFGVisitorTest >> addParameter: name type: typeDescription [
	"assume #ast contains a function definition"

	self entity: ast parameters: ((ast parameters collect: #name)
			 add: name asString;
			 yourself).

	^ self addStatement: (self declarationStatement: name type: typeDescription)
]

{ #category : #'entity creation' }
FASTFortranCFGVisitorTest >> addStatement: aStatement [

	^self add: ast statementBlock statement: aStatement

]

{ #category : #accessing }
FASTFortranCFGVisitorTest >> ast [

	^ast
]

{ #category : #running }
FASTFortranCFGVisitorTest >> findBasicBlocks: aClass with: aPharoBooleanBlock [

	^visitor basicBlocks
		select: [ :aBasicBlock |
			(aBasicBlock class = aClass) and:
			[ aPharoBooleanBlock value: aBasicBlock ]
		]
]

{ #category : #'entity creation' }
FASTFortranCFGVisitorTest >> function: name type: typeDescription [

	ast := self functionDeclaration: name.
	ast returnType: (self makeType: typeDescription).

	^ast

]

{ #category : #'entity creation' }
FASTFortranCFGVisitorTest >> functionWithConditional [
	"
	CHARACTER*20 FUNCTION fctBigSmall( x, y)
	INTEGER x
	INTEGER y
	CHARACTER*20 str

	x = 1

	IF y .gt. 5 THEN
	str = ""small""
	y = fctSmall(x)

	ELSE
	str = ""big""
	y = y - x
	END IF

	RETURN str
	END
	"

	| ifStatement |
	self function: #fctBigSmall type: #(character 20).
	self addParameter: #x type: #integer.
	self addParameter: #y type: #integer.
	self addStatement: (self declarationStatement: #str type: #(character 20) ).
	self addStatement: (self assignementStatement: #x value: 1).
	ifStatement := self addStatement: (self ifBlock: (self binary: '.gt.' left: #y right: 5) then: #() else:  #()).
	self addStatement: (self returnStatement: #str).

	self
		add: ifStatement thenStatementBlock
		statement: (self assignementStatement: #str value: '"small"').
	self
		add: ifStatement thenStatementBlock
		statement: (self
			assignementStatement: #y
			value: (self functionCall: #fctSmall arguments: { self scalarVariable: 'x' })).

	self
		add: ifStatement elseStatementBlock
		statement: (self assignementStatement: #str value: '"big"').
	self
		add: ifStatement elseStatementBlock
		statement: (self
			assignementStatement: #y
			value: (self binary: '-' left: #y right: #x)).

	^ast

]

{ #category : #running }
FASTFortranCFGVisitorTest >> newVisitor [

	^FASTFortranCFGVisitor new
]

{ #category : #'entity creation' }
FASTFortranCFGVisitorTest >> subroutine: name [

	ast := super subroutine: name.

	^ast

]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testArithmeticGotoAfterLabel [

	| blocks |
	"
	INTEGER FUNCTION something()
10	x = 1
20	y = 1
	IF (x) 10, 20, 30
	END
	"
	self function: #something type: #integer.
	self addStatement:
		 (self labelled: 10 statement:
			(self assignementStatement: #x value: 1)).
	self addStatement:
		(self labelled: 20 statement:
			(self assignementStatement: #y value: 1)).
	self addStatement: (self ifArithmetic: #x negative: 10 null: 20 positive: 20).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 3.

	self assert: blocks first  firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: blocks first  statements size equals: 1.

	self assert: blocks second firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: blocks second statements size equals: 1.

	self assert: blocks third class equals: FASTFortranConditionalBasicBlock.
	self assert: (blocks third nextBlockForValue: #negative) equals: blocks first.
	self assert: (blocks third nextBlockForValue: #null) equals: blocks second.
	self assert: (blocks third nextBlockForValue: #positive) equals: blocks second.

]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testBlockAfterConditionalBlock [

	| conditional |
	self functionWithConditional accept: visitor.

	conditional := (self findBasicBlocks: FASTFortranConditionalBasicBlock with: [ :basicBloc | true ])
		anyOne.

	self assert: conditional nextBlocks size equals: 2.
	self
		assert: conditional nextBlocks first nextBlock
		equals: conditional nextBlocks second nextBlock
	
]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testBlockChainingAfterIfLogical [

	| conditional blocks |
	"
	INTEGER FUNCTION something( x)
	INTEGER x
	IF (x .lt. 5) x = 5
	RETURN x - 5
	END
	"
	self function: 'something' type: #integer.
	self addParameter: #x type: #integer.
	self addStatement: (self
		logicalIf: (self binary: '.lt.' left: #x right: 5)
		statement: (self assignementStatement: #x value: 5)).
	self addStatement: (self returnStatement: (self binary: '-' left: #x right: 5)).
	
	ast accept: visitor.

	blocks := self findBasicBlocks: FASTFortranConditionalBasicBlock with: [ :basicBloc | true ].

	self assert: blocks size equals: 1.
	conditional := blocks anyOne.

	self assert: conditional nextBlocks size equals: 2.
	self
		assert: (conditional nextBlockForValue: true) nextBlock
		equals: (conditional nextBlockForValue: false)
	
]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testBlockChainingBeforeConditionalBlock [

	| blocks |
	self functionWithConditional accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 5.

	self assert: blocks first nextBlock equals: blocks second.
	self assert: blocks second class equals: FASTFortranConditionalBasicBlock

]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testBlockChainingForDoLoopConditional [

	| conditional basicBlock loop |
	"
	INTEGER FUNCTION factorial( x)
	INTEGER x
	INTEGER fact=1
 
	DO i=1, x, 1
	fact = fact*i
	END DO	
	RETURN fact
	END
	"
	self function: #factorial type: #integer.
	self addParameter: #x type: #integer.
	self addStatement: (self declarationStatement: #fact type: #integer init: 1).
	loop := self addStatement: (self doStatement: #(i 1 x 1)  statements: #()).
	self
		add: loop statementBlock
		statement: (self assignementStatement: #fact value: (self binary: '*' left: #fact right: #i)).
	self addStatement: (self returnStatement: #fact).
	
	ast accept: visitor.	

	conditional := (self findBasicBlocks: FASTFortranConditionalBasicBlock with: [ :basicBloc | true ])
		anyOne.

	self assert: conditional nextBlocks size equals: 2.

	basicBlock := conditional nextBlockForValue: true.
	self assert: basicBlock firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: basicBlock statements size equals: 1.
	self assert: basicBlock nextBlock equals: conditional.

	basicBlock := conditional nextBlockForValue: false.
	self assert: basicBlock firstStatement class equals: FASTFortranReturnStatement.
	self assert: basicBlock firstStatement expression class equals: FASTFortranScalarVariable.
	self assert: basicBlock statements size equals: 1.

]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testCallStatement [

	"
      SUBROUTINE TXT2TB
      INTEGER*8OOT
      IF (.NOT.GETCLE('MODE')) CALL ERREUR(4,'MOT-CLE MODE ATTENDU...')
      CALL GETENT(MODE,0.,10000,4,IERR,'Mode de lecture-traitement des donnees ')
      END
"
	| blocks callErreur callGetent |
	self subroutine: 'TXT2TB'.
	self addStatement: (self declarationStatement: #OOT type: #(integer 8)).
	self addStatement: (self
		logicalIf: (self unary: '.not.' operand: (self functionCall: 'GETCLE' arguments: { 'mode' } ))
		statement: (self callStatement: 'erreur' arguments: {4 . 'MOT-CLE MODE ATTENDU...'}) ).
	self addStatement: (self
		callStatement: 'getent'
		arguments: { #MODE . 0 . 10000 . 4 . #IERR .'Mode de lecture-traitement des donnees '}).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 4.

	self assert: blocks first  firstStatement class equals: FASTFortranVariableDeclarationStatement.
	self assert: blocks first  statements size equals: 1.

	callErreur := blocks detect: [ :block |
		(block firstStatement class = FASTFortranCallStatement) and:
		[ block firstStatement name = 'erreur' ] ].
	callGetent := blocks detect: [ :block |
		(block firstStatement class = FASTFortranCallStatement) and:
		[ block firstStatement name = 'getent' ] ].

	self assert: blocks second class equals: FASTFortranConditionalBasicBlock.

	self assert: (blocks second nextBlockForValue: true) equals: callErreur.
	self assert: (blocks second nextBlockForValue: false) equals: callGetent.

	self assert: callErreur nextBlock equals: callGetent.

	self assert: callGetent isFinal
]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testChainingArithmeticGotoWhenBeforeLabel [

	| blocks |
	"
	INTEGER FUNCTION something()
	IF (x) 10, 10, 10
10	x = 1
	END
	"
	self function: #something type: #integer.
	self addStatement: (self ifArithmetic: #x negative: 10 null: 10 positive: 10).
	self addStatement:
		 (self labelled: 10 statement:
			(self assignementStatement: #x value: 1)).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 2.

	self assert: blocks first class equals: FASTFortranConditionalBasicBlock.

	self assert: blocks second firstStatement class equals: FASTFortranAssignmentStatement.

	self assert: (blocks first nextBlockForValue: #negative) equals: blocks second.
	self assert: (blocks first nextBlockForValue: #null)     equals: blocks second.
	self assert: (blocks first nextBlockForValue: #positive) equals: blocks second.

]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testChainingGotoWhenBeforeLabelledBlock [

	| blocks |
	"
	INTEGER FUNCTION something()
	GOTO 20
10	x = 1
20	y = 1
	END
	"
	self function: #something type: #integer.
	self addStatement: (self gotoStatement: 20).
	self addStatement: (self
		labelled: 10
		statement: (self assignementStatement: #x value: 1)).
	self addStatement: (self
		labelled: 20
		statement: (self assignementStatement: #y value: 1)).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 3.
	blocks do: [ :block |
		self assert: block statements size equals: 1.
	].
	
	self assert: blocks first firstStatement class equals: FASTFortranGoToStatement.
	self assert: blocks second firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: blocks third firstStatement class equals: FASTFortranAssignmentStatement.

	self assert: blocks first nextBlock equals: blocks third.
	self assert: blocks second nextBlock equals: blocks third.
	self assert: blocks third nextBlock equals: nil

]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testDoLoopCreatesConditionalBlock [

	| conditional blocks loop |
	"
	INTEGER FUNCTION factorial( x)
	INTEGER x
	INTEGER fact=1
 
	DO i=1, x, 1
	fact = fact*i
	END DO	
	RETURN fact
	END
	"
	self function: #factorial type: #integer.
	self addParameter: #x type: #integer.
	self addStatement: (self declarationStatement: #fact type: #integer init: 1).
	loop := self addStatement: (self doStatement: #(i 1 x 1)  statements: #()).
	self
		add: loop statementBlock
		statement: (self assignementStatement: #fact value: (self binary: '*' left: #fact right: #i)).
	self addStatement: (self returnStatement: #fact).
	
	ast accept: visitor.	

	blocks := self findBasicBlocks: FASTFortranConditionalBasicBlock with: [ :basicBloc | true ].

	self assert: blocks size equals: 1.
	conditional := blocks anyOne.

	self assert: conditional firstStatement class equals: FASTFortranDoStatement.

	self assert: conditional nextBlocks size equals: 2
]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testExitInLoop [

	| blocks loopBlock exitBlock returnBlock |
	"
	INTEGER FUNCTION something()
	DO i = 1, 10
     EXIT
	  i = 10
	END DO
	END
	"
	self function: #something type: #integer.
	self addStatement: (self
		doStatement:  #(i 1 10)
		statements: { 
			self exitStatement: nil .
			self assignementStatement: #i value: 10
		}).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 3.

	loopBlock := blocks first.
	exitBlock := blocks detect: [ :block | block firstStatement class = FASTFortranExitStatement ].
	returnBlock := blocks detect: [ :block | block firstStatement class = FASTFortranAssignmentStatement ].

	self assert: loopBlock class equals: FASTFortranConditionalBasicBlock.
	self assert: loopBlock isStart.
	self assert: loopBlock isFinal.
	self assert: (loopBlock nextBlockForValue: true) equals: exitBlock.

	self deny: exitBlock isStart.
	self deny: exitBlock isFinal.
	self assert: exitBlock nextBlock equals: blocks first.

	self deny: returnBlock isStart.
	self deny: returnBlock isFinal.
	self assert: returnBlock nextBlock equals: loopBlock

]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testFirstStatementIsConditional [

	| blocks conditional |
	"
	INTEGER FUNCTION something()
	IF (x) x = 0
	RETURN 5
	END
	"
	self function: 'something' type: #integer.
	self addStatement: (self logicalIf: #x statement: (self assignementStatement: #x value: 0)).
	self addStatement: (self returnStatement: 5).
	
	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 3.

	conditional := blocks detect: [ :block | block isConditional ].

	self assert: conditional isStart.

	self deny: (blocks first nextBlockForValue: true) isStart.
	self deny: (blocks first nextBlockForValue: true) isFinal.

	self deny: (blocks first nextBlockForValue: false) isStart.
	self assert: (blocks first nextBlockForValue: false) isFinal.
]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testFirstStatementIsIfArithmetic [

	| blocks |
	"
	INTEGER FUNCTION something()
	IF (x) 10, 10, 10
	END
	"
	self function: 'something' type: #integer.
	self addStatement: (self
			 ifArithmetic: #x
			 negative: 10
			 null: 10
			 positive: 10).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 1.

	self assert: blocks anyOne isStart.
	self assert: blocks anyOne isFinal
]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testFirstStatementIsLoop [

	| blocks conditional |
	"
	INTEGER FUNCTION something()
	DO i = 1, 10
	  i = 10
	END DO
	RETURN 5
	END
	"
	self function: 'something' type: #integer.
	self addStatement: (self
		doStatement:  #(i 1 10)
		statements: { self assignementStatement: #i value: 10 }).
	self addStatement: (self returnStatement: 5).
	
	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 3.

	conditional := blocks detect: [ :block | block isConditional ].

	self assert: conditional isStart.
.
	self deny: (blocks first nextBlockForValue: true) isStart.
	self deny: (blocks first nextBlockForValue: true) isFinal.

	self deny: (blocks first nextBlockForValue: false) isStart.
	self assert: (blocks first nextBlockForValue: false) isFinal.
]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testFirstStatementOfBlockIsLabelled [

	| blocks |
	"
	INTEGER FUNCTION something()
10	x = 1
	END
	"
	self function: #something type: #integer.
	self addStatement: (self
		labelled: 10
		statement: (self assignementStatement: #x value: 1)).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 1.

	self assert: blocks anyOne firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: blocks anyOne statements size equals: 1
]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testGotoAfterLabelledBlock [

	| blocks |
	"
	INTEGER FUNCTION something()
10	x = 1
20	y = 1
	GOTO 10
	END
	"
	self function: #something type: #integer.
	self addStatement: (self
		labelled: 10
		statement: (self assignementStatement: #x value: 1)).
	self addStatement: (self
		labelled: 20
		statement: (self assignementStatement: #y value: 1)).
	self addStatement: (self gotoStatement: 10).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 2.

	self assert: blocks first  firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: blocks first statements size equals: 1.
	self assert: blocks second firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: blocks second lastStatement  class equals: FASTFortranGoToStatement.

	self assert: blocks first nextBlock equals: blocks second.
	self assert: blocks second nextBlock equals: blocks first

]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testGotoAfterLabelledIfStatement [

	| blocks conditional jump |
	"
	INTEGER FUNCTION something(bool)
	LOGICAL bool
10	IF bool RETURN 0
   GOTO 10
	END
	"
	self function: #something type: #integer.
	self addParameter: #bool type: #logical.
	self addStatement:
		(self labelled: 10 statement:
			(self logicalIf: #bool statement: (self returnStatement: 0))).
	self addStatement: (self gotoStatement: 10).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 4.

	self assert: blocks second class equals: FASTFortranConditionalBasicBlock.

	conditional := blocks detect: [ :block | block class = FASTFortranConditionalBasicBlock ].
	jump := blocks detect: [ :block | block firstStatement class = FASTFortranGoToStatement ].

	self assert: jump nextBlock equals: conditional
]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testGotoBeforeLabelledIfStatement [

	| blocks conditional jump |
	"
	INTEGER FUNCTION something(bool)
	LOGICAL bool
   GOTO 10
10	IF bool RETURN 0
	END
	"
	self function: #something type: #integer.
	self addParameter: #bool type: #logical.
	self addStatement: (self gotoStatement: 10).
	self addStatement:
		(self labelled: 10 statement:
			(self logicalIf: #bool statement: (self returnStatement: 0))).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 3.

	self assert: blocks second isConditional.

	conditional := blocks detect: [ :block | block class = FASTFortranConditionalBasicBlock ].
	jump := blocks detect: [ :block | block lastStatement class = FASTFortranGoToStatement ].

	self assert: jump nextBlock equals: conditional
]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testGotoComputedBeforeLabels [

	| blocks labeledBlock |
	"
	INTEGER FUNCTION something()
   GOTO(10,20,30) x
10	x = 1
20	x = 2
30	x = 3
	END
	"
	self function: #something type: #integer.
	self addStatement: (self gotoComputedStatement: #(10 20 30) expression: #x).
	self addStatement:
		(self labelled: 10 statement:
			(self assignementStatement: #x value: 1)).
	self addStatement:
		(self labelled: 20 statement:
			(self assignementStatement: #x value: 2)).
	self addStatement:
		(self labelled: 30 statement:
			(self assignementStatement: #x value: 3)).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 4.

	self assert: blocks first isConditional.
	self assert: blocks first nextBlocks size equals: 3.

	labeledBlock := blocks first nextBlockForValue: '10'.
	self assert: labeledBlock firstStatement expression primitiveValue equals: '1'.
	self deny: labeledBlock isFinal.

	labeledBlock := labeledBlock nextBlock.
	self assert: labeledBlock equals: (blocks first nextBlockForValue: '20').
	self assert: labeledBlock firstStatement expression primitiveValue equals: '2'.
	self deny: labeledBlock isFinal.

	labeledBlock := labeledBlock nextBlock.
	self assert: labeledBlock equals: (blocks first nextBlockForValue: '30').
	self assert: labeledBlock firstStatement expression primitiveValue equals: '3'.
	self assert: labeledBlock isFinal.
]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testIfStatementCreatesConditionalBlock [

	| blocks  conditional |
	self functionWithConditional accept: visitor.

	blocks := self findBasicBlocks: FASTFortranConditionalBasicBlock with: [ :basicBloc | true ].

	self assert: blocks size equals: 1.
	conditional := blocks anyOne.

	self assert: conditional firstStatement class equals: FASTFortranIfBlockStatement.

	self assert: conditional nextBlocks size equals: 2
]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testIfStatementElsePartIsABasicBlock [

	| aBlock |
	self functionWithConditional accept: visitor.

	aBlock := (self findBasicBlocks: FASTFortranConditionalBasicBlock with: [:e | true])
		anyOne nextBlockForValue: false.

	self assert: aBlock class equals: FASTFortranBasicBlock.

	self assert: aBlock firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: aBlock firstStatement expression class equals: FASTFortranCharacterLiteral.
	self assert: aBlock firstStatement expression primitiveValue equals: '"big"'.

	self assert: aBlock lastStatement class equals: FASTFortranAssignmentStatement.
	self assert: aBlock lastStatement expression class equals: FASTFortranBinaryExpression.
	self assert: aBlock lastStatement expression operator equals: '-'.

]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testIfStatementFollowedByABasicBlock [

	| blocks |
	self functionWithConditional accept: visitor.

	blocks := self findBasicBlocks: FASTFortranBasicBlock with: [ :basicBloc |
		basicBloc lastStatement class = FASTFortranReturnStatement
	].

	self assert: blocks size equals: 1.
	self assert: blocks anyOne statements size equals: 1.
]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testIfStatementThenPartIsABasicBlock [

	| aBlock |
	self functionWithConditional accept: visitor.

	aBlock := (self findBasicBlocks: FASTFortranConditionalBasicBlock with: [:e | true])
		anyOne nextBlockForValue: true.

	self assert: aBlock class equals: FASTFortranBasicBlock.

	self assert: aBlock firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: aBlock firstStatement expression class equals: FASTFortranCharacterLiteral.
	self assert: aBlock firstStatement expression primitiveValue equals: '"small"'.

	self assert: aBlock lastStatement class equals: FASTFortranAssignmentStatement.
	self assert: aBlock lastStatement expression class equals: FASTFortranFunctionCall.
	self assert: aBlock lastStatement expression name equals: 'fctSmall'.

]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testIfStatementWithoutElsePart [

	| conditional blocks then last |
	"
	CHARACTER*20 FUNCTION fctBigSmall( x)
	INTEGER x

	IF x .gt. 5 THEN
	x = 0
	END IF

	RETURN '""done""'
	END
	"
	self function: #fctBigSmall type: #(character 20).
	self addParameter: #x type: #integer.
	self addStatement:
		(self
			ifBlock: (self binary: '.gt.' left: #x right: 5)
			then: { self assignementStatement: #x value: 0 } 
			else: nil).
	self addStatement: (self returnStatement: '"done"').

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 4.

	conditional := blocks detect: [ :block | block isConditional ].
	then := blocks detect: [ :block | block firstStatement class = FASTFortranAssignmentStatement ].
	last := blocks detect: [ :block | block firstStatement class = FASTFortranReturnStatement ].

	self assert: (conditional nextBlockForValue: true) equals: then.
	self assert: (conditional nextBlockForValue: false) equals: last.

	self assert: then nextBlock equals: last.

]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testLabelledIfStatementStartsNewBlock [

	| blocks |
	"
	INTEGER FUNCTION something(bool)
	LOGICAL bool
10	IF bool RETURN 0
   RETURN 1
	END
	"
	self function: #something type: #integer.
	self addParameter: #bool type: #logical.
	self addStatement: (self
		labelled: 10
		statement: (self logicalIf: #bool statement: (self returnStatement: 0))).
	self addStatement: (self returnStatement: 1).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 4.

	self assert: blocks first class equals: FASTFortranBasicBlock.
	self assert: blocks first  firstStatement class equals: FASTFortranVariableDeclarationStatement.

	self assert: blocks second class equals: FASTFortranConditionalBasicBlock.

	self assert: blocks third class equals: FASTFortranBasicBlock.
	self assert: blocks third  firstStatement class equals: FASTFortranReturnStatement.

	self assert: blocks fourth class equals: FASTFortranBasicBlock.
	self assert: blocks fourth firstStatement class equals: FASTFortranReturnStatement.
]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testLabelledStatementFollowingLabelledStatement [

	| blocks |
	"
	INTEGER FUNCTION something()
10	INTEGER x = 5
20 RETURN x
	END
	"
	self function: #something type: #integer.
	self addStatement: (self labelled: 10 statement: (self declarationStatement: #x type: #integer init: 5)).
	self addStatement: (self labelled: 20 statement: (self returnStatement: #x)).
	
	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 2.

	self assert: blocks first firstStatement class equals: FASTFortranVariableDeclarationStatement.
	self assert: blocks first statements size equals: 1.
	self assert: blocks second firstStatement class equals: FASTFortranReturnStatement.
	self assert: blocks second statements size equals: 1.

	self assert: blocks first  nextBlock equals: blocks second.
	self assert: blocks second isFinal


]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testLabelledStatementStartsNewBlock [

	| blocks |
	"
	INTEGER FUNCTION something()
	INTEGER x = 5
10 RETURN x
	END
	"
	self function: #something type: #integer.
	self addStatement: (self declarationStatement: #x type: #integer init: 5).
	self addStatement: (self labelled: 10 statement: (self returnStatement: #x)).
	
	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 2.
	self assert: blocks first firstStatement class equals: FASTFortranVariableDeclarationStatement.
	self assert: blocks second firstStatement class equals: FASTFortranReturnStatement.
]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testLastStatementIsConditional [

	| blocks conditional |
	"
	INTEGER FUNCTION something(x)
	INTEGER x
	IF (x) return 0
	END
	"
	self function: 'something' type: #integer.
	self addParameter: #x type: #integer.
	self addStatement: (self logicalIf: #x statement: (self returnStatement: 0)).
	
	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 3.

	conditional := blocks detect: [ :block | block isConditional ].
	self assert: blocks first nextBlock equals: conditional.

	self assert: (conditional nextBlockForValue: true) isFinal.
	self assert: conditional isFinal.

]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testProgramUnitBodyStartsABasicBlock [

	| blocks |
	self functionWithConditional accept: visitor.

	blocks := self findBasicBlocks: FASTFortranBasicBlock with: [ :basicBloc |
		basicBloc firstStatement class = FASTFortranVariableDeclarationStatement
	].

	self assert: blocks size equals: 1.

	self assert: blocks anyOne firstStatement declarators size equals: 1.
	self assert: blocks anyOne lastStatement class equals: FASTFortranAssignmentStatement.
	self assert: blocks anyOne lastStatement variable name equals: 'x'.
]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testReturnDoesNotHaveNextBlock [

	| blocks |
	"
	INTEGER FUNCTION something()
	integer x
	RETURN
	x = 1
	END
	"
	self function: #something type: #integer.
	self addStatement: (self declarationStatement: #x type: #integer).
	self addStatement: (self returnStatement: nil).
	self addStatement: (self assignementStatement: #x value: 1).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 2.

	self assert: blocks first firstStatement class equals: FASTFortranVariableDeclarationStatement.
	self assert: blocks first statements size equals: 2.
	self assert: blocks first isFinal.
	self assert: blocks first nextBlock isNullBlock.

	self assert: blocks second firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: blocks second statements size equals: 1.
	self assert: blocks second isFinal.
	self assert: blocks second nextBlock isNil

]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testReturnInThen [

	| blocks |
	"
	INTEGER FUNCTION something()
	IF (x .le. 5) THEN
	  RETURN
	ELSE
	  x = 5
	END IF
	END
	"
	self function: #something type: #integer.
	self addStatement: (self
		ifBlock: (self binary: '.le.' left: #x right: 5)
		then: { self returnStatement: nil } 
		else: { self assignementStatement: #x value: 5 } ).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 3.

	self assert: blocks first isStart.
	self assert: blocks first isConditional.
	self deny: blocks first isFinal.

	self assert: (blocks first nextBlockForValue: true) statements size equals: 1.
	self
		assert: (blocks first nextBlockForValue: true) firstStatement class
		equals: FASTFortranReturnStatement.
	self assert: (blocks first nextBlockForValue: true) isFinal.

	self assert: (blocks first nextBlockForValue: false) statements size equals: 1.
	self
		assert: (blocks first nextBlockForValue: false) firstStatement class
		equals: FASTFortranAssignmentStatement.
	self assert: (blocks first nextBlockForValue: false) isFinal.

]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testReturnInThenFollowedByStatement [

	| blocks |
	"
	INTEGER FUNCTION something()
	IF (x .le. 5) THEN
	  RETURN
	END IF
	x = 5
	END
	"
	self function: #something type: #integer.
	self addStatement: (self
		ifBlock: (self binary: '.le.' left: #x right: 5)
		then: { self returnStatement: nil } 
		else: nil).
	self addStatement: (self assignementStatement: #x value: 5).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 3.

	self assert: blocks first isStart.
	self assert: blocks first isConditional.
	self deny: blocks first isFinal.

	self assert: (blocks first nextBlockForValue: true) statements size equals: 1.
	self
		assert: (blocks first nextBlockForValue: true) firstStatement class
		equals: FASTFortranReturnStatement.
	self assert: (blocks first nextBlockForValue: true) isFinal.

	self assert: (blocks first nextBlockForValue: false) statements size equals: 1.
	self
		assert: (blocks first nextBlockForValue: false) firstStatement class
		equals: FASTFortranAssignmentStatement.
	self assert: (blocks first nextBlockForValue: false) isFinal.

]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testReturnIntroducesNullBlock [

	| blocks |
	"
	INTEGER FUNCTION something()
	x = 1
	RETURN
	END
	"
	self function: #something type: #integer.
	self addStatement: (self assignementStatement: #x value: 1).
	self addStatement: (self returnStatement: nil).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 1.

	self assert: blocks anyOne firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: blocks anyOne statements size equals: 2.
	self assert: blocks anyOne isFinal.
	self assert: blocks anyOne nextBlock isNullBlock

]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testSourceCode [

	| blocks |
	"
	INTEGER FUNCTION something()
	x = 1
	y = 1
	END
	"
	self function: #something type: #integer.
	self addStatement: (self assignementStatement: #x value: 1).
	self addStatement: (self assignementStatement: #y value: 1).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 1.

	self assert: blocks anyOne sourceCode equals: '        x = 1
        y = 1
'
]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testSourceCodeIfBlock [

	| blocks |
	"
	INTEGER FUNCTION something(x)
	INTEGER x
	IF (x .lt. 5) THEN
	return 0
	ELSE
	return x
	END
	"
	self function: #something type: #integer.
	self addParameter: #x type: #integer.
	self addStatement: (self
		ifBlock: (self binary: '.lt.' left: #x right: 5)
		then: { self returnStatement: 0 }
		else:  {self returnStatement: #x}).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 4.


	self assert: blocks second class equals: FASTFortranConditionalBasicBlock.
	self assert: blocks second sourceCode equals: 'if (x .lt. 5)'
]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testSourceCodeIfLogical [

	| blocks |
	"
	INTEGER FUNCTION something(x)
	INTEGER x
	IF (x .lt. 5) return x
	END
	"
	self function: 'something' type: #integer.
	self addParameter: #x type: #integer.
	self addStatement: (self
		logicalIf: (self binary: '.lt.' left: #x right: 5)
		statement: (self returnStatement: #x)).
	
	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 3.


	self assert: blocks second class equals: FASTFortranConditionalBasicBlock.
	self assert: blocks second sourceCode equals: 'if (x .lt. 5)'
]

{ #category : #tests }
FASTFortranCFGVisitorTest >> testStartFinalBlocks [

	| blocks |
	"
	INTEGER FUNCTION something()
	INTEGER x = 5
20 RETURN x
	END
	"
	self function: #something type: #integer.
	self addStatement: (self declarationStatement: #x type: #integer init: 5).
	self addStatement: (self labelled: 20 statement: (self returnStatement: #x)).
	
	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 2.

	self assert: blocks first isStart.
	self deny:   blocks first isFinal.

	self deny:   blocks second isStart.
	self assert: blocks second isFinal.

]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testThenWithConditionalAndBasicBlock [

	"
      SUBROUTINE TXT2TB
      ITAB1 = 0
      IF (MODE.EQ.5) THEN
      IF (.NOT.GETCLE('ITABT')) CALL ERREUR(4,'MOT-CLE ITABT...')
      CALL GETOBJ('TABLE   ',ITAB1)
      ENDIF
      END
"
	| blocks ifMode ifGetcle callErreur callGetobj astThenStatementBlock |
	astThenStatementBlock := {
		self
			logicalIf: (self unary: '.not.' operand: (self functionCall: 'GETCLE' arguments: { 'ITABT' } ))
			statement: (self callStatement: 'erreur' arguments: {4 . 'MOT-CLE ATTENDU...'})
		.
		self callStatement: 'GETOBJ' arguments: {'TABLE   ' . #ITAB1 }
		}.

	self subroutine: 'TXT2TB'.
	self addStatement: (self assignementStatement: #ITAB1 value: 0).
	self addStatement: (self ifBlock: (self binary: '.eq.' left: #mode right: 5) then: astThenStatementBlock else: nil	).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 5.

	self assert: blocks first  firstStatement class equals: FASTFortranAssignmentStatement.
	self assert: blocks first  statements size equals: 1.

	ifMode := blocks detect: [ :block |
		(block isConditional) and:
		[ block firstStatement condition class = FASTFortranBinaryExpression ] ].
	ifGetcle := blocks detect: [ :block |
		(block isConditional) and:
		[ block firstStatement condition class = FASTFortranUnaryExpression ] ].
	callErreur := blocks detect: [ :block |
		(block firstStatement class = FASTFortranCallStatement) and:
		[ block firstStatement name = 'erreur' ] ].
	callGetobj := blocks detect: [ :block |
		(block firstStatement class = FASTFortranCallStatement) and:
		[ block firstStatement name = 'GETOBJ' ] ].

	self assert: blocks second equals: ifMode.
	self assert: ifMode isFinal.
	self assert: (ifMode nextBlockForValue: true) equals: ifGetcle.

	self assert: (ifGetcle nextBlockForValue: true) equals: callErreur.
	self assert: (ifGetcle nextBlockForValue: false) equals: callGetobj.

	self assert: callGetobj isFinal
]

{ #category : #'tests - cfg' }
FASTFortranCFGVisitorTest >> testTwoSuccessiveLogicalIfs [

	| blocks condX condY |
	"
	INTEGER FUNCTION something()
	IF (x) RETURN 0
	IF (y) RETURN 1
	END
	"
	self function: #something type: #integer.
	self addStatement: (self logicalIf: #x statement: (self returnStatement: 0)).
	self addStatement: (self logicalIf: #y statement: (self returnStatement: 1)).

	ast accept: visitor.

	blocks := visitor basicBlocks.

	self assert: blocks size equals: 4.

	condX := blocks detect: [ :block |
		(block isConditional) and: 
		[block firstStatement condition name = 'x'] ].
	condY := blocks detect: [ :block |
		(block isConditional) and: 
		[block firstStatement condition name = 'y'] ].

	self assert: condX isStart.
	self deny: condX isFinal.
	self assert: (condX nextBlockForValue: true) isFinal.
	self assert: (condX nextBlockForValue: false) equals: condY.

	self deny: condY isStart.
	self assert: condY isFinal.
	self assert: (condX nextBlockForValue: true) isFinal

]
