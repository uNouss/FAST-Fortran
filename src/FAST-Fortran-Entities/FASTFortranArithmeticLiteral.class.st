"
I represent Fortran Arithmetic Literal (Constant) statement
"
Class {
	#name : #FASTFortranArithmeticLiteral,
	#superclass : #FASTFortranLiteral,
	#instVars : [
		'#isTyped => FMProperty',
		'#isSigned => FMProperty',
		'#sign => FMProperty'
	],
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranArithmeticLiteral class >> annotation [

	<FMClass: #ArithmeticLiteral super: #FASTFortranLiteral>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranArithmeticLiteral >> isSigned [

	<FMProperty: #isSigned type: #Boolean>
	<generated>
	<FMComment: 'Determines if the constant signed or not'>
	^ isSigned
]

{ #category : #accessing }
FASTFortranArithmeticLiteral >> isSigned: anObject [
	<generated>
	isSigned := anObject
]

{ #category : #accessing }
FASTFortranArithmeticLiteral >> isTyped [

	<FMProperty: #isTyped type: #Boolean>
	<generated>
	<FMComment: 'Determines if the constant typed or typeless'>
	^ isTyped
]

{ #category : #accessing }
FASTFortranArithmeticLiteral >> isTyped: anObject [
	<generated>
	isTyped := anObject
]

{ #category : #accessing }
FASTFortranArithmeticLiteral >> sign [

	<FMProperty: #sign type: #Number>
	<generated>
	<FMComment: 'Determines the arithmetic constant sign'>
	^ sign
]

{ #category : #accessing }
FASTFortranArithmeticLiteral >> sign: anObject [
	<generated>
	sign := anObject
]
