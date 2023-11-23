"
I represent Fortran Arithmetic Integer Literal (Constant) statement
"
Class {
	#name : #FASTFortranIntegerLiteral,
	#superclass : #FASTFortranAbstractExpression,
	#traits : 'FASTFortranTNumericalLiteral',
	#classTraits : 'FASTFortranTNumericalLiteral classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranIntegerLiteral class >> annotation [

	<FMClass: #IntegerLiteral super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
