"
A node representing an assignment
"
Trait {
	#name : #FASTFortranTAssignment,
	#instVars : [
		'#variable => FMOne type: #FASTFortranTVariableEntity opposite: #parentAssignmentExpression',
		'#expression => FMOne type: #FASTFortranTExpression opposite: #assignedIn'
	],
	#traits : 'FASTFortranTExpression',
	#classTraits : 'FASTFortranTExpression classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTAssignment classSide >> annotation [

	<FMClass: #TAssignment super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTAssignment >> expression [
	"Relation named: #expression type: #FASTFortranTExpression opposite: #assignedIn"

	<generated>
	<FMComment: 'Assigned expression (rhs of assignment)'>
	^ expression
]

{ #category : #accessing }
FASTFortranTAssignment >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #accessing }
FASTFortranTAssignment >> variable [
	"Relation named: #variable type: #FASTFortranTVariableEntity opposite: #parentAssignmentExpression"

	<generated>
	<FMComment: 'An assigned variable (lhs of assignment)'>
	^ variable
]

{ #category : #accessing }
FASTFortranTAssignment >> variable: anObject [

	<generated>
	variable := anObject
]
