"
I represent a fortran statement with a label
"
Trait {
	#name : #FASTFortranTLabelledStatement,
	#traits : 'FASTFortranTStatement',
	#classTraits : 'FASTFortranTStatement classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTLabelledStatement classSide >> annotation [

	<FMClass: #TLabelledStatement super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]