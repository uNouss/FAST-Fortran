"
I represent Fortran assignment made without ASSIGN statement
"
Class {
	#name : #FASTFortranAssignmentStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTAssignment',
	#classTraits : 'FASTFortranTAssignment classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranAssignmentStatement class >> annotation [

	<FMClass: #AssignmentStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
