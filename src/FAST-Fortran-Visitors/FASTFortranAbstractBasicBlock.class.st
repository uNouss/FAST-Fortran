Class {
	#name : #FASTFortranAbstractBasicBlock,
	#superclass : #Object,
	#instVars : [
		'isStart'
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

	isStart := false
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

{ #category : #accessing }
FASTFortranAbstractBasicBlock >> sourceCode [

	^FASTFortranExporterVisitor export: (FASTFortranStatementBlock new
		statements: self statements ;
		yourself)
]

{ #category : #accessing }
FASTFortranAbstractBasicBlock >> statements [

	self subclassResponsibility
]
