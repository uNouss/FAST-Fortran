"
I represent Fortran Call statement
"
Class {
	#name : #FASTFortranCallStatement,
	#superclass : #FASTFortranStatement,
	#traits : 'FASTFortranTAssigneable + FASTFortranTIOListMember + FASTFortranTWithArguments',
	#classTraits : 'FASTFortranTAssigneable classTrait + FASTFortranTIOListMember classTrait + FASTFortranTWithArguments classTrait',
	#instVars : [
		'#name => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranCallStatement class >> annotation [

	<FMClass: #CallStatement super: #FASTFortranStatement>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranCallStatement >> name [

	<FMProperty: #name type: #String>
	<generated>
	<FMComment: 'Name of a callling entity'>
	^ name
]

{ #category : #accessing }
FASTFortranCallStatement >> name: anObject [
	<generated>
	name := anObject
]
