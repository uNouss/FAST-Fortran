"
A numerical literal
"
Trait {
	#name : #FASTFortranTNumericalLiteral,
	#instVars : [
		'#parentArrayDimensionDeclarator => FMOne type: #FASTFortranArrayDimensionDeclarator opposite: #ub'
	],
	#traits : 'FASTFortranTLiteral',
	#classTraits : 'FASTFortranTLiteral classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTNumericalLiteral classSide >> annotation [

	<FMClass: #TNumericalLiteral super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTNumericalLiteral >> parentArrayDimensionDeclarator [
	"Relation named: #parentArrayDimensionDeclarator type: #FASTFortranArrayDimensionDeclarator opposite: #ub"

	<generated>
	<FMComment: 'Parent array dimension declarator'>
	<container>
	<derived>
	^ parentArrayDimensionDeclarator
]

{ #category : #accessing }
FASTFortranTNumericalLiteral >> parentArrayDimensionDeclarator: anObject [

	<generated>
	parentArrayDimensionDeclarator := anObject
]

{ #category : #navigation }
FASTFortranTNumericalLiteral >> parentArrayDimensionDeclaratorGroup [
	<generated>
	<navigation: 'ParentArrayDimensionDeclarator'>
	^ MooseSpecializedGroup with: self parentArrayDimensionDeclarator
]
