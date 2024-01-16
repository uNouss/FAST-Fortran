"
Contains the block of Fortran statements

## Relations
======================

### Parents
- Relation: #fastBehaviouralParent Type: #FASTFortranTBehaviouralEntity Opposite: #statementBlock Comment: Behavioural entity containing the statement block.
- Relation: #parentDoStatement Type: #FASTFortranDoStatement Opposite: #statementBlock Comment: Parent do statement
- Relation: #parentIfBlock Type: #FASTFortranIfBlockStatement Opposite: #thenStatementBlock Comment: Parent if block
- Relation: #parentIfBlock Type: #FASTFortranIfBlockStatement Opposite: #elseStatementBlock Comment: Parent if block
- Relation: #parentIfStatement Type: #FASTFortranIfLogicalStatement Opposite: #statement Comment: Parent if statement
- Relation: #statementContainer Type: #FASTFortranTStatementBlock Opposite: #statements Comment: Block containing this statement.
### Children
- Relation: #statements Type: #FASTFortranTStatement Opposite: #statementContainer Comment: Statements enclosed in this block
### Other
- Relation: #comments Type: #FASTFortranTComment Opposite: #container Comment: list of comments defined in the entity

## Properties
======================

- Named: #endPos Type: Number
- Named: #endPos Type: Number
- Named: #label Type: String Comment: Determines the statement label which consists of 1 to 5 digits, with at least one nonzero
- Named: #startPos Type: Number
- Named: #startPos Type: Number

"
Class {
	#name : #FASTFortranStatementBlock,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTStatementBlock + FASTFortranTWithComments',
	#classTraits : 'FASTFortranTStatementBlock classTrait + FASTFortranTWithComments classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranStatementBlock class >> annotation [

	<FMClass: #StatementBlock super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
