Class {
	#name : #FASTFortranAbstractBasicBlock,
	#superclass : #Object,
	#instVars : [
		'isStart',
		'statements'
	],
	#category : #'FAST-Fortran-Visitors-CFG'
}

{ #category : #accessing }
FASTFortranAbstractBasicBlock >> addStatement: aFASTStatement [

	self statements add: aFASTStatement
]

{ #category : #accessing }
FASTFortranAbstractBasicBlock >> firstStatement [

	^self isEmpty 
		ifTrue: [ nil ]
		ifFalse: [ self statements first ]
]

{ #category : #initialization }
FASTFortranAbstractBasicBlock >> initialize [

	super initialize.

	isStart := false.
	statements := OrderedCollection new
]

{ #category : #testing }
FASTFortranAbstractBasicBlock >> isEmpty [

	^self statements isEmpty
]

{ #category : #accessing }
FASTFortranAbstractBasicBlock >> isFinal [

	^self nextBlocks isEmpty
]

{ #category : #accessing }
FASTFortranAbstractBasicBlock >> isStart [

	^isStart
]

{ #category : #accessing }
FASTFortranAbstractBasicBlock >> isStart: anObject [

	isStart := anObject
]

{ #category : #accessing }
FASTFortranAbstractBasicBlock >> lastStatement [

	^self statements last
]

{ #category : #accessing }
FASTFortranAbstractBasicBlock >> nextBlocks [

	self subclassResponsibility
]

{ #category : #printing }
FASTFortranAbstractBasicBlock >> sourceCode [

	self subclassResponsibility 
]

{ #category : #accessing }
FASTFortranAbstractBasicBlock >> statements [

	^statements
]
