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
		connectToAll: [ :block | block nextBlocks ]
]

{ #category : #hooks }
FASTFortranCFGVisualization >> makeShape: aBasicBlock [

	^aBasicBlock isStart
		ifTrue: [ RSEllipse new
			radius: 10 ;
			color: Color black ;
		 	yourself
		]
		ifFalse: [ 
			aBasicBlock isFinal
				ifTrue: [ RSEllipse new
					radius: 10 ;
					color: Color transparent ;
					border: (RSBorder new width: 4 ; color: Color black ; yourself) ;
					yourself
				]
				ifFalse: [ 	RSBox new
					size: 20 ;
					yourself
				]
		]
]

{ #category : #'instance creation' }
FASTFortranCFGVisualization >> openOn: aFASTFortranCFGVisitor [

	| shapes |
	canvas := RSCanvas new.
	shapes := aFASTFortranCFGVisitor basicBlocks collect: [ :bb | self shapeFor: bb ].

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

	^(self makeShape: aBasicBlock)
		model: aBasicBlock ;
		@ (RSPopup text: [ :block | block sourceCode ]) ;
		yourself
]
