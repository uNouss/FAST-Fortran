"
A node that wraps around structural entity
"
Trait {
	#name : #FASTFortranTVariableExpression,
	#instVars : [
		'#parentEquivalenceGroup => FMOne type: #FASTFortranEquivalenceGroup opposite: #variables'
	],
	#traits : 'FASTFortranTExpression + FASTFortranTNamedEntity',
	#classTraits : 'FASTFortranTExpression classTrait + FASTFortranTNamedEntity classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTVariableExpression classSide >> annotation [

	<FMClass: #TVariableExpression super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTVariableExpression >> parentEquivalenceGroup [
	"Relation named: #parentEquivalenceGroup type: #FASTFortranEquivalenceGroup opposite: #variables"

	<generated>
	<container>
	^ parentEquivalenceGroup
]

{ #category : #accessing }
FASTFortranTVariableExpression >> parentEquivalenceGroup: anObject [

	<generated>
	parentEquivalenceGroup := anObject
]

{ #category : #navigation }
FASTFortranTVariableExpression >> parentEquivalenceGroupGroup [
	<generated>
	<navigation: 'ParentEquivalenceGroup'>
	^ MooseSpecializedGroup with: self parentEquivalenceGroup
]
