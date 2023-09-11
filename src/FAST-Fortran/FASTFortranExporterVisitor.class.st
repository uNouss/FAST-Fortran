Class {
	#name : #FASTFortranExporterVisitor,
	#superclass : #FASTFortranVisitor,
	#instVars : [
		'stream',
		'indent'
	],
	#category : #'FAST-Fortran-Visitor'
}

{ #category : #streaming }
FASTFortranExporterVisitor >> << aString [
	self stream << aString
]

{ #category : #streaming }
FASTFortranExporterVisitor >> indent [
	indent := indent + 1
]

{ #category : #initialization }
FASTFortranExporterVisitor >> initialize [
	super initialize.

	indent := 0
]

{ #category : #streaming }
FASTFortranExporterVisitor >> newLine [
	self stream cr
]

{ #category : #accessing }
FASTFortranExporterVisitor >> resetStream [
	stream := nil
]

{ #category : #visiting }
FASTFortranExporterVisitor >> rootEntitiesIn: aFASTFortranModel [
	^aFASTFortranModel entities select: [ :entity |
		entity parents isEmpty
	]
]

{ #category : #streaming }
FASTFortranExporterVisitor >> sixSpaces [
	"mandatory six spaces at the begining of line + optional indent (2 spaces per level)"

	| nbSpaces |
	nbSpaces := 6 + (indent * 2).
	self << (String space repeat: nbSpaces)
	
]

{ #category : #accessing }
FASTFortranExporterVisitor >> stream [
	^stream ifNil: [ stream := WriteStream on: '' ]
]

{ #category : #streaming }
FASTFortranExporterVisitor >> unindent [
	self assert: (indent > 0).
	indent := indent - 1
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranAssignmentStatement: aFASTFortranAssignmentStatement [

	self sixSpaces.
	super visitFASTFortranAssignmentStatement: aFASTFortranAssignmentStatement.
	self newLine
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranAsterisk: aFASTFortranAsterisk [

	self << '*'
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranBinaryExpression: aFASTFortranBinaryExpression [

	aFASTFortranBinaryExpression left accept: self.
	self
		<< ' ' ;
		<< aFASTFortranBinaryExpression operator ;
		<< ' ' .
	aFASTFortranBinaryExpression right accept: self.
	
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranCallStatement: aFASTFortranCallStatement [

	self
		sixSpaces ;
		<< 'call ' ;
		<< aFASTFortranCallStatement name.
		
	aFASTFortranCallStatement arguments
		ifNotEmpty: [
			self << '('.
			self visitFASTFortranTWithArguments: aFASTFortranCallStatement.
			self << ')'
	].
	self newLine
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranCharacterType: aFASTFortranType [
	self << 'character'
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranDeclarationStatement: aFASTFortranDeclarationStatement [
	self sixSpaces.
	aFASTFortranDeclarationStatement type accept: self.
	self << ' '.
	aFASTFortranDeclarationStatement declarators
		do: [ :decl |self << decl name ]
		separatedBy: [ self << ',' ].
	self newLine
		
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranDoStatement: aFASTFortranDoStatement [

	self
		sixSpaces ;
		<< 'do '.
	aFASTFortranDoStatement loopControl accept: self.
	self newLine.
	aFASTFortranDoStatement statementBlock accept: self
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranExternalStatement: aFASTFortranExternalStatement [
	self
		sixSpaces ;
		<< 'external ' ;
		<< aFASTFortranExternalStatement name ;
		newLine
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranFunctionCall: aFASTFortranFunctionCall [

	self << aFASTFortranFunctionCall name.
	aFASTFortranFunctionCall arguments
		ifNotEmpty: [
			self << '('.
			self visitFASTFortranTWithArguments: aFASTFortranFunctionCall.
			self << ')'
	]
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranIfBlockStatement: aFASTFortranIfBlockStatement [

	self
		sixSpaces ;
		<< 'if ('.
	aFASTFortranIfBlockStatement condition accept: self.
	self
		<< ') then' ;
		newLine.
	self indent.
	aFASTFortranIfBlockStatement thenStatementBlock accept: self.
	self unindent.
	(aFASTFortranIfBlockStatement elseStatementBlock statements)
		ifNotEmpty: [
			self
				sixSpaces ;
				<< 'else' ;
				newLine.
			self indent.
			aFASTFortranIfBlockStatement elseStatementBlock accept: self.
			self unindent.
	].
	self
		sixSpaces ;
		<< 'end if' ;
		newLine
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranImplicitStatement: aFASTFortranImplicitStatement [

	self
		sixSpaces ;
		<< 'implicit none' ;
		newLine
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranIntegerType: aFASTFortranIntegerType [
	self << 'integer'
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranLogicalType: aFASTFortranType [
	self << 'logical'
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranLoopControlExpression: aFASTFortranLoopControlExpression [

	aFASTFortranLoopControlExpression init accept: self.
	aFASTFortranLoopControlExpression increment
	ifNotNil: [ :incr |
		self << ','.
		incr accept: self ].
	aFASTFortranLoopControlExpression limit
	ifNotNil: [ :limit |
		self << ','.
		limit accept: self ].

]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranModel: aFASTFortranModel [
	(self rootEntitiesIn: aFASTFortranModel) do: [ :rootEntity |
			rootEntity accept: self
	].
	^self stream
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranRealType: aFASTFortranType [
	self << 'real'
]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranScalarVariable: aFASTFortranScalarVariable [
	self << aFASTFortranScalarVariable name
]

{ #category : #'visiting - programUnits' }
FASTFortranExporterVisitor >> visitFASTFortranSubroutine: aFASTFortranSubroutine [
	self
		sixSpaces ;
		<< 'subroutine ' ;
		<< aFASTFortranSubroutine name.
	self visitFASTFortranTWithParameters: aFASTFortranSubroutine.
	self newLine.
	self visitFASTFortranTBehaviouralEntity: aFASTFortranSubroutine
]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTAssignment: aFASTFortranTAssignment [

	aFASTFortranTAssignment variable accept: self.
	self << ' = '.
	aFASTFortranTAssignment expression accept: self
]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTBehaviouralEntity: aFASTFortranTBehaviouralEntity [
	aFASTFortranTBehaviouralEntity statementBlock accept: self.
	self
		sixSpaces ;
		<< 'end' ;
		newLine

]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTCharacterLiteral: aFASTFortranTLiteral [
	self
		<< '''' ;
		<< aFASTFortranTLiteral primitiveValue ;
		<< ''''
]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTLiteral: aFASTFortranTLiteral [
	self << aFASTFortranTLiteral primitiveValue
]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTReturnStatement: aFASTFortranTReturnStatement [

	self
		sixSpaces ;
		<< 'return '.
	aFASTFortranTReturnStatement expression
		ifNotNil: [ :expr | expr accept: self ].
	self newLine
]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTWithArguments: aFASTFortranTWithArguments [

	aFASTFortranTWithArguments arguments
		do: [ :arg | arg accept: self ]
		separatedBy: [ self << ',' ]
]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTWithFormatIdentifier: aFASTFortranTWithFormatIdentifier [
	self << '('.
	aFASTFortranTWithFormatIdentifier format
		do: [ :fmt | fmt accept: self ]
		separatedBy: [ self << ',' ].
	self << ')'.
]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTWithParameters: aFASTFortranTWithParameters [
	self << '('.
	aFASTFortranTWithParameters parameters
		do: [ :param | self << param name ]
		separatedBy: [ self << ',' ].
	self << ')'.
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranWriteStatement: aFASTFortranWriteStatement [
	self
		sixSpaces ;
		<< 'write'.
	self visitFASTFortranTWithFormatIdentifier: aFASTFortranWriteStatement.
	self << ' '.
	self visitFASTFortranTWithArguments: aFASTFortranWriteStatement.
	self newLine
]

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTTEntity: aFASTTEntity [
	"all children visit are explicit, so don't do anything here"
]
