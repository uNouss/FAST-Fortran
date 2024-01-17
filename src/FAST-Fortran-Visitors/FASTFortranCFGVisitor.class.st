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

	| previousBlock conditionalBlock afterBlock |
	previousBlock := currentBlock.
	conditionalBlock := self conditionBlockWith: aFASTFortranIfBlockStatement condition.

	previousBlock nextBlock: conditionalBlock.

	afterBlock := self newBasicBlock: FASTFortranBasicBlock.

	aFASTFortranIfBlockStatement thenStatementBlock accept: self.
	conditionalBlock nextBlock: currentBlock onValue: true.
	currentBlock nextBlock: afterBlock.

	aFASTFortranIfBlockStatement elseStatementBlock accept: self.
	conditionalBlock nextBlock: currentBlock onValue: false.
	currentBlock nextBlock: afterBlock.
	
	currentBlock := afterBlock.
	self nextStatementStartsBlock.

	^conditionalBlock
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [

	| previousBlock conditionalBlock afterBlock |
	previousBlock := currentBlock.
	conditionalBlock := self conditionBlockWith: aFASTFortranIfLogicalStatement condition.

	previousBlock nextBlock: conditionalBlock.

	afterBlock := self newBasicBlock: FASTFortranBasicBlock.

	"for the THEN-PART"
	currentBlock := self newBasicBlock: FASTFortranBasicBlock.
	self nextStatementStartsBlock.
	aFASTFortranIfLogicalStatement statement accept: self.
	conditionalBlock nextBlock: currentBlock onValue: true.
	currentBlock nextBlock: afterBlock.

	conditionalBlock nextBlock: afterBlock onValue: false.

	currentBlock := afterBlock.
	self nextStatementStartsBlock.

	^conditionalBlock
]

{ #category : #'visiting - programUnits' }
FASTFortranCFGVisitor >> visitFASTFortranProgramUnit: aFASTFortranProgramUnit [

	^super visitFASTFortranProgramUnit: aFASTFortranProgramUnit
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatement [

	| newBlock |
	newBlock := self newBasicBlock: FASTFortranBasicBlock.

	super visitFASTFortranTStatementBlock: aFASTFortranStatement.

	^newBlock

]

{ #category : #'visiting - traits' }
FASTFortranCFGVisitor >> visitFASTFortranTStatement: aFASTFortranTStatement [
	"sets the current statement as the lastStatement (for now) of the currentBlock"

	self checkForNewBasicBlock: aFASTFortranTStatement.
	currentBlock lastStatement: aFASTFortranTStatement.

	super visitFASTFortranTStatement: aFASTFortranTStatement

]
