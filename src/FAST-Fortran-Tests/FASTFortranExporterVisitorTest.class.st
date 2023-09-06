"
A FASTFortranExporterVisitorTest is a test class for testing the behavior of FASTFortranExporterVisitor
"
Class {
	#name : #FASTFortranExporterVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'visitor'
	],
	#category : #'FAST-Fortran-Tests-Visitor'
}

{ #category : #running }
FASTFortranExporterVisitorTest >> assertExport: anEntity equals: expectedString [
	| generated |
	anEntity accept: visitor.
	generated := visitor stream contents.
	self assert: generated equals: expectedString
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> characterType: dimension [
	^FASTFortranCharacterType new
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> declarationStatement: type variables: aCollection [
	^FASTFortranDeclarationStatement new
		type: type ;
		declarators: (self scalarVariables: aCollection)  ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> entity: owner parameters: aCollection [
	^owner
		parameters: (self scalarVariables: aCollection) ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> entity: owner statementBlock: aCollection [
	^owner
		statementBlock: (FASTFortranStatementBlock new
			statements: aCollection ;
			yourself)
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> externalStatement: aName [
	^FASTFortranExternalStatement new
		name: aName ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> implicitStatement [
	^FASTFortranImplicitStatement new
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> integerType: dimension [
	^FASTFortranIntegerType new
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> logicalType: dimension [
	^FASTFortranLogicalType new
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> realType: dimension [
	^FASTFortranRealType new
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> scalarVariable: aName [
	^FASTFortranScalarVariable new
		name: aName ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> scalarVariables: aCollectionOfString [
	^aCollectionOfString collect: [ :aString | self scalarVariable: aString ]
]

{ #category : #running }
FASTFortranExporterVisitorTest >> setUp [
	super setUp.

	visitor := FASTFortranExporterVisitor new
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> statementBlock: aCollection [
	^FASTFortranStatementBlock new
		statements: aCollection ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> subroutine: aName [
	^FASTFortranSubroutine new
		name: aName ;
		statementBlock: (self statementBlock: #()) ;
		yourself
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testEmptySubroutineNoParameters [
	| sub |
	sub := self subroutine: 'blah'.

	self
		assertExport: sub
		equals: 
'      subroutine blah()
      end
'
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testEmptySubroutineTwoParameters [
	| sub |
	sub := self subroutine: 'blah'.
	self
		entity: sub
		parameters: #(i j).

	self
		assertExport: sub
		equals: 
'      subroutine blah(i, j)
      end
'
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testExternalStatement [
	| sub |
	sub := self subroutine: 'blah'.
	self
		entity: sub
		statementBlock: { self externalStatement: 'aVar' }.

	self
		assertExport: sub
		equals: 
'      subroutine blah()
      external aVar
      end
'
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testImplicitStatement [
	| sub |
	sub := self subroutine: 'blah'.
	self
		entity: sub
		statementBlock: { self implicitStatement }.

	self
		assertExport: sub
		equals: 
'      subroutine blah()
      implicit none
      end
'
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testOneDeclarationCharcaterType [
	| sub |
	sub := self subroutine: 'blah'.
	self
		entity: sub
		statementBlock: {
			self
				declarationStatement: (self characterType: nil)
				variables: #(r) }.

	self
		assertExport: sub
		equals: 
'      subroutine blah()
      character r
      end
'
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testOneDeclarationLogicalType [
	| sub |
	sub := self subroutine: 'blah'.
	self
		entity: sub
		statementBlock: {
			self
				declarationStatement: (self logicalType: nil)
				variables: #(r) }.

	self
		assertExport: sub
		equals: 
'      subroutine blah()
      logical r
      end
'
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testOneDeclarationRealType [
	| sub |
	sub := self subroutine: 'blah'.
	self
		entity: sub
		statementBlock: {
			self
				declarationStatement: (self realType: nil)
				variables: #(r) }.

	self
		assertExport: sub
		equals: 
'      subroutine blah()
      real r
      end
'
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testOneDeclarationTwoVariables [
	| sub |
	sub := self subroutine: 'blah'.
	self
		entity: sub
		statementBlock: {
			self
				declarationStatement: (self integerType: nil)
				variables: #(i j) }.

	self
		assertExport: sub
		equals: 
'      subroutine blah()
      integer i, j
      end
'
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testTwoDeclarationsTwoVariables [
	| sub |
	sub := self subroutine: 'blah'.
	self
		entity: sub
		statementBlock: {
			self
				declarationStatement: (self integerType: nil)
				variables: #(i) .
			self
				declarationStatement: (self integerType: nil)
				variables: #(j) }.

	self
		assertExport: sub
		equals: 
'      subroutine blah()
      integer i
      integer j
      end
'
]
