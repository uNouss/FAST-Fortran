"
I represent Fortran accept statement

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
	#name : #FASTFortranAcceptStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTStatement',
	#classTraits : 'FASTFortranTStatement classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAcceptStatement class >> annotation [

	<FMClass: #AcceptStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
