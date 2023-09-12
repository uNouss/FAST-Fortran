Class {
	#name : #FASTFortranModel,
	#superclass : #MooseModel,
	#traits : 'FASTFortranTEntityCreator + FASTTEntityCreator',
	#classTraits : 'FASTFortranTEntityCreator classTrait + FASTTEntityCreator classTrait',
	#category : #'FAST-Fortran-Entities-Model'
}

{ #category : #accessing }
FASTFortranModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits' #'FAST-Core-Model')
]

{ #category : #meta }
FASTFortranModel class >> annotation [
	<FMClass: #FASTFortranModel super: #MooseModel>
	<package: #'FAST-Fortran-Entities'>
	<generated>
]
