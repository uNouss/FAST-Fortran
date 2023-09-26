"
a Fortran Unary Expression (arithmetic, logical, character)
"
Class {
	#name : #FASTFortranUnaryExpression,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTUnaryExpression',
	#classTraits : 'FASTFortranTUnaryExpression classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranUnaryExpression class >> annotation [

	<FMClass: #UnaryExpression super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
