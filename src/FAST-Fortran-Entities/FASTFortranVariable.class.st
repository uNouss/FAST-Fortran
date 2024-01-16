"
an abstract Fortran Variable, could be an array or a scalar

## Relations
======================

### Parents
- Relation: #entryStatement Type: #FASTFortranEntryStatement Opposite: #entryArguments
- Relation: #parameterOwner Type: #FASTFortranTWithParameters Opposite: #parameters Comment: parameterOwner
- Relation: #parentFormatedStatement Type: #FASTFortranTWithFormat Opposite: #format Comment: A format description in a Format/Print/Read/Write statement
- Relation: #parentIOStatement Type: #FASTFortranTWithIOParameters Opposite: #ioParameters
- Relation: #parentImpliedExpression Type: #FASTFortranImpliedDoExpression Opposite: #variables
### Other
- Relation: #invokedIn Type: #FASTFortranTInvocation Opposite: #invoked Comment: Optional invocation where this name is used
- Relation: #parentAssignmentExpression Type: #FASTFortranTAssignment Opposite: #variable Comment: Optional assignment to the variable
- Relation: #parentVariableGroup Type: #FASTFortranTVariableGroup Opposite: #variables

## Properties
======================

- Named: #endPos Type: Number
- Named: #endPos Type: Number
- Named: #name Type: String
- Named: #name Type: String Comment: Determines the variable name
- Named: #startPos Type: Number
- Named: #startPos Type: Number

"
Class {
	#name : #FASTFortranVariable,
	#superclass : #FASTFortranAbstractExpression,
	#traits : 'FASTFortranTEntryStatement + FASTFortranTFormat + FASTFortranTVariableEntity',
	#classTraits : 'FASTFortranTEntryStatement classTrait + FASTFortranTFormat classTrait + FASTFortranTVariableEntity classTrait',
	#instVars : [
		'#name => FMProperty',
		'#parentVariableGroup => FMOne type: #FASTFortranTVariableGroup opposite: #variables'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranVariable class >> annotation [

	<FMClass: #Variable super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranVariable >> name [

	<FMProperty: #name type: #String>
	<generated>
	<FMComment: 'Determines the variable name'>
	^ name
]

{ #category : #accessing }
FASTFortranVariable >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
FASTFortranVariable >> parentVariableGroup [
	"Relation named: #parentVariableGroup type: #FASTFortranTVariableGroup opposite: #variables"

	<generated>
	^ parentVariableGroup
]

{ #category : #accessing }
FASTFortranVariable >> parentVariableGroup: anObject [

	<generated>
	parentVariableGroup := anObject
]
