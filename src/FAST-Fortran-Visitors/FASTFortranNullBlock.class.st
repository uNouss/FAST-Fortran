"
A ""virtual"" block representing a forced end of the control flow.

NullBlock are not added in the list of blocks of the CFG, they appear only as #nextBlock of a final block
"
Class {
	#name : #FASTFortranNullBlock,
	#superclass : #FASTFortranAbstractBasicBlock,
	#category : #'FAST-Fortran-Visitors-CFG'
}

{ #category : #accessing }
FASTFortranNullBlock >> isEmpty [

	^false
]

{ #category : #accessing }
FASTFortranNullBlock >> isFinal [

	^false
]

{ #category : #accessing }
FASTFortranNullBlock >> isNullBlock [

	^true
]

{ #category : #accessing }
FASTFortranNullBlock >> isStart [ 

	^false
]

{ #category : #accessing }
FASTFortranNullBlock >> nextBlocks [

	^#()
]

{ #category : #printing }
FASTFortranNullBlock >> sourceCode [

	^''
]
