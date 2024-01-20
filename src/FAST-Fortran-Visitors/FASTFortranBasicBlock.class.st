Class {
	#name : #FASTFortranBasicBlock,
	#superclass : #FASTFortranAbstractBasicBlock,
	#instVars : [
		'nextBlock'
	],
	#category : #'FAST-Fortran-Visitors-CFG'
}

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

	^nextBlock
		ifNil: [ #() ]
		ifNotNil: [ { nextBlock } ]
]

{ #category : #printing }
FASTFortranBasicBlock >> sourceCode [

	^FASTFortranExporterVisitor export: (FASTFortranStatementBlock new
		statements: self statements ;
		yourself)
]

{ #category : #accessing }
FASTFortranBasicBlock >> substituteBlock: oldBlock with: newBlockOrNil [

	nextBlock := newBlockOrNil
]
