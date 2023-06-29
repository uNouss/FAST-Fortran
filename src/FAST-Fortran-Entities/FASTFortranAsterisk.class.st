"
I represent an Asterisk Character Literal (Constant) that is often used as a format identifier
"
Class {
	#name : #FASTFortranAsterisk,
	#superclass : #FASTFortranArithmeticLiteral,
	#traits : 'FASTFortranTAssigneable + FASTFortranTFormatIdentifier',
	#classTraits : 'FASTFortranTAssigneable classTrait + FASTFortranTFormatIdentifier classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAsterisk class >> annotation [

	<FMClass: #Asterisk super: #FASTFortranArithmeticLiteral>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
