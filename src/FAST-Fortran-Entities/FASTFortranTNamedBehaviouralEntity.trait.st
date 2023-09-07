"
@FLAG: May be could be removed to have a simpler core model.
Each language would have to implement it correctly then

A behavioural entity that can be referenced with a name.

Assumed to correspond to a function or a method
"
Trait {
	#name : #FASTFortranTNamedBehaviouralEntity,
	#traits : 'FASTFortranTBehaviouralEntity + FASTFortranTNamedEntity',
	#classTraits : 'FASTFortranTBehaviouralEntity classTrait + FASTFortranTNamedEntity classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #'as yet unclassified' }
FASTFortranTNamedBehaviouralEntity classSide >> annotation [

	<FMClass: #TNamedBehaviouralEntity super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
