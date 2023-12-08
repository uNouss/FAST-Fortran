"
I represent a range of characters in an Implicit statement
"
Class {
	#name : #FASTFortranImplicitRange,
	#superclass : #FASTFortranEntity,
	#traits : 'FASTFortranTImplicitCharacter',
	#classTraits : 'FASTFortranTImplicitCharacter classTrait',
	#instVars : [
		'#from => FMProperty',
		'#to => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranImplicitRange class >> annotation [

	<FMClass: #ImplicitRange super: #FASTFortranEntity>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranImplicitRange >> from [

	<FMProperty: #from type: #String>
	<generated>
	<FMComment: 'Start of character range for implicit rule'>
	^ from
]

{ #category : #accessing }
FASTFortranImplicitRange >> from: anObject [
	<generated>
	from := anObject
]

{ #category : #accessing }
FASTFortranImplicitRange >> to [

	<FMProperty: #to type: #String>
	<generated>
	<FMComment: 'End of character range for implicit rule'>
	^ to
]

{ #category : #accessing }
FASTFortranImplicitRange >> to: anObject [
	<generated>
	to := anObject
]
