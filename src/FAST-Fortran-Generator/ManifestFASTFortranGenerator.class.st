"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestFASTFortranGenerator,
	#superclass : #PackageManifest,
	#category : #'FAST-Fortran-Generator-Manifest'
}

{ #category : #'code-critics' }
ManifestFASTFortranGenerator class >> ruleLongMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#FASTFortranGenerator)) #'2023-11-23T17:00:34.717579+01:00') )
]
