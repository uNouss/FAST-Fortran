Class {
	#name : #FASTFortranDeclarationStatement,
	#superclass : #FASTFortranStatement,
	#instVars : [
		'type',
		'attributes',
		'declarators'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #accessing }
FASTFortranDeclarationStatement >> attributes [
	^attributes
]

{ #category : #accessing }
FASTFortranDeclarationStatement >> attributes: anObject [

	attributes := anObject
]

{ #category : #accessing }
FASTFortranDeclarationStatement >> declarators [

	^ declarators
]

{ #category : #accessing }
FASTFortranDeclarationStatement >> declarators: anObject [

	declarators := anObject
]

{ #category : #accessing }
FASTFortranDeclarationStatement >> type [

	^ type
]

{ #category : #accessing }
FASTFortranDeclarationStatement >> type: anObject [

	type := anObject
]
