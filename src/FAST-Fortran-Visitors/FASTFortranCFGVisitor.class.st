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
		'labelReferences',
		'parentLoopBlocks',
		'pendingNextBlock'
	],
	#category : #'FAST-Fortran-Visitors-CFG'
}

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> addPendingNextBlockAction: settingAction [
	"settingAction is a pharo block with one argument (a BasicBlock) and is used to set the successor of another block
	 when we will know it
	 For not, sets the nextBlock to nil and register the settingAction for future use"

	settingAction value: nil.
	pendingNextBlock add: settingAction
]

{ #category : #accessing }
FASTFortranCFGVisitor >> basicBlocks [

	^basicBlocks
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> chainPendingBlocksTo: newBlock [

	pendingNextBlock copy do: [ :settingAction |
		self runChainAction: settingAction with: newBlock ].

]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> chainRegisteredJumps: aLabel toBlock: labeledBlock [
	"When a new label is found, check if there are pas goto statements registered for it.
	 If so, chains the registered blocks to the new labeledBlock"

	(labelReferences at: aLabel ifAbsent: [ #(  ) ])
		do: [ :setterAction | setterAction value: labeledBlock ].

	labelReferences removeKey: aLabel ifAbsent: [ ].
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> checkLabelledConditionalStatement: aFASTFortranTStatement [
	"simlar to #checkLabelledStatement: but does not set the #nextStatement of currentStatement"

	aFASTFortranTStatement label ifNil: [ ^ self ].

	self
		chainRegisteredJumps: aFASTFortranTStatement label
		toBlock: currentBlock
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> checkLabelledStatement: aFASTFortranTStatement [
	"Labelled statement start a new block (except if we are already at the start of a new one)
	 Plus need to check whether we met a goto referring to this label earlier"

	| newBlock |
	aFASTFortranTStatement label ifNil: [ ^ self ].

	newBlock := self newBasicBlock: FASTFortranBasicBlock.
	self addPendingNextBlockAction: [ :nextBlock | newBlock nextBlock: nextBlock ].

	self
		chainRegisteredJumps: aFASTFortranTStatement label
		toBlock: newBlock
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> closeCurrentBlock [

	currentBlock := nil
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> findLabelledBlock: label setter: settingAction [
	"search for a block starting with this label. If none found, returns nil and
	 register currentBlock as wanting this label"

	^basicBlocks
		detect: [ :bloc |
			bloc firstStatement label = label ]
		ifOne: [ :labeledBlock |
			settingAction value: labeledBlock.
			labeledBlock
		]
		ifNone: [
			settingAction value: nil.
			self
				registerReference: settingAction
				toLabel: label
		]
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> findParentLoopBlock: aLabel [
	"if there is no label to the EXIT, take the first loop block in the stack
	 otherwise, search for the loop with the right label"

	aLabel ifNil: [ ^parentLoopBlocks top ].
	^nil
]

{ #category : #initialization }
FASTFortranCFGVisitor >> initialize [

	super initialize.

	basicBlocks := OrderedCollection new.
	labelReferences := Dictionary new.
	parentLoopBlocks := Stack new.
	pendingNextBlock := OrderedCollection new
]

{ #category : #private }
FASTFortranCFGVisitor >> ioStatementBranches: anIOStatement [

	"IO Statements are  BACKSPACE, CLOSE, DECODE, ENCODE, ENDFILE, OPEN, READ, REWIND, WRITE
	 They can be branching statements if they have END=<label> or ERR=<label> io parameters"

	^anIOStatement ioParameters select: [ :parameter |
		(parameter class = FASTFortranAssignmentExpression) and:
		[ #('end' 'err') anySatisfy: [ :specialVar | parameter variable name = specialVar ] ]
	]
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

	self chainPendingBlocksTo: newBlock.

	^ newBlock
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> newConditionalBlock: aFASTFortranStatement [

	^(self newBasicBlock: FASTFortranConditionalBasicBlock)
		statement: aFASTFortranStatement;
		yourself
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> registerReference: setterAction toLabel: label [
	"#setterAction is a Pharo block taking one BasicBlock as argument and seting a jump to this block when executed"

	(labelReferences at: label ifAbsentPut: [ OrderedCollection new ])
		add: setterAction
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> removePendingActionFor: aBlock [
	"pending action are pharo blocks with no clear link to the BasicBlock they modify
	 We use #copiedValueAt: to get this information from the pharo block
	 This is an ugly hack"

	pendingNextBlock copy do: [ :action |
		((action copiedValueAt: 1) = aBlock) 
		ifTrue: [pendingNextBlock remove: action]
	]
]

{ #category : #basicBlocks }
FASTFortranCFGVisitor >> runChainAction: settingAction with: aBasicBlock [

	settingAction value: aBasicBlock.
	pendingNextBlock remove: settingAction

]

{ #category : #'visiting - expressions' }
FASTFortranCFGVisitor >> visitFASTFortranBinaryExpression: aFASTFortranBinaryExpression [
	"pruning the visit, no need to go inside expressions"
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranCallStatement: aFASTFortranCallStatement [

	^self visitFASTFortranTStatement: aFASTFortranCallStatement.
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [
	"basic blocks for a LOOP
	 - ConditionalBlock that need to be chained as #nextBlock of current one
	 - BasicBlock for the body of the loop
	 - another BasicBlock for after the LOOP"

	| conditionalBlock |
	conditionalBlock := self newConditionalBlock: aFASTFortranDoStatement.
	self checkLabelledConditionalStatement: aFASTFortranDoStatement.
	parentLoopBlocks push: conditionalBlock.

	"loop body"
	self assert: pendingNextBlock isEmpty.
	self addPendingNextBlockAction: [ :bodyBlock |
		conditionalBlock nextBlock: bodyBlock onValue: true ].
	self closeCurrentBlock.
	aFASTFortranDoStatement statementBlock accept: self.
	self chainPendingBlocksTo: conditionalBlock.

	"after loop"
	self assert: pendingNextBlock isEmpty.
	self addPendingNextBlockAction: [ :afterBlock |
		conditionalBlock nextBlock: afterBlock onValue: false ].

	parentLoopBlocks pop.
	self closeCurrentBlock
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranExitStatement: aFASTFortranExitStatement [
	"looks a bit like a GOTO, but don'e need tospecify the label (goes to enclosing loop)"

	self visitFASTFortranTStatement: aFASTFortranExitStatement.
	
	self chainPendingBlocksTo: (self findParentLoopBlock: nil "aFASTFortranExitStatement label").

	self closeCurrentBlock
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranGoToComputedStatement: aFASTFortranGoToComputedStatement [
	"GoTo with several possible target labels
	 - new ConditionalBlock (#nextBlock of current one)
	 - need to chain labelled blocks to each target label"

	| conditionalBlock gotoBlock |
	conditionalBlock := self newConditionalBlock: aFASTFortranGoToComputedStatement.
	self checkLabelledConditionalStatement: aFASTFortranGoToComputedStatement.

	gotoBlock := currentBlock.
	aFASTFortranGoToComputedStatement labelReferences do: [ :labelReference |
		self
			findLabelledBlock: labelReference label
			setter: [ :labeledBlock | gotoBlock nextBlock: labeledBlock onValue: labelReference label ].
	].

	self closeCurrentBlock
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranGoToStatement: aFASTFortranGoToStatement [
	"todo:
	 - end currentBlock (contains this statement)
	 - nextBlock of currentBlock is a block starting on the right label
	Note: need to introduce a local variable because the setter block can be evaluated later
	and we want it to reference the current value of #currentBlock, not the value it will have
	at this later time"

	| gotoBlock |
	self visitFASTFortranTStatement: aFASTFortranGoToStatement.

	gotoBlock := currentBlock.
	self
		findLabelledBlock: aFASTFortranGoToStatement labelReferences anyOne label
		setter: [ :labeledBlock | gotoBlock nextBlock: labeledBlock ].

	self removePendingActionFor: currentBlock.
	self closeCurrentBlock.
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranIOStatement: aFASTFortranIOStatement [
	"IOStatements (see #ioStatementBranches:) can be regular statements or branching statements
	 depending on their IO-parameters.
	 If they are branching statements they are similar to ComputedGotos (several targets):
	 - proceed : proceed to next statement after read (no end, no err)
	 - end : goto specified label upon end-of-file
	 - err : goto specified label upon error"

	| branches ioBlock |
	branches := (self ioStatementBranches: aFASTFortranIOStatement).
	branches ifEmpty: [
		^self visitFASTFortranTStatement: aFASTFortranIOStatement
	].

	ioBlock := self newConditionalBlock: aFASTFortranIOStatement.
	self checkLabelledConditionalStatement: aFASTFortranIOStatement.

	branches do: [ :assignExpr |
		self
			findLabelledBlock: assignExpr expression primitiveValue
			setter: [ :labeledBlock | ioBlock nextBlock: labeledBlock onValue: assignExpr variable name ].
	].
	self addPendingNextBlockAction: [ :nextBlock |
		ioBlock nextBlock: nextBlock onValue: 'proceed' ].

	self closeCurrentBlock
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranIfArithmeticStatement: aFASTFortranIfArithmeticStatement [
	"Note: next statement after an ArithmeticIf should be labelled or there is no way it gets executed"

	| conditionalBlock |
	conditionalBlock := self newConditionalBlock: aFASTFortranIfArithmeticStatement.
	self checkLabelledConditionalStatement:
		aFASTFortranIfArithmeticStatement.

	self
		findLabelledBlock: aFASTFortranIfArithmeticStatement lessLabel label
		setter: [ :labeledBlock |
			conditionalBlock nextBlock: labeledBlock onValue: #negative ].
	self
		findLabelledBlock: aFASTFortranIfArithmeticStatement equalLabel label
		setter: [ :labeledBlock |
			conditionalBlock nextBlock: labeledBlock onValue: #null ].
	self
		findLabelledBlock: aFASTFortranIfArithmeticStatement greaterLabel label
		setter: [ :labeledBlock |
			conditionalBlock nextBlock: labeledBlock onValue: #positive ].
	self closeCurrentBlock
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [
	"basic blocks for a IF
	 - new ConditionalBlock (#nextBlock of current one)
	 - BasicBlock for the then-part
	 - BasicBlock for the else-part
	 - bth then and else part will be chained to whatever follows"

	| conditionalBlock thenLastBlock |
	conditionalBlock := self newConditionalBlock: aFASTFortranIfBlockStatement.
	self checkLabelledConditionalStatement: aFASTFortranIfBlockStatement.

	"then-part"
	self assert: pendingNextBlock isEmpty.
	self addPendingNextBlockAction: [ :thenBlock |
		conditionalBlock nextBlock: thenBlock onValue: true ].
	self closeCurrentBlock.
	aFASTFortranIfBlockStatement thenStatementBlock accept: self.

	"else part
	 need to empty the pendingNextBlocks from then-part while processing else-part"
	thenLastBlock := pendingNextBlock copy.
	pendingNextBlock removeAll.
	self addPendingNextBlockAction: [ :elseBlock |
		conditionalBlock nextBlock: elseBlock onValue: false ].
	self closeCurrentBlock.
	aFASTFortranIfBlockStatement elseStatementBlock ifNotNil: [ :elsePart |
		elsePart accept: self ].

	"put back the pendingNextBlocks from then-part"
	pendingNextBlock addAll: thenLastBlock.
	self closeCurrentBlock
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranIfLogicalStatement: aFASTFortranIfLogicalStatement [

	| conditionalBlock |
	conditionalBlock := self newConditionalBlock:
		                    aFASTFortranIfLogicalStatement.
	self checkLabelledConditionalStatement:
		aFASTFortranIfLogicalStatement.

	"then-statement"
	self assert: pendingNextBlock isEmpty.
	self addPendingNextBlockAction: [ :thenBlock |
		conditionalBlock nextBlock: thenBlock onValue: true ].
	self closeCurrentBlock.
	aFASTFortranIfLogicalStatement statement accept: self.

	"else part"
	self addPendingNextBlockAction: [ :elseBlock |
		conditionalBlock nextBlock: elseBlock onValue: false ].
	self closeCurrentBlock
]

{ #category : #'visiting - programUnits' }
FASTFortranCFGVisitor >> visitFASTFortranProgramUnit: aFASTFortranProgramUnit [

	| visit |
	visit := super visitFASTFortranProgramUnit: aFASTFortranProgramUnit.

	basicBlocks first isStart: true.
	
	^visit
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranReadStatement: aFASTFortranReadStatement [

	self visitFASTFortranIOStatement: aFASTFortranReadStatement
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranReturnStatement: aFASTFortranReturnStatement [
	"Ends the current basicBlock and has no nextBlock"

	self visitFASTFortranTStatement: aFASTFortranReturnStatement.

	currentBlock nextBlock: FASTFortranNullBlock new.
	self closeCurrentBlock.
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranStatementBlock: aFASTFortranStatement [
	"note: `super visitFASTFortranTStatementBlock:` instead of `super visitFASTFortranStatementBlock:`
	to avoid calling #visitTStatement:"

	super visitFASTFortranTStatementBlock: aFASTFortranStatement.

]

{ #category : #'visiting - traits' }
FASTFortranCFGVisitor >> visitFASTFortranTStatement: aFASTFortranTStatement [
	| newBlock |

	self checkLabelledStatement: aFASTFortranTStatement.

	currentBlock ifNil: [
		newBlock := self newBasicBlock: FASTFortranBasicBlock.
		self addPendingNextBlockAction: [ :nextBlock | newBlock nextBlock: nextBlock ]
	].
	currentBlock addStatement: aFASTFortranTStatement.

	"super visitFASTFortranTStatement: aFASTFortranTStatement."
]

{ #category : #'visiting - expressions' }
FASTFortranCFGVisitor >> visitFASTFortranUnaryExpression: aFASTFortranUnaryExpression [
	"pruning the visit, no need to go inside expressions"
]

{ #category : #'visiting - statements' }
FASTFortranCFGVisitor >> visitFASTFortranWriteStatement: aFASTFortranWriteStatement [

	self visitFASTFortranIOStatement: aFASTFortranWriteStatement
]
