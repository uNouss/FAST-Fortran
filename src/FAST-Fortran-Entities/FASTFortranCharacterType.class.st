"
I represent Fortran Character statement. The character data type, CHARACTER, which has the synonym, CHARACTER*1, holds one character. The character is enclosed in apostrophes (') or quotes (""""). @ Allowing quotes ("""") is nonstandard; if you compile with the -xl option, quotes mean something else, and you must use apostrophes to enclose a string. The data of type CHARACTER is always unsigned. A CHARACTER item occupies 1 byte (8 bits) of storage and is aligned on 1-byte boundaries.
"
Class {
	#name : #FASTFortranCharacterType,
	#superclass : #FASTFortranType,
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranCharacterType class >> annotation [

	<FMClass: #CharacterType super: #FASTFortranType>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranCharacterType >> size [

	<FMProperty: #size type: #Number>
	<generated>
	<FMComment: 'Determines a size of bytes of storage a character string occupies'>
	^ size
]

{ #category : #accessing }
FASTFortranCharacterType >> size: anObject [
	<generated>
	size := anObject
]
