"
A FASTFortranVisitor that computes ConftrolFlowGraph on the statements

It is based on the algorithm to compute basic blocks from [https://en.wikipedia.org/wiki/Basic_block](https://en.wikipedia.org/wiki/Basic_block)
"
Class {
	#name : #FASTFortranCFGVisitor,
	#superclass : #FASTFortranVisitor,
	#instVars : [
		'basicBlocks',
		'startNewBasicBlock',
		'currentBlock'
	],
	#category : #'FAST-Fortran-Visitors-CFG'
}

{ #category : #'accessing - private tests' }
FASTFortranCFGVisitor >> basicBlocks [

	^basicBlocks
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> checkForNewBasicBlock: aFASTFortranStatement [

	startNewBasicBlock ifFalse: [ ^ self ].

	currentBlock firstStatement: aFASTFortranStatement.

	startNewBasicBlock := false
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> conditionBlockWith: aFASTFortranExpression [

	| newBlock |
	newBlock := self newBasicBlock: FASTFortranConditionalBasicBlock.
	
	newBlock 	condition: aFASTFortranExpression.

	^newBlock
]

{ #category : #initialization }
FASTFortranCFGVisitor >> initialize [

	super initialize.

	basicBlocks := OrderedCollection new.
	startNewBasicBlock := false
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> newBasicBlock: aBasicBlockClass [
	"creates a new BasicBlocks and links it (#nextBlock:) the the currentBlocks
	 We do not change currentBlocks as the new one might replace the old ones are be added to them
	 This is for the caller to decide"

	| newBlock |

	newBlock := aBasicBlockClass new.
	"currentBlock nextBlock: newBlock
	]."
	self nextStatementStartsBlock.

	basicBlocks add: newBlock.
	currentBlock := newBlock.

	^newBlock
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> nextStatementStartsBlock [
	"sets instance variable #isLeader that must be tested in all statements"

	startNewBasicBlock := true
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [

	| visit |
	visit := super visitFASTFortranDoStatement: aFASTFortranDoStatement.
	self nextStatementStartsBlock.

	^visit
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranDoWhileStatement: aFASTFortranDoWhileStatement [

	| visit |
	visit := super visitFASTFortranDoWhileStatement: aFASTFortranDoWhileStatement.
	self nextStatementStartsBlock.

	^visit
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranExitStatement: aFASTFortranExitStatement [

	| visit |
	visit := super visitFASTFortranExitStatement: aFASTFortranExitStatement.
	self nextStatementStartsBlock.

	^visit
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranGoToAssignedStatement: aFASTFortranGoToAssignedStatement [

	| visit |
	visit := super visitFASTFortranGoToAssignedStatement: aFASTFortranGoToAssignedStatement.
	self nextStatementStartsBlock.

	^visit
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranGoToComputedStatement: aFASTFortranGoToComputedStatement [

	| visit |
	visit := super visitFASTFortranGoToComputedStatement: aFASTFortranGoToComputedStatement.
	self nextStatementStartsBlock.

	^visit
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranGoToStatement: aFASTFortranGoToStatement [

	| visit |
	visit := super visitFASTFortranGoToStatement: aFASTFortranGoToStatement.
	self nextStatementStartsBlock.

	^visit
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranGoToUnconditionalStatement: aFASTFortranGoToUnconditionalStatement [

	| visit |
	visit := super visitFASTFortranGoToUnconditionalStatement: aFASTFortranGoToUnconditionalStatement.
	self nextStatementStartsBlock.

	^visit
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatement [

	| visit |
	visit := super visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatement.
	self nextStatementStartsBlock.

	^visit
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [

	| conditionalBlock newBlock |	
	conditionalBlock := self conditionBlockWith: aFASTFortranIfBlockStatement condition.

	conditionalBlock
		nextBlock: (aFASTFortranIfBlockStatement thenStatementBlock accept: self)
		onValue: true.
	conditionalBlock
		nextBlock: (aFASTFortranIfBlockStatement elseStatementBlock accept: self)
		onValue: false.

	newBlock := self newBasicBlock: FASTFortranBasicBlock.

	^conditionalBlock
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [

	| visit |
	visit := super visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement.
	self nextStatementStartsBlock.

	^visit
]

{ #category : #'visiting - programUnits' }
FASTFortranCFGVisitor >> visitFASTFortranProgramUnit: aFASTFortranProgramUnit [

	^super visitFASTFortranProgramUnit: aFASTFortranProgramUnit
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatementBlock [

	| newBlock |
	newBlock := self newBasicBlock: FASTFortranBasicBlock.
	super visitFASTFortranTStatementBlock: aFASTFortranStatementBlock.
	^newBlock

]

{ #category : #'visiting - traits' }
FASTFortranCFGVisitor >> visitFASTFortranTStatement: aFASTFortranTStatement [
	"assumes there is only one basicBlock in #currentBlocks
	 sets the current statement as the lastStatement (for now) of this currentBlock"

	self checkForNewBasicBlock: aFASTFortranTStatement.
	currentBlock lastStatement: aFASTFortranTStatement.

	super visitFASTFortranTStatement: aFASTFortranTStatement

]
