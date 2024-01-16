"
A fortran program unit is a sequence of statements, terminated by an END statement. Every program unit is either a main program or a subprogram. If a program is to be executable, it must have a main program

## Relations
======================

### Parents
- Relation: #parentProgramFile Type: #FASTFortranProgramFile Opposite: #programUnit Comment: Parent program file
### Children
- Relation: #parameters Type: #FASTFortranTVariableEntity Opposite: #parameterOwner Comment: My parameters
- Relation: #statementBlock Type: #FASTFortranTStatementBlock Opposite: #fastBehaviouralParent Comment: Statements block of the behavioural entity
### Other
- Relation: #comments Type: #FASTFortranTComment Opposite: #container Comment: list of comments defined in the entity
- Relation: #invokedIn Type: #FASTFortranTInvocation Opposite: #invoked Comment: Optional invocation where this name is used

## Properties
======================

- Named: #endPos Type: Number
- Named: #endPos Type: Number
- Named: #name Type: String
- Named: #startPos Type: Number
- Named: #startPos Type: Number

"
Class {
	#name : #FASTFortranProgramUnit,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTBehaviouralEntity + FASTFortranTEntity + FASTFortranTNamedEntity + FASTFortranTWithComments',
	#classTraits : 'FASTFortranTBehaviouralEntity classTrait + FASTFortranTEntity classTrait + FASTFortranTNamedEntity classTrait + FASTFortranTWithComments classTrait',
	#instVars : [
		'#parentProgramFile => FMOne type: #FASTFortranProgramFile opposite: #programUnit'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranProgramUnit class >> annotation [

	<FMClass: #ProgramUnit super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranProgramUnit >> parentProgramFile [
	"Relation named: #parentProgramFile type: #FASTFortranProgramFile opposite: #programUnit"

	<generated>
	<FMComment: 'Parent program file'>
	<container>
	^ parentProgramFile
]

{ #category : #accessing }
FASTFortranProgramUnit >> parentProgramFile: anObject [

	<generated>
	parentProgramFile := anObject
]

{ #category : #navigation }
FASTFortranProgramUnit >> parentProgramFileGroup [
	<generated>
	<navigation: 'ParentProgramFile'>
	^ MooseSpecializedGroup with: self parentProgramFile
]
