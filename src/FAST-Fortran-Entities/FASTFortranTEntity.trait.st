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

{ #category : #meta }
FASTFortranTEntity classSide >> annotation [

	<FMClass: #TEntity super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTEntity >> endPos [

	<FMProperty: #endPos type: #Number>
	<generated>
	^ endPos
]

{ #category : #accessing }
FASTFortranTEntity >> endPos: anObject [
	<generated>
	endPos := anObject
]

{ #category : #accessing }
FASTFortranTEntity >> startPos [

	<FMProperty: #startPos type: #Number>
	<generated>
	^ startPos
]

{ #category : #accessing }
FASTFortranTEntity >> startPos: anObject [
	<generated>
	startPos := anObject
]
