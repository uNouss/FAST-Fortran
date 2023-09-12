"
I represent an Asterisk Character Literal (Constant) that is often used as a format identifier
"
Class {
	#name : #FASTFortranAsterisk,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTFormatIdentifier + FASTFortranTNumericalLiteral',
	#classTraits : 'FASTFortranTFormatIdentifier classTrait + FASTFortranTNumericalLiteral classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAsterisk class >> annotation [

	<FMClass: #Asterisk super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
