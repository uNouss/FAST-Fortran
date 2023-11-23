"
Part of a variable declaration: name of the variable + optional initial value
"
Class {
	#name : #FASTFortranVariableDeclarator,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTVariableDeclarator',
	#classTraits : 'FASTFortranTVariableDeclarator classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranVariableDeclarator class >> annotation [

	<FMClass: #VariableDeclarator super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
