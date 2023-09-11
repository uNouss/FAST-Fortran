"
A node for variable name not in a expression (example: assigned variable or parameter)
"
Trait {
	#name : #FASTFortranTVariableEntity,
	#instVars : [
		'#parameterOwner => FMOne type: #FASTFortranTWithParameters opposite: #parameters',
		'#parentAssignmentExpression => FMOne type: #FASTFortranTAssignment opposite: #variable'
	],
	#traits : 'FASTFortranTNamedEntity',
	#classTraits : 'FASTFortranTNamedEntity classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #'as yet unclassified' }
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
