"
I represent Fortran Character Literal (Constant) statement
"
Class {
	#name : #FASTFortranCharacterLiteral,
	#superclass : #FASTFortranAbstractLiteral,
	#traits : 'FASTFortranTCharacterLiteral + FASTFortranTFormat + FASTFortranTInquireSpecifier',
	#classTraits : 'FASTFortranTCharacterLiteral classTrait + FASTFortranTFormat classTrait + FASTFortranTInquireSpecifier classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranCharacterLiteral class >> annotation [

	<FMClass: #CharacterLiteral super: #FASTFortranAbstractLiteral>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
