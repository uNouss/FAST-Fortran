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

{ #category : #accessing }
FASTFortranCFGVisitor >> basicBlocks [

	^basicBlocks
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> chainRegisteredJumpsTo: aLabel [

	(labelReferences at: aLabel ifAbsent: [ #(  ) ])
		do: [ :gotoBlock | gotoBlock nextBlock: currentBlock ]
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> checkLabelledConditionalStatement: aFASTFortranTStatement [
	"simlar to #checkLabelledStatement: but does not set the #nextStatement of currentStatement"

	aFASTFortranTStatement label ifNil: [ ^ self ].

	self chainRegisteredJumpsTo: aFASTFortranTStatement label
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> checkLabelledStatement: aFASTFortranTStatement [
	"Labelled statement start a new block (except if we are already at the start of a new one)
	 Plus need to check whether we met a goto referring to this label earlier"

	aFASTFortranTStatement label ifNil: [ ^ self ].

	currentBlock isEmpty ifFalse: [
		currentBlock nextBlock: (self newBasicBlock: FASTFortranBasicBlock) ].

	self chainRegisteredJumpsTo: aFASTFortranTStatement label
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> cleanEmptyBlock [

	currentBlock := nil.
	basicBlocks copy do: [ :block |
		block isEmpty ifTrue: [ self substituteBlock: block with: nil ] ]
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> conditional: conditionalBlock branchValue: aValue forNode: aFASTFortranNode nextBlock: nextBlock [

	aFASTFortranNode
	ifNil: [ conditionalBlock nextBlock: nextBlock onValue: aValue ]
	ifNotNil: [
		aFASTFortranNode accept: self.
		conditionalBlock nextBlock: currentBlock onValue: aValue.
		currentBlock nextBlock: nextBlock
	]
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> findLabelledBlock: aFASTFortranLabelReference [
	"search for a block starting with this label. If none found, returns nil and
	 register currentBlock as wanting this label"

	^basicBlocks
		detect: [ :bloc | bloc firstStatement label = aFASTFortranLabelReference label ]
		ifNone: [
			self registerReference: currentBlock toLabel: aFASTFortranLabelReference label.
			nil
		]
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
FASTFortranCFGVisitor >> newConditionalBlock: aFASTFortranStatement [

	| conditional previousBlock |
	previousBlock := currentBlock.

	conditional := (self newBasicBlock: FASTFortranConditionalBasicBlock)
		               statement: aFASTFortranStatement;
		               yourself.

	previousBlock isEmpty ifTrue: [
		self substituteBlock: previousBlock with: nil ].

	^ conditional
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> registerReference: aBasicBlock toLabel: label [

	(labelReferences at: label ifAbsentPut: [ OrderedCollection new ])
		add: aBasicBlock
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> substituteBlock: oldBlock with: newBlockOrNil [

	newBlockOrNil
	ifNotNil: [ newBlockOrNil isStart: oldBlock isStart].

	basicBlocks do: [ :block |
		(block nextBlocks includes: oldBlock)
		ifTrue: [ block substituteBlock: oldBlock with: newBlockOrNil ]
	].

	basicBlocks remove: oldBlock
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
		(conditionalBlock := self newConditionalBlock: aFASTFortranDoStatement).

	afterBlock := self newBasicBlock: FASTFortranBasicBlock.

	"loop body"
	self
		conditional: conditionalBlock
		branchValue: true
		forNode: aFASTFortranDoStatement statementBlock
		nextBlock: conditionalBlock.
	self
		conditional: conditionalBlock
		branchValue: false
		forNode: nil
		nextBlock: afterBlock.

	currentBlock := afterBlock.

	^ conditionalBlock
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

	self visitFASTFortranTStatement: aFASTFortranGoToStatement.

	currentBlock nextBlock:
		(self findLabelledBlock: aFASTFortranGoToStatement labelReferences anyOne).


	^ self newBasicBlock: FASTFortranBasicBlock
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatement [

	| conditionalBlock |
	
	currentBlock nextBlock:
		(conditionalBlock := self newConditionalBlock: aFASTFortranIfArithmeticStatement).
	self checkLabelledConditionalStatement: aFASTFortranIfArithmeticStatement.

	self
		conditional: conditionalBlock
		branchValue: #negative
		forNode: nil
		nextBlock: (self findLabelledBlock: aFASTFortranIfArithmeticStatement lessLabel).
	self
		conditional: conditionalBlock
		branchValue: #null
		forNode: nil
		nextBlock: (self findLabelledBlock: aFASTFortranIfArithmeticStatement equalLabel).

	self
		conditional: conditionalBlock
		branchValue: #positive
		forNode: nil
		nextBlock: (self findLabelledBlock: aFASTFortranIfArithmeticStatement greaterLabel).

	self newBasicBlock: FASTFortranBasicBlock.	

	^conditionalBlock
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
		(conditionalBlock := self newConditionalBlock: aFASTFortranIfBlockStatement).
	self checkLabelledConditionalStatement: aFASTFortranIfBlockStatement.

	afterBlock := self newBasicBlock: FASTFortranBasicBlock.
	self
		conditional: conditionalBlock
		branchValue: true
		forNode: aFASTFortranIfBlockStatement thenStatementBlock
		nextBlock: afterBlock.
	self
		conditional: conditionalBlock
		branchValue: false
		forNode: aFASTFortranIfBlockStatement elseStatementBlock
		nextBlock: afterBlock.

	currentBlock := afterBlock.
	^ conditionalBlock
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [

	| conditionalBlock afterBlock |

	currentBlock nextBlock:
		(conditionalBlock := self newConditionalBlock: aFASTFortranIfLogicalStatement).
	self checkLabelledConditionalStatement: aFASTFortranIfLogicalStatement.

	afterBlock := self newBasicBlock: FASTFortranBasicBlock.

	"create ablock for the THEN statement"
	currentBlock := self newBasicBlock: FASTFortranBasicBlock.
	self
		conditional: conditionalBlock
		branchValue: true
		forNode: aFASTFortranIfLogicalStatement statement
		nextBlock: afterBlock.
	self
		conditional: conditionalBlock
		branchValue: false
		forNode: nil
		nextBlock: afterBlock.

	currentBlock := afterBlock.

	^conditionalBlock
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
	"note: `super visitFASTFortranTStatementBlock:` instead of `super visitFASTFortranStatementBlock:`
	to avoid calling #visitTStatement:"
	| newBlock |
	newBlock := self newBasicBlock: FASTFortranBasicBlock.

	super visitFASTFortranTStatementBlock: aFASTFortranStatement.

	^newBlock

]

{ #category : #'visiting - traits' }
FASTFortranCFGVisitor >> visitFASTFortranTStatement: aFASTFortranTStatement [

	self checkLabelledStatement: aFASTFortranTStatement.

	currentBlock addStatement: aFASTFortranTStatement.

	super visitFASTFortranTStatement: aFASTFortranTStatement

]
