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
	"basic blocks for a LOOP
	 - ConditionalBlock that need to be chained as #nextBlock of current one
	 - BasicBlock for the body of the loop
	 - another BasicBlock for after the LOOP"

	| previousBlock conditionalBlock afterBlock |
	previousBlock := currentBlock.
	conditionalBlock := self conditionBlockWith: aFASTFortranDoStatement loopControl.
	previousBlock nextBlock: conditionalBlock.

	afterBlock := self newBasicBlock: FASTFortranBasicBlock.

	"loop body"
	aFASTFortranDoStatement statementBlock accept: self.
	conditionalBlock nextBlock: currentBlock onValue: true.
	currentBlock nextBlock: conditionalBlock.

	conditionalBlock nextBlock: afterBlock onValue: false.

	currentBlock := afterBlock.
	self nextStatementStartsBlock.

	^conditionalBlock
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
	"basic blocks for a IF
	 - ConditionalBlock that need to be chained as #nextBlock of current one
	 - BasicBlock for the then-part
	 - BasicBlock for the else-part
	 - another BasicBlock for after the IF"

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
