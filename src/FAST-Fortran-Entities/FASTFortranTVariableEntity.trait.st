"
A node for variable name not in a expression (example: assigned variable or parameter)

## Relations
======================

### Parents
- Relation: #parameterOwner Type: #FASTFortranTWithParameters Opposite: #parameters Comment: parameterOwner
- Relation: #parentImpliedExpression Type: #FASTFortranImpliedDoExpression Opposite: #variables
### Other
- Relation: #invokedIn Type: #FASTFortranTInvocation Opposite: #invoked Comment: Optional invocation where this name is used
- Relation: #parentAssignmentExpression Type: #FASTFortranTAssignment Opposite: #variable Comment: Optional assignment to the variable

## Properties
======================

- Named: #endPos Type: Number
- Named: #endPos Type: Number
- Named: #name Type: String
- Named: #startPos Type: Number
- Named: #startPos Type: Number

"
Trait {
	#name : #FASTFortranTVariableEntity,
	#instVars : [
		'#parameterOwner => FMOne type: #FASTFortranTWithParameters opposite: #parameters',
		'#parentAssignmentExpression => FMOne type: #FASTFortranTAssignment opposite: #variable',
		'#parentImpliedExpression => FMOne type: #FASTFortranImpliedDoExpression opposite: #variables'
	],
	#traits : 'FASTFortranTNamedEntity',
	#classTraits : 'FASTFortranTNamedEntity classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTVariableEntity classSide >> annotation [

	<FMClass: #TVariableEntity super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTVariableEntity >> parameterOwner [
	"Relation named: #parameterOwner type: #FASTFortranTWithParameters opposite: #parameters"

	<generated>
	<FMComment: 'parameterOwner'>
	<container>
	^ parameterOwner
]

{ #category : #accessing }
FASTFortranTVariableEntity >> parameterOwner: anObject [

	<generated>
	parameterOwner := anObject
]

{ #category : #navigation }
FASTFortranTVariableEntity >> parameterOwnerGroup [
	<generated>
	<navigation: 'ParameterOwner'>
	^ MooseSpecializedGroup with: self parameterOwner
]

{ #category : #accessing }
FASTFortranTVariableEntity >> parentAssignmentExpression [
	"Relation named: #parentAssignmentExpression type: #FASTFortranTAssignment opposite: #variable"

	<generated>
	<FMComment: 'Optional assignment to the variable'>
	<derived>
	^ parentAssignmentExpression
]

{ #category : #accessing }
FASTFortranTVariableEntity >> parentAssignmentExpression: anObject [

	<generated>
	parentAssignmentExpression := anObject
]

{ #category : #accessing }
FASTFortranTVariableEntity >> parentImpliedExpression [
	"Relation named: #parentImpliedExpression type: #FASTFortranImpliedDoExpression opposite: #variables"

	<generated>
	<container>
	^ parentImpliedExpression
]

{ #category : #accessing }
FASTFortranTVariableEntity >> parentImpliedExpression: anObject [

	<generated>
	parentImpliedExpression := anObject
]

{ #category : #navigation }
FASTFortranTVariableEntity >> parentImpliedExpressionGroup [
	<generated>
	<navigation: 'ParentImpliedExpression'>
	^ MooseSpecializedGroup with: self parentImpliedExpression
]
