"
A literal node.

Contains a value for the literal.

FLAG: should refactor some literals to core-model
    e.g.: character, int, float, string, boolean 
"
Trait {
	#name : #FASTFortranTLiteral,
	#instVars : [
		'#primitiveValue => FMProperty'
	],
	#traits : 'FASTFortranTExpression',
	#classTraits : 'FASTFortranTExpression classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #'as yet unclassified' }
FASTFortranTLiteral classSide >> annotation [

	<FMClass: #TLiteral super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTLiteral >> primitiveValue [

	<FMProperty: #primitiveValue type: #String>
	<generated>
	<FMComment: 'The literal itself as found in the source code. We use primitiveValue in order to override value from Object'>
	^ primitiveValue
]

{ #category : #accessing }
FASTFortranTLiteral >> primitiveValue: anObject [
	<generated>
	primitiveValue := anObject
]
