"
I represent a fortran statement with a condition: if-block, if-logical

## Relations
======================

### Children
- Relation: #condition Type: #FASTFortranTExpression Opposite: #parentConditionalStatement Comment: Condition


"
Trait {
	#name : #FASTFortranTConditionalStatement,
	#instVars : [
		'#condition => FMOne type: #FASTFortranTExpression opposite: #parentConditionalStatement'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTConditionalStatement classSide >> annotation [

	<FMClass: #TConditionalStatement super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTConditionalStatement >> condition [
	"Relation named: #condition type: #FASTFortranTExpression opposite: #parentConditionalStatement"

	<generated>
	<FMComment: 'Condition'>
	^ condition
]

{ #category : #accessing }
FASTFortranTConditionalStatement >> condition: anObject [

	<generated>
	condition := anObject
]

{ #category : #navigation }
FASTFortranTConditionalStatement >> conditionGroup [
	<generated>
	<navigation: 'Condition'>
	^ MooseSpecializedGroup with: self condition
]
