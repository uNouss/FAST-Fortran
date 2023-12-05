"
A numerical literal
"
Trait {
	#name : #FASTFortranTNumericalLiteral,
	#instVars : [
		'#parentTypeSize => FMOne type: #FASTFortranType opposite: #size'
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
FASTFortranTNumericalLiteral >> parentTypeSize [
	"Relation named: #parentTypeSize type: #FASTFortranType opposite: #size"

	<generated>
	<container>
	<derived>
	^ parentTypeSize
]

{ #category : #accessing }
FASTFortranTNumericalLiteral >> parentTypeSize: anObject [

	<generated>
	parentTypeSize := anObject
]

{ #category : #navigation }
FASTFortranTNumericalLiteral >> parentTypeSizeGroup [
	<generated>
	<navigation: 'ParentTypeSize'>
	^ MooseSpecializedGroup with: self parentTypeSize
]
