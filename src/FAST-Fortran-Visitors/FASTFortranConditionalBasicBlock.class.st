Class {
	#name : #FASTFortranConditionalBasicBlock,
	#superclass : #FASTFortranAbstractBasicBlock,
	#instVars : [
		'nextBlocks'
	],
	#category : #'FAST-Fortran-Visitors-CFG'
}

{ #category : #accessing }
FASTFortranConditionalBasicBlock >> addStatement: aStatement [

	self isEmpty ifFalse: [ AssertionFailure signal: 'ConditionalBasicBlocks can have only one statement' ].

	super addStatement: aStatement
]

{ #category : #initialization }
FASTFortranConditionalBasicBlock >> initialize [

	super initialize.

	nextBlocks := Dictionary new: 3
]

{ #category : #accessing }
FASTFortranConditionalBasicBlock >> isFinal [

	super isFinal ifTrue: [ ^true ].
	nextBlocks valuesDo: [ :nextBlock | nextBlock ifNil: [ ^true ] ].
	^false
]

{ #category : #accessing }
FASTFortranConditionalBasicBlock >> nextBlock: aBlock onValue: aValue [

	nextBlocks at: aValue put: aBlock
]

{ #category : #accessing }
FASTFortranConditionalBasicBlock >> nextBlockForValue: aValue [

	^nextBlocks at: aValue ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTFortranConditionalBasicBlock >> nextBlocks [

	^nextBlocks values
]

{ #category : #printing }
FASTFortranConditionalBasicBlock >> sourceCode [

	^self firstStatement exportForBasicBlock
]

{ #category : #accessing }
FASTFortranConditionalBasicBlock >> statement: aFASTFortranStatement [

	self addStatement: aFASTFortranStatement 
]

{ #category : #accessing }
FASTFortranConditionalBasicBlock >> substituteBlock: oldBlock with: newBlockOrNil [

	nextBlocks do: [ :assoc |
		(assoc value = oldBlock) ifTrue: [ assoc value: newBlockOrNil ]
	]
]
