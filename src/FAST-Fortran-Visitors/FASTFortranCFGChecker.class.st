"
Checks some well-formedness rules on a CFG

- #oneStart: there is only one startBlock in the CFG
- #dead rule: All BasicBlocks in the CFG have an ancestor except the startBlock
"
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

	^self unreachableBlocks: (aCFGVisitor basicBlocks).
]

{ #category : #'instance creation' }
FASTFortranCFGChecker >> reachableBlocks: blockCollection [
	| reachable nbPastReachables newReachables |

	nbPastReachables := 0.
	reachable := blockCollection selectAsSet: #isStart.

	newReachables := reachable.
	[nbPastReachables < reachable size]
	whileTrue: [
		nbPastReachables := reachable size.
		newReachables := (newReachables flatCollectAsSet: #nextBlocks) reject: #isNil.
		reachable addAll: newReachables
	].
	^ reachable
]

{ #category : #'instance creation' }
FASTFortranCFGChecker >> unreachableBlocks: blockCollection [

	^ blockCollection difference: (self reachableBlocks: blockCollection)
]
