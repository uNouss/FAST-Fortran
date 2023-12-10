Trait {
	#name : #FASTTExporter,
	#instVars : [
		'indent',
		'operatorsPrecedence',
		'expressionContextOperator',
		'outputStream'
	],
	#category : #'FAST-Fortran-Visitors-Visitor'
}

{ #category : #outputting }
FASTTExporter >> << aPrintable [
	"syntactical sugar"

	self output: aPrintable
]

{ #category : #precedence }
FASTTExporter >> expressionContextOperator [
	"lazy accessor"

	^expressionContextOperator ifNil: [ expressionContextOperator := Stack new ].

]

{ #category : #outputting }
FASTTExporter >> indent [

	indent ifNil: [ ^indent := 1 ].
	^indent := indent + 1
]

{ #category : #outputting }
FASTTExporter >> indented: aPrintable [

	self outputIndentPrefix.
	self unindented: aPrintable
]

{ #category : #precedence }
FASTTExporter >> initializeOperatorsPrecedence [
	"should put in variable #operatorsPrecedence the precedence of each operator of the language
	Higher number means higher precedence
	Same operator can be entered in different forms (eg: #add and #'+')
	
	The value here are examples but should be correct for most languages.
	They fit C/Java operators definition.
	The gaps in precedence values allow to introduce other opertaros if needed.
	These precedences can be changed.

	The last one (#topLevelExpression) is introduced to deal with expressions within other expressions
	For example `1 * someFunction(2 + 3)` here '*' has no precedence over '+', but because it is
	based on a global expression stack, it could get confused.
	The solution is to push #topLevelExpression on the stack at the start of a new expression (here
	'2 + 3')"

	^operatorsPrecedence := Dictionary newFrom: {
		"postfixOperator"
		#'unary++' -> 120 .
		#'unary--' -> 120 .

		"prefixOperator"
		#'++unary' -> 110 .
		#'--unary' -> 110 .
		#'+unary' -> 110 .
		#'-unary' -> 110 .
		#'~unary' -> 110 .
		#'!unary' -> 110 .
		
		"cast"
		#cast -> 100 .

		"multiplicativeOperator"
		#'*' -> 90 .
		#times -> 90 .
		#'/' -> 90 .
		#divide -> 90 .
		#'%' -> 90 .
		#mod -> 90 .
	
		"stringConcatenationOperator -- needed to deal with: String+(i+1)"
		#concat -> 80 .

		"additiveOperator"
		#'+' -> 70 .
		#add -> 70 .
		#'-' -> 70 .
		#minus -> 70 .

		"relationalOperator"
		#'<' -> 60 .
		#lt -> 60 .
		#lessThan -> 60 .

		#'>' -> 60 .
		#gt -> 60 .
		#greaterThan -> 60 .

		#'<=' -> 60 .
		#le -> 60 .
		#lessEqual -> 60 .

		#'>=' -> 60 .
		#ge -> 60 .
		#greaterEqual -> 60 .

		"equalityOperator"
		#'==' -> 50 .
		#eq -> 50 .
		#equal -> 50 .

		#'!=' -> 50 .
		#ne -> 50 .
		#notEqual -> 50 .

		"logicalAndOperator"
		#'&&' -> 40 .
		#and -> 40 .

		"logicalOrOperator"
		#'||' -> 30 .
		#or -> 30 .

		"ternaryOperator"
		#'?:' -> 20 .

		"assignmentOperator"
		#'=' ->  10 .
		#'+=' -> 10 .
		#'-=' -> 10 .
		#'*=' -> 10 .
		#'/=' -> 10 .

		#topLevelExpression -> 0
	}
]

{ #category : #precedence }
FASTTExporter >> lowerPrecedence: operator [
	"check whether #operator has lower precedence than a surounding expression (top of
	expressionContextOperator)
	If so, the current expression will need to be parenthesized"

	^self expressionContextOperator
		ifEmpty: [ false ]
		ifNotEmpty: [ :operatorStack |
			(self operatorPrecedence: operator) < (self operatorPrecedence: operatorStack top)]
]

{ #category : #outputting }
FASTTExporter >> newLine [

	self output: String cr
]

{ #category : #precedence }
FASTTExporter >> operatorPrecedence: operator [
	"lazy accessor"

	^(operatorsPrecedence ifNil: [ self initializeOperatorsPrecedence ])
		at: operator
]

{ #category : #outputting }
FASTTExporter >> output: aPrintable [

	self outputStream << aPrintable
]

{ #category : #precedence }
FASTTExporter >> outputExpression: aBlock inParentheses: aBoolean [
	"executes aBlock to output some expression, putting it within parenthesis if needed"

	aBoolean ifTrue: [ self output: $( ].
	aBlock value.
	aBoolean ifTrue: [ self output: $) ]
]

{ #category : #precedence }
FASTTExporter >> outputExpression: aBlock withOperator: operator [
	"execute aBlock possibly putting parenthesis around the result depending on the precedence of #operator
	 But before executing a block, we need to push the operator on the context stack so that 
	 precedence of possible sub-expressions be compared to it"

	self
		outputExpression: [
			expressionContextOperator push: operator.
			aBlock value.
			expressionContextOperator pop
		]
		 inParentheses: (self lowerPrecedence: operator)
]

{ #category : #outputting }
FASTTExporter >> outputIndentPrefix [
	"prints indentation spaces"

	indent ifNil: [ indent := 0 ].
	self spaces: (indent * 2)
	
]

{ #category : #outputting }
FASTTExporter >> outputStream [
	"lazy accessor"

	^outputStream ifNil: [ outputStream := WriteStream on: '' ]
]

{ #category : #precedence }
FASTTExporter >> outputTopLevelExpression: aBlock [
	"Execute aBlock to output an expression.
	 Puts special symbol on the expressionContextOperator stack to indicate the start of a
	 new expression

	See comment in #initializeOperatorsPrecedence"

	expressionContextOperator push: #topLevelExpression.
	aBlock value.
	expressionContextOperator pop
]

{ #category : #outputting }
FASTTExporter >> space [

	self output: String space
]

{ #category : #outputting }
FASTTExporter >> spaces: n [

	n timesRepeat: [ self space ]
]

{ #category : #outputting }
FASTTExporter >> unindent [

	indent ifNil: [ ^indent := 0 ].
	(indent <= 0) ifTrue: [ ^indent := 0 ].
	^indent := indent - 1
]

{ #category : #outputting }
FASTTExporter >> unindented: aPrintable [

	self output: aPrintable
]
