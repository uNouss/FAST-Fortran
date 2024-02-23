"
A fortran program unit is a sequence of statements, terminated by an END statement. Every program unit is either a main program or a subprogram. If a program is to be executable, it must have a main program

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentProgramFile` | `FASTFortranProgramUnit` | `programUnit` | `FASTFortranProgramFile` | Parent program file|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parameters` | `FASTFortranTWithParameters` | `parameterOwner` | `FASTFortranTVariableEntity` | My parameters|
| `statementBlock` | `FASTFortranTBehaviouralEntity` | `fastBehaviouralParent` | `FASTFortranTStatementBlock` | Statements block of the behavioural entity|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FASTFortranTWithComments` | `container` | `FASTFortranTComment` | list of comments defined in the entity|
| `invokedIn` | `FASTFortranTNamedEntity` | `invoked` | `FASTFortranTInvocation` | Optional invocation where this name is used|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

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
