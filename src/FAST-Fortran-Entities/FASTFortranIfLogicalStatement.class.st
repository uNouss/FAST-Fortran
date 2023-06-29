"
The logical IF statement executes one single statement, or does not execute it, depending on the value of a logical expression.
"
Class {
	#name : #FASTFortranIfLogicalStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTtFortranLabelledStatement',
	#classTraits : 'FASTFortranTtFortranLabelledStatement classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranIfLogicalStatement class >> annotation [

	<FMClass: #IfLogicalStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
