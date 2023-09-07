"
A node that wraps around structural entity
"
Trait {
	#name : #FASTFortranTVariableExpression,
	#traits : 'FASTFortranTExpression + FASTFortranTNamedEntity',
	#classTraits : 'FASTFortranTExpression classTrait + FASTFortranTNamedEntity classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #'as yet unclassified' }
FASTFortranTVariableExpression classSide >> annotation [

	<FMClass: #TVariableExpression super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
