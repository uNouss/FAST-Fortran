Class {
	#name : #FASTFortranCFGChecker,
	#superclass : #Object,
	#category : #'FAST-Fortran-Visitors-CFG'
}

{ #category : #'instance creation' }
FASTFortranCFGChecker class >> on: aCFG [

	^self new
		on: aCFG 
]

{ #category : #'instance creation' }
FASTFortranCFGChecker >> on: aCFGVisitor [

	| reachable |
	reachable := Set new: aCFGVisitor basicBlocks size.

	aCFGVisitor basicBlocks do: [ :block |
		block isStart ifTrue: [ reachable add: block ].
		reachable addAll: block nextBlocks ].

	^(aCFGVisitor basicBlocks difference: reachable)
		collect: [ :block | #dead -> block ]
]
