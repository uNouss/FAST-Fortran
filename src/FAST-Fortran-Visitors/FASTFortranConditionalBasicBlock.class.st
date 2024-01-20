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

	nextBlocks := OrderedCollection new: 2
]

{ #category : #accessing }
FASTFortranConditionalBasicBlock >> nextBlock: aBlock onValue: aValue [

	nextBlocks add: (aValue -> aBlock)
]

{ #category : #accessing }
FASTFortranConditionalBasicBlock >> nextBlockForValue: aValue [

	^nextBlocks
		detect: [ :assoc | assoc key = aValue ]
		ifOne: [  :assoc | assoc value ]
		ifNone: [ nil ]
]

{ #category : #accessing }
FASTFortranConditionalBasicBlock >> nextBlocks [

	^nextBlocks collect: [ :assoc | assoc value ]
]

{ #category : #printing }
FASTFortranConditionalBasicBlock >> sourceCode [

	^self firstStatement exportForBasicBlock
]

{ #category : #accessing }
FASTFortranConditionalBasicBlock >> statement: aFASTFortranStatement [

	self addStatement: aFASTFortranStatement 
]
