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

	self output: aPrintable
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

{ #category : #outputting }
FASTTExporter >> newLine [

	self output: String cr
]

{ #category : #outputting }
FASTTExporter >> output: aPrintable [

	self outputStream << aPrintable
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
