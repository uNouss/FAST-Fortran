"
I represent Fortran Character Literal (Constant) statement
"
Class {
	#name : #FASTFortranCharacterLiteral,
	#superclass : #FASTFortranAbstractExpression,
	#traits : 'FASTFortranTCharacterLiteral',
	#classTraits : 'FASTFortranTCharacterLiteral classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranCharacterLiteral class >> annotation [

	<FMClass: #CharacterLiteral super: #FASTFortranAbstractExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
