Class {
	#name : #FASTFortranAbstractVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'visitor'
	],
	#category : #'FAST-Fortran-Visitors-Tests-Visitor'
}

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> array: name access: aCollection [

	^FASTFortranArrayVariable new
		name: name ;
		indices: aCollection ;
		yourself

]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> arrayDeclaration: variable dimensions: aCollection [

	^ FASTFortranVariableDeclarationStatement new
		  type: (self integerType: nil);
		  declarators: { self arrayDeclarator: variable dimensions: aCollection };
		  startPos: 1;
		  endPos: 10;
		  yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> arrayDeclarator: variable dimensions: aCollection [

	| declarator |
	declarator := self variableDeclarator: variable.
	declarator dimensions: (aCollection collect: [ :dim || min max|
		(dim size = 2)
			ifTrue: [ min := dim first. max := dim second ]
			ifFalse: [ min := nil. max := dim first].
			 FASTFortranArrayRange new
				 lowerBound: (min ifNotNil: [self integerLiteral: min]);
				 upperBound: (self integerLiteral: max)
	]).

	^ declarator
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> arrayVariable: aName indice: anInteger [
	^FASTFortranArrayVariable new
		name: aName ;
		indices: { self integerLiteral: anInteger }
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> assignement: aName expression: value [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranAssignmentExpression new
		variable: (self scalarVariable: aName) ;
		expression: value ;
		startPos: 1 ;
		endPos: aName size + 3 ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> assignementStatement: aName value: rhs [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranAssignmentStatement new
		variable: (self scalarVariable: aName) ;
		expression: rhs ;
		startPos: 1 ;
		endPos: aName size + 3 ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> binary: op left: lhsVar right: rhsVal [
	"a binary operation between a variable (left) and an integer value (right)"

	^FASTFortranBinaryExpression new
		operator: op ;
		left: (self scalarVariable: lhsVar) ;
		right: (self integerLiteral: rhsVal) ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> callStatement: aName arguments: aCollection [	
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranCallStatement new
		name: aName ;
		arguments: aCollection ;
		startPos: 1 ;
		endPos: aName size + 4 ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> characterLiteral: value [
	^FASTFortranCharacterLiteral new
		primitiveValue: value ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> characterType: dimension [
	^FASTFortranCharacterType new
		size: (self typeSize: dimension) ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> comment: text [
	^FASTFortranComment new
		content: text asString ;
		startPos: 1 ;
		endPos: text asString size + 1 ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> declarationStatement: type variables: aCollection [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranVariableDeclarationStatement new
		type: type ;
		declarators: (self variableDeclarators: aCollection)  ;
		startPos: 1 ;
		endPos: 10 ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> doStatement: control statements: stmtBlock [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranDoStatement new
		loopControl: control ;
		statementBlock: (self statementBlock: stmtBlock) ;
		startPos: 1 ;
		endPos: 20 ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> entity: owner parameters: aCollection [
	^owner
		parameters: (self scalarVariables: aCollection) ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> externalStatement: aName [
	^FASTFortranExternalStatement new
		name: aName ;
		startPos: 1 ;
		endPos: 8 ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> functionCall: aName arguments: aCollection [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranFunctionCall new
		name: aName ;
		arguments: aCollection ;
		startPos: 1 ;
		endPos: aName size + 3 ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> functionDeclaration: aName [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranFunction new
		name: aName ;
		returnType: FASTFortranRealType new ;
		parameters: {  } ;
		statementBlock: FASTFortranStatementBlock new
		yourself.
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> ifBlock: condition then: thenBlock else: elseBlock [
	^FASTFortranIfBlockStatement new
		condition: condition ;
		thenStatementBlock: (self statementBlock: thenBlock) ;
		elseStatementBlock: (elseBlock ifNil: [ nil ] ifNotNil: [self statementBlock: elseBlock]) ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> implicitRange: from to: to [

	^FASTFortranImplicitRange new
		from: from ;
		to: to ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> implicitStatement [
	^FASTFortranImplicitStatement new
		startPos: 1 ;
		endPos: 13 ;
		typingRules: #() ;
		yourself

]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> integerLiteral: value [
	^FASTFortranIntegerLiteral new
		primitiveValue: value ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> integerType: dimension [
	^FASTFortranIntegerType new
		size: (self typeSize: dimension) ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> labelReference: aString [

	^FASTFortranLabelReference new
		label: aString ;
		startPos: 1 ;
		endPos: aString size ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> logicalLiteral: value [
	^FASTFortranBooleanLiteral new
		primitiveValue: value ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> logicalType: dimension [
	^FASTFortranLogicalType new
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> loopControlInit: init increment: incr limit: limit [
	"incr is nil or a integerLiteral, limit is assumed to be a scalarVariable name"
	| entity |
	entity := FASTFortranLoopControlExpression new.
	entity init: init.
	incr ifNotNil: [ entity increment: (self integerLiteral: incr) ].
	entity limit: (self scalarVariable: limit).
	^entity
]

{ #category : #running }
FASTFortranAbstractVisitorTest >> newVisitor [

	self subclassResponsibility
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> printStatement: aCollection [

	^FASTFortranPrintStatement new
		format: FASTFortranAsterisk new ;
		arguments: aCollection ;
		startPos: 1 ;
		endPos: 30 ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> readStatement: aCollection [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranReadStatement new
		ioParameters: { FASTFortranAsterisk new . FASTFortranAsterisk new  } ;
		arguments: aCollection ;
		startPos: 1 ;
		endPos: 30 ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> realLiteral: value [
	^FASTFortranRealLiteral new
		primitiveValue: value ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> realType: dimension [
	^FASTFortranRealType new
		size: (self typeSize: dimension) ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> returnStatement: expression [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranReturnStatement new
		expression: expression ;
		startPos: 1 ;
		endPos: 6 ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> scalarVariable: aName [
	^FASTFortranScalarVariable new
		name: aName ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> scalarVariables: aCollectionOfString [
	^aCollectionOfString collect: [ :aString | self scalarVariable: aString ]
]

{ #category : #running }
FASTFortranAbstractVisitorTest >> setUp [
	super setUp.

	visitor := self newVisitor
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> statementBlock: aCollection [
	^FASTFortranStatementBlock new
		statements: aCollection ;
		startPos: 1 ;
		endPos: (aCollection ifNotEmpty: [ aCollection last endPos ] ifEmpty: [ 2 ]) ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> subroutine: aName [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranSubroutine new
		name: aName ;
		statementBlock: (self statementBlock: #()) ;
		startPos: 1 ;
		endPos: 50 ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> typeSize: dimension [
	dimension isNumber ifTrue: [ ^self integerLiteral: dimension asString ].
	dimension = '*' ifTrue: [ ^FASTFortranAsterisk new ].
	^nil
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> unary: op operand: operand [

	^FASTFortranUnaryExpression new
		operator: op ;
		expression: operand ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> variableDeclarator: aName [
	^FASTFortranVariableDeclarator new
		variable: aName ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> variableDeclarators: aCollectionOfString [
	^aCollectionOfString collect: [ :aString | self variableDeclarator: aString ]
]

{ #category : #'entity creation' }
FASTFortranAbstractVisitorTest >> writeStatement: aCollection [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTFortranWriteStatement new
		ioParameters: { FASTFortranAsterisk new . FASTFortranAsterisk new  } ;
		arguments: aCollection ;
		startPos: 1 ;
		endPos: 30 ;
		yourself
]
