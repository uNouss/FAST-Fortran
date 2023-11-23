"
I represent Fortran Arithmetic Real Literal (Constant) statement
"
Class {
	#name : #FASTFortranRealLiteral,
	#superclass : #FASTFortranAbstractExpression,
	#traits : 'FASTFortranTNumericalLiteral',
	#classTraits : 'FASTFortranTNumericalLiteral classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranRealLiteral class >> annotation [

	<FMClass: #RealLiteral super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
