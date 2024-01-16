"
I represent FortranDimension statement

## Relations
======================

### Children
- Relation: #declarators Type: #FASTFortranTVariableDeclarator Opposite: #parentDeclaration Comment: variables declared


"
Class {
	#name : #FASTFortranDimensionStatement,
	#superclass : #FASTFortranAbstractStatement,
	#traits : 'FASTFortranTWithDeclarators',
	#classTraits : 'FASTFortranTWithDeclarators classTrait',
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranDimensionStatement class >> annotation [

	<FMClass: #DimensionStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
