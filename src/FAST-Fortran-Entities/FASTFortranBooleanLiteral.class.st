"
I represent Fortran Boolean Literal (Constant) statement
"
Class {
	#name : #FASTFortranBooleanLiteral,
	#superclass : #FASTFortranAbstractLiteral,
	#traits : 'FASTFortranTBooleanLiteral',
	#classTraits : 'FASTFortranTBooleanLiteral classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranBooleanLiteral class >> annotation [

	<FMClass: #BooleanLiteral super: #FASTFortranAbstractLiteral>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
