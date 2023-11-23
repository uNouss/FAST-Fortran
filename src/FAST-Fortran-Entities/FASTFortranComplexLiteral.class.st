"
I represent Fortran Arithmetic Complex Literal (Constant) statement
"
Class {
	#name : #FASTFortranComplexLiteral,
	#superclass : #FASTFortranAbstractExpression,
	#traits : 'FASTFortranTNumericalLiteral',
	#classTraits : 'FASTFortranTNumericalLiteral classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranComplexLiteral class >> annotation [

	<FMClass: #ComplexLiteral super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
