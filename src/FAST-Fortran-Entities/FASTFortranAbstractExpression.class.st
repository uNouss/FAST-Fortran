"
I am the super class of all Fortran expressions
"
Class {
	#name : #FASTFortranAbstractExpression,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTExpression',
	#classTraits : 'FASTFortranTExpression classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAbstractExpression class >> annotation [

	<FMClass: #AbstractExpression super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
