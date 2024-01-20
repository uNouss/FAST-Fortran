Class {
	#name : #FASTFortranAbstractBasicBlock,
	#superclass : #Object,
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

{ #category : #testing }
FASTFortranAbstractBasicBlock >> isEmpty [

	^self statements isEmpty
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
FASTFortranAbstractBasicBlock >> statements [

	self subclassResponsibility
]
