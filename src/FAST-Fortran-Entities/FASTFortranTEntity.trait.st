"
any entity
"
Trait {
	#name : #FASTFortranTEntity,
	#instVars : [
		'#startPos => FMProperty',
		'#endPos => FMProperty'
	],
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #'as yet unclassified' }
FASTFortranTEntity classSide >> annotation [

	<FMClass: #TEntity super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #'as yet unclassified' }
FASTFortranTEntity >> endPos [

	<FMProperty: #endPos type: #Number>
	<generated>
	^ endPos
]

{ #category : #'as yet unclassified' }
FASTFortranTEntity >> endPos: anObject [
	<generated>
	endPos := anObject
]

{ #category : #'as yet unclassified' }
FASTFortranTEntity >> startPos [

	<FMProperty: #startPos type: #Number>
	<generated>
	^ startPos
]

{ #category : #'as yet unclassified' }
FASTFortranTEntity >> startPos: anObject [
	<generated>
	startPos := anObject
]
