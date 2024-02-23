"
The logical IF statement executes one single statement, or does not execute it, depending on the value of a logical expression.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `condition` | `FASTFortranTConditionalStatement` | `parentConditionalStatement` | `FASTFortranTExpression` | Condition|
| `statement` | `FASTFortranIfLogicalStatement` | `parentIfStatement` | `FASTFortranTStatement` | Statement of the logical if|



"
Class {
	#name : #FASTFortranIfLogicalStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTConditionalStatement',
	#classTraits : 'FASTFortranTConditionalStatement classTrait',
	#instVars : [
		'#statement => FMOne type: #FASTFortranTStatement opposite: #parentIfStatement'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranIfLogicalStatement class >> annotation [

	<FMClass: #IfLogicalStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranIfLogicalStatement >> statement [
	"Relation named: #statement type: #FASTFortranTStatement opposite: #parentIfStatement"

	<generated>
	<FMComment: 'Statement of the logical if'>
	^ statement
]

{ #category : #accessing }
FASTFortranIfLogicalStatement >> statement: anObject [

	<generated>
	statement := anObject
]

{ #category : #navigation }
FASTFortranIfLogicalStatement >> statementGroup [
	<generated>
	<navigation: 'Statement'>
	^ MooseSpecializedGroup with: self statement
]
