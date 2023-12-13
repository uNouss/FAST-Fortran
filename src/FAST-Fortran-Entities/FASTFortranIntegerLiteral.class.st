"
I represent Fortran Arithmetic Integer Literal (Constant) statement
"
Class {
	#name : #FASTFortranIntegerLiteral,
	#superclass : #FASTFortranAbstractLiteral,
	#traits : 'FASTFortranTFormat + FASTFortranTNumericalLiteral',
	#classTraits : 'FASTFortranTFormat classTrait + FASTFortranTNumericalLiteral classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranIntegerLiteral class >> annotation [

	<FMClass: #IntegerLiteral super: #FASTFortranAbstractLiteral>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
