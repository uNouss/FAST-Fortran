"
I represent Fortran Double Complex statement. The complex data type, DOUBLE COMPLEX, which usually has the synonym, COMPLEX*16, is a pair of DOUBLE PRECISION (REAL*8)values that represents a complex number. The first element represents the real part; the second represents the imaginary part.The default size for DOUBLE COMPLEX with no size specified is 16.
"
Class {
	#name : #FASTFortranDoubleComplexType,
	#superclass : #FASTFortranType,
	#category : #'FAST-Fortran-Entities-Entities'
}

{ #category : #meta }
FASTFortranDoubleComplexType class >> annotation [

	<FMClass: #DoubleComplexType super: #FASTFortranType>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]
