"
a Fortran Return Statement

## Relations
======================

### Parents
- Relation: #parentIfStatement Type: #FASTFortranIfLogicalStatement Opposite: #statement Comment: Parent if statement
- Relation: #statementContainer Type: #FASTFortranTStatementBlock Opposite: #statements Comment: Block containing this statement.
### Children
- Relation: #expression Type: #FASTFortranTExpression Opposite: #returnOwner Comment: The expression returned

## Properties
======================

- Named: #alternateReturnLable Type: String Comment: Optional. Expression of type INTEGER or REAL
- Named: #endPos Type: Number
- Named: #endPos Type: Number
- Named: #label Type: String Comment: Determines the statement label which consists of 1 to 5 digits, with at least one nonzero
- Named: #startPos Type: Number
- Named: #startPos Type: Number

"
Class {
	#name : #FASTFortranReturnStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTReturnStatement',
	#classTraits : 'FASTFortranTReturnStatement classTrait',
	#instVars : [
		'#alternateReturnLable => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranReturnStatement class >> annotation [

	<FMClass: #ReturnStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranReturnStatement >> alternateReturnLable [

	<FMProperty: #alternateReturnLable type: #String>
	<generated>
	<FMComment: 'Optional. Expression of type INTEGER or REAL'>
	^ alternateReturnLable
]

{ #category : #accessing }
FASTFortranReturnStatement >> alternateReturnLable: anObject [
	<generated>
	alternateReturnLable := anObject
]
