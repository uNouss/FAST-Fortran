"
a Fortran Binary Expression (arithmetic, logical)
"
Class {
	#name : #FASTFortranBinaryExpression,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTBinaryExpression',
	#classTraits : 'FASTFortranTBinaryExpression classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranBinaryExpression class >> annotation [

	<FMClass: #BinaryExpression super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
