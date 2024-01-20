Class {
	#name : #FASTFortranConditionalBasicBlock,
	#superclass : #FASTFortranAbstractBasicBlock,
	#instVars : [
		'condition',
		'nextBlocks'
	],
	#category : #'FAST-Fortran-Visitors-CFG'
}

{ #category : #accessing }
FASTFortranConditionalBasicBlock >> condition [

	^ condition
]

{ #category : #accessing }
FASTFortranConditionalBasicBlock >> condition: anObject [

	condition := anObject
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

{ #category : #accessing }
FASTFortranConditionalBasicBlock >> statements [

	self flag: 'should contain the real statement that lead to this block'.

	^{ FASTFortranIfLogicalStatement new
		condition: self condition ;
		statement: (FASTFortranStatementBlock new) ;
		yourself }
]
