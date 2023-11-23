"
a Fortran Binary Expression (arithmetic, logical)
"
Class {
	#name : #FASTFortranBinaryExpression,
	#superclass : #FASTFortranAbstractExpression,
	#traits : 'FASTFortranTBinaryExpression',
	#classTraits : 'FASTFortranTBinaryExpression classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranBinaryExpression class >> annotation [

	<FMClass: #BinaryExpression super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
