Class {
	#name : #FASTFortranModel,
	#superclass : #MooseModel,
	#traits : 'FASTFortranTEntityCreator',
	#classTraits : 'FASTFortranTEntityCreator classTrait',
	#category : #'FAST-Fortran-Entities-Model'
}

{ #category : #accessing }
FASTFortranModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits' #'FAST-Core-Model')
]

{ #category : #'as yet unclassified' }
FASTFortranModel class >> annotation [
	<FMClass: #FASTFortranModel super: #MooseModel>
	<package: #'FAST-Fortran-Entities'>
	<generated>
]
