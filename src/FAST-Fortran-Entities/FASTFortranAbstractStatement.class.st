"
I am the super class of all Fortran statements

## Relations
======================

### Parents
- Relation: #parentIfStatement Type: #FASTFortranIfLogicalStatement Opposite: #statement Comment: Parent if statement
- Relation: #statementContainer Type: #FASTFortranTStatementBlock Opposite: #statements Comment: Block containing this statement.

## Properties
======================

- Named: #endPos Type: Number
- Named: #endPos Type: Number
- Named: #label Type: String Comment: Determines the statement label which consists of 1 to 5 digits, with at least one nonzero
- Named: #startPos Type: Number
- Named: #startPos Type: Number

"
Class {
	#name : #FASTFortranAbstractStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTStatement',
	#classTraits : 'FASTFortranTStatement classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAbstractStatement class >> annotation [

	<FMClass: #AbstractStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
