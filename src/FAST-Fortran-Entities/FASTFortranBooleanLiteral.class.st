"
I represent Fortran Boolean Literal (Constant) statement
"
Class {
	#name : #FASTFortranBooleanLiteral,
	#superclass : #FASTFortranAbstractExpression,
	#traits : 'FASTFortranTBooleanLiteral',
	#classTraits : 'FASTFortranTBooleanLiteral classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranBooleanLiteral class >> annotation [

	<FMClass: #BooleanLiteral super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
