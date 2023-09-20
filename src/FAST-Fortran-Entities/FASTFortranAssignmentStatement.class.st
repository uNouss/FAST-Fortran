"
I represent Fortran assignment made without ASSIGN statement
"
Class {
	#name : #FASTFortranAssignmentStatement,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTAssignment + FASTFortranTLabelledStatement',
	#classTraits : 'FASTFortranTAssignment classTrait + FASTFortranTLabelledStatement classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAssignmentStatement class >> annotation [

	<FMClass: #AssignmentStatement super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
