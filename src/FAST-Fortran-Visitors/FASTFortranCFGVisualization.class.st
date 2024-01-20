Class {
	#name : #FASTFortranCFGVisualization,
	#superclass : #Object,
	#instVars : [
		'canvas'
	],
	#category : #'FAST-Fortran-Visitors-CFG'
}

{ #category : #'instance creation' }
FASTFortranCFGVisualization class >> on: aFASTFortranCFGVisitor [

	^self new
		openOn: aFASTFortranCFGVisitor
]

{ #category : #'instance creation' }
FASTFortranCFGVisualization >> buildLines: shapes [

	RSLineBuilder arrowedLine
		withBorderAttachPoint;
		shapes: shapes;
		canvas: canvas;
		connectToAll: [ :bb | bb nextBlocks ].
	canvas edges do: #withBorder
]

{ #category : #'instance creation' }
FASTFortranCFGVisualization >> openOn: aFASTFortranCFGVisitor [

	| shapes |
	canvas := RSCanvas new.
	shapes := aFASTFortranCFGVisitor basicBlocks collect: [ :bb |
		          self shapeFor: bb ].

	self buildLines: shapes.

	canvas addAll: shapes.
	RSTreeLayout on: shapes.

	^ canvas
]

{ #category : #hooks }
FASTFortranCFGVisualization >> shapeColorFor: aBasicBlock [

	aBasicBlock isStart
	ifTrue: [ 
		^aBasicBlock isFinal
			ifTrue: [ Color orange ]
			ifFalse: [ Color green ]
	].

	aBasicBlock isFinal
	ifTrue: [ ^Color red ].

	^Color lightGray
]

{ #category : #hooks }
FASTFortranCFGVisualization >> shapeFor: aBasicBlock [

	^RSBox new
		model: aBasicBlock ;
		color: (self shapeColorFor: aBasicBlock) ;
		size: 20 ;
		@ (RSPopup text: [ :block | block sourceCode ]) ;
		yourself
]
