Class {
	#name : #FASTFortranBasicBlock,
	#superclass : #FASTFortranAbstractBasicBlock,
	#instVars : [
		'statements',
		'nextBlock'
	],
	#category : #'FAST-Fortran-Visitors-CFG'
}

{ #category : #initialization }
FASTFortranBasicBlock >> initialize [

	super initialize.

	statements := OrderedCollection new
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

{ #category : #accessing }
FASTFortranBasicBlock >> statements [

	^statements
]
