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
		'currentBlock',
		'labelReferences'
	],
	#category : #'FAST-Fortran-Visitors-CFG'
}

{ #category : #'accessing - private tests' }
FASTFortranCFGVisitor >> basicBlocks [

	^basicBlocks
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> checkForNewBasicBlock: aFASTFortranStatement [
	"if aFASTFortranStatement is labelled we start a new BasicBlock except if we are already at the satrt of a new block
	 if #startNewBasicBlock is true, we are at the start of a new BasicBlock (and aFASTFortranStatement is its #firstStatement)"
	
	aFASTFortranStatement label ifNotNil: [
		startNewBasicBlock ifFalse: [
			"could set startNewBasicBlock to false, but #newBasicBlock: will set it back to true"
			currentBlock nextBlock: (self newBasicBlock: FASTFortranBasicBlock)
	] ].
	
	startNewBasicBlock ifFalse: [ ^ self ].

	currentBlock firstStatement: aFASTFortranStatement.

	startNewBasicBlock := false
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> cleanEmptyBlock [

	basicBlocks removeAllSuchThat: [ :block |
		(block class = FASTFortranBasicBlock)  and:
		[block firstStatement isNil]
	]
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> conditionBlockWith: aFASTFortranExpression [

	| newBlock |
	newBlock := self newBasicBlock: FASTFortranConditionalBasicBlock.
	
	newBlock 	condition: aFASTFortranExpression.

	^newBlock
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> findLabelledBlock: label [

	^basicBlocks
		detect: [ :bloc |
			(bloc class = FASTFortranBasicBlock) and:
			[ bloc firstStatement label = label ]
		]
		ifNone: [ nil ]
]

{ #category : #initialization }
FASTFortranCFGVisitor >> initialize [

	super initialize.

	basicBlocks := OrderedCollection new.
	startNewBasicBlock := false.
	labelReferences := Dictionary new
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> newBasicBlock: aBasicBlockClass [
	"creates a new BasicBlocks and links it (#nextBlock:) the the currentBlocks
	 We do not change currentBlocks as the new one might replace the old ones are be added to them
	 This is for the caller to decide"

	| newBlock |

	newBlock := aBasicBlockClass new.
	basicBlocks add: newBlock.
	currentBlock := newBlock.

	self nextStatementStartsBlock.

	^newBlock
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> nextStatementStartsBlock [
	"sets instance variable #isLeader that must be tested in all statements"

	startNewBasicBlock := true
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> registerReference: aBasicBlock toLabel: label [

	(labelReferences at: label ifAbsentPut: [ OrderedCollection new ])
		add: aBasicBlock
]

{ #category : #'visiting - expressions' }
FASTFortranCFGVisitor >> visitFASTFortranBinaryExpression: aFASTFortranBinaryExpression [
	"pruning the visit, no need to go inside expressions"
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [
	"basic blocks for a LOOP
	 - ConditionalBlock that need to be chained as #nextBlock of current one
	 - BasicBlock for the body of the loop
	 - another BasicBlock for after the LOOP"

	| conditionalBlock afterBlock |
	currentBlock nextBlock:
		(conditionalBlock := self conditionBlockWith: aFASTFortranDoStatement loopControl).

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
FASTFortranCFGVisitor >> visitFASTFortranExitStatement: aFASTFortranExitStatement [
	"breaks out of a loop:
	 - ends currentBlock (contains this statement)
	 - nextBlock of currentBlock is nextBlock of 'parent'
	"

	self flag: #TODO.
	super visitFASTFortranExitStatement: aFASTFortranExitStatement
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranGoToStatement: aFASTFortranGoToStatement [
	"todo:
	 - end currentBlock (contains this statement)
	 - nextBlock of currentBlock is a block starting on the right label
	"

	| label |
	super visitFASTFortranGoToStatement: aFASTFortranGoToStatement.

	label := aFASTFortranGoToStatement labelReferences anyOne label.
	(self findLabelledBlock: label)
		ifNil: [ self registerReference: currentBlock toLabel: label ]
		ifNotNil: [ :labelledBlock | currentBlock nextBlock: labelledBlock ].

	^ self newBasicBlock: FASTFortranBasicBlock
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

	| conditionalBlock afterBlock |
	currentBlock nextBlock:
		(conditionalBlock := self conditionBlockWith: aFASTFortranIfBlockStatement condition).

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

	| conditionalBlock afterBlock |
	
	currentBlock nextBlock:
		(conditionalBlock := self conditionBlockWith: aFASTFortranIfLogicalStatement condition).

	afterBlock := self newBasicBlock: FASTFortranBasicBlock.

	"for the THEN Statement"
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

	| visit |
	visit := super visitFASTFortranProgramUnit: aFASTFortranProgramUnit.

	self cleanEmptyBlock.
	
	^visit
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
	"if statement is labelled, start a new block (see #checkForNewBasicBlock:)
	 In all cases, sets the current statement as the lastStatement (for now) of the currentBlock"

	self checkForNewBasicBlock: aFASTFortranTStatement.
	currentBlock lastStatement: aFASTFortranTStatement.

	super visitFASTFortranTStatement: aFASTFortranTStatement

]
