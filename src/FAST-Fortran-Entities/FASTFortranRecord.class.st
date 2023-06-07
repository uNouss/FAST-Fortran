"
I represent Fortran Record statement
"
Class {
	#name : #FASTFortranRecord,
	#superclass : #FASTFortranExpression,
	#traits : 'FASTFortranTAssigneable',
	#classTraits : 'FASTFortranTAssigneable classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranRecord class >> annotation [

	<FMClass: #Record super: #FASTFortranExpression>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
