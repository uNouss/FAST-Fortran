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
FASTFortranExporterVisitorTest >> declarationStatement: type variables: aCollection [
	^FASTFortranDeclarationStatement new
		type: type ;
		declarators: aCollection ;
		yourself
]

{ #category : #'entity creation' }
FASTFortranExporterVisitorTest >> integerType [
	^FASTFortranIntegerType new
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
	sub parameters: (self scalarVariables: #(i j) ).

	self
		assertExport: sub
		equals: 
'      subroutine blah(i, j)
      end
'
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testEmptySubroutineTwoParametersWithOneDeclaration [
	| sub |
	sub := self subroutine: 'blah'.
	sub parameters: (self scalarVariables: #(i j)).
	sub statementBlock:
		(self statementBlock: {
			self
				declarationStatement: self integerType
				variables: (self scalarVariables: #(i j)) }).

	self
		assertExport: sub
		equals: 
'      subroutine blah(i, j)
      integer i, j
      end
'
]

{ #category : #tests }
FASTFortranExporterVisitorTest >> testEmptySubroutineTwoParametersWithTwoDeclarations [
	| sub |
	sub := self subroutine: 'blah'.
	sub parameters: (self scalarVariables: #(i j)).
	sub statementBlock:
		(self statementBlock: {
			self
				declarationStatement: self integerType
				variables: (self scalarVariables: #(i)) .
			self
				declarationStatement: self integerType
				variables: (self scalarVariables: #(j)) }).

	self
		assertExport: sub
		equals: 
'      subroutine blah(i, j)
      integer i
      integer j
      end
'
]
