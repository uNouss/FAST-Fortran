"
A FASTFortranVisitor that computes ConftrolFlowGraph on the statements

It is based on the algorithm to compute basic blocks from [https://en.wikipedia.org/wiki/Basic_block](https://en.wikipedia.org/wiki/Basic_block)
"
Class {
	#name : #FASTFortranCFGVisitor,
	#superclass : #FASTFortranVisitor,
	#instVars : [
		'basicBlocks',
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
	labelReferences := Dictionary new
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> newBasicBlock: aBasicBlockClass [
	"creates a new BasicBlock and set it to currentBlock
	 typically called inside: `currentBlock nextBlock: (self newBasicBlock:)` to chain the new block
	 to the previous currentBlock"

	| newBlock |

	newBlock := aBasicBlockClass new.
	basicBlocks add: newBlock.
	currentBlock := newBlock.

	^newBlock
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

	aFASTFortranIfLogicalStatement statement accept: self.
	conditionalBlock nextBlock: currentBlock onValue: true.
	currentBlock nextBlock: afterBlock.

	conditionalBlock nextBlock: afterBlock onValue: false.

	currentBlock := afterBlock.

	^conditionalBlock
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranLabelledstatement: aFASTFortranTStatement [
	"Labelled statement start a new block (except if we are already at the start of a new one)
	 Plus need to check whether we met a goto referring to this label earlier"

	currentBlock isEmpty ifFalse: [
		currentBlock nextBlock: (self newBasicBlock: FASTFortranBasicBlock)
	].

	(labelReferences at: (aFASTFortranTStatement label) ifAbsent: [ #() ])
	do: [ :gotoBlock | gotoBlock nextBlock: currentBlock ]

]

{ #category : #'visiting - programUnits' }
FASTFortranCFGVisitor >> visitFASTFortranProgramUnit: aFASTFortranProgramUnit [

	| visit |
	visit := super visitFASTFortranProgramUnit: aFASTFortranProgramUnit.

	basicBlocks first isStart: true.
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

	aFASTFortranTStatement label ifNotNil: [ self visitFASTFortranLabelledstatement: aFASTFortranTStatement ].

	currentBlock addStatement: aFASTFortranTStatement.

	super visitFASTFortranTStatement: aFASTFortranTStatement

]
