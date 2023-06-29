"
I represent FortranData statement
"
Class {
	#name : #FASTFortranDataStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTtFortranLabelledStatement',
	#classTraits : 'FASTFortranTtFortranLabelledStatement classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranDataStatement class >> annotation [

	<FMClass: #DataStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
