Class {
	#name : #FASTFortranBasicBlock,
	#superclass : #FASTFortranAbstractBasicBlock,
	#instVars : [
		'firstStatement',
		'lastStatement',
		'nextBlock'
	],
	#category : #'FAST-Fortran-Visitors-CFG'
}

{ #category : #accessing }
FASTFortranBasicBlock >> firstStatement [

	^ firstStatement
]

{ #category : #accessing }
FASTFortranBasicBlock >> firstStatement: anObject [

	firstStatement := anObject
]

{ #category : #accessing }
FASTFortranBasicBlock >> lastStatement [

	^ lastStatement
]

{ #category : #accessing }
FASTFortranBasicBlock >> lastStatement: anObject [

	lastStatement := anObject
]

{ #category : #accessing }
FASTFortranBasicBlock >> nextBlock [

	^ nextBlock
]

{ #category : #accessing }
FASTFortranBasicBlock >> nextBlock: anObject [

	nextBlock := anObject
]

{ #category : #accessing }
FASTFortranBasicBlock >> nextBlocks [

	^{ nextBlock }
]
