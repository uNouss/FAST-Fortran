Class {
	#name : #FASTFortranExporterVisitor,
	#superclass : #FASTFortranVisitor,
	#instVars : [
		'stream'
	],
	#category : #'FAST-Fortran-Visitor'
}

{ #category : #streaming }
FASTFortranExporterVisitor >> << aString [
	self stream << aString
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
	self << '      '
]

{ #category : #accessing }
FASTFortranExporterVisitor >> stream [
	^stream ifNil: [ stream := WriteStream on: '' ]
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
		separatedBy: [ self << ', ' ].
	self newLine
		
]

{ #category : #'visiting - statements' }
FASTFortranExporterVisitor >> visitFASTFortranExternalStatement: aFASTFortranExternalStatement [
	self
		sixSpaces ;
		<< 'external ' ;
		<< aFASTFortranExternalStatement name ;
		newLine
]

{ #category : #'visiting - programUnits' }
FASTFortranExporterVisitor >> visitFASTFortranFunction: aFASTFortranFunction [
	<generated>
	self visitFASTFortranTWithParameters: aFASTFortranFunction.
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

{ #category : #visiting }
FASTFortranExporterVisitor >> visitFASTFortranModel: aFASTFortranModel [
	(self rootEntitiesIn: aFASTFortranModel) do: [ :rootEntity |
			rootEntity accept: self
	].
	^self stream
]

{ #category : #'visiting - programUnits' }
FASTFortranExporterVisitor >> visitFASTFortranProcedure: aFASTFortranProcedure [
	self << '('.
	aFASTFortranProcedure parameters
		do: [ :param | self << param name ]
		separatedBy: [ self << ', ' ].
	self << ')'.

]

{ #category : #'visiting - expressions' }
FASTFortranExporterVisitor >> visitFASTFortranRealType: aFASTFortranType [
	self << 'real'
]

{ #category : #'visiting - programUnits' }
FASTFortranExporterVisitor >> visitFASTFortranSubroutine: aFASTFortranSubroutine [
	self
		sixSpaces ;
		<< 'subroutine ' ;
		<< aFASTFortranSubroutine name.
	self visitFASTFortranProcedure: aFASTFortranSubroutine.
	self newLine.
	self visitFASTFortranTBehaviouralEntity: aFASTFortranSubroutine
]

{ #category : #'visiting - traits' }
FASTFortranExporterVisitor >> visitFASTFortranTBehaviouralEntity: aFASTFortranTBehaviouralEntity [
	aFASTFortranTBehaviouralEntity statementBlock accept: self.
	self
		sixSpaces ;
		<< 'end' ;
		newLine

]
