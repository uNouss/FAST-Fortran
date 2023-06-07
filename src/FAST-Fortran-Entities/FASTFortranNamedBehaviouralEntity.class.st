"
@FLAG: May be could be removed to have a simpler core model.
Each language would have to implement it correctly then

A behavioural entity that can be referenced with a name.

Assumed to correspond to a function or a method
"
Class {
	#name : #FASTFortranNamedBehaviouralEntity,
	#superclass : #FASTFortranBehaviouralEntity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranNamedBehaviouralEntity class >> annotation [

	<FMClass: #NamedBehaviouralEntity super: #FASTFortranBehaviouralEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
