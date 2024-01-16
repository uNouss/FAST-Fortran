"
I represent Fortran Real statement. A real datum is an approximation of a real number. The real data type, REAL, which usually has the synonym, REAL*4, holds one real datum.The usual default size for a REAL item with no size specified is 4 bytes, and is aligned on 4-byte boundaries. However, these defaults can be changed by compiling with certain special options.A REAL element has a sign bit, an 8-bit exponent, and a 23-bit fraction. These REAL elements in f77 conform to the IEEE standard.


"
Class {
	#name : #FASTFortranRealType,
	#superclass : #FASTFortranType,
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranRealType class >> annotation [

	<FMClass: #RealType super: #FASTFortranType>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
