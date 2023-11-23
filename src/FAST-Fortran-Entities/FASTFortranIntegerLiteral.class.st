"
I represent Fortran Arithmetic Integer Literal (Constant) statement
"
Class {
	#name : #FASTFortranIntegerLiteral,
	#superclass : #FASTFortranAbstractLiteral,
	#traits : 'FASTFortranTNumericalLiteral',
	#classTraits : 'FASTFortranTNumericalLiteral classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranIntegerLiteral class >> annotation [

	<FMClass: #IntegerLiteral super: #FASTFortranAbstractLiteral>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
