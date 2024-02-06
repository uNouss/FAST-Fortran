"
Represent a block in the control flow graph

a block has
- #statements in a FAST ast that it contains
- properties
  - #start: for starting block in the CFG
  - #final for final blocks in the CFG
- #nextBlocks that come after it in the CFG
"
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
FASTFortranAbstractBasicBlock >> isConditional [

	^false
]

{ #category : #testing }
FASTFortranAbstractBasicBlock >> isEmpty [

	^self statements isEmpty
]

{ #category : #testing }
FASTFortranAbstractBasicBlock >> isFinal [
	"The block last statement is also the last executed one in the CFG"

	^(self nextBlocks isEmpty) or:
	[ self nextBlocks anySatisfy: [ :block | block isNil or: [ block isNullBlock]] ]
]

{ #category : #testing }
FASTFortranAbstractBasicBlock >> isNullBlock [

	^false
]

{ #category : #testing }
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
