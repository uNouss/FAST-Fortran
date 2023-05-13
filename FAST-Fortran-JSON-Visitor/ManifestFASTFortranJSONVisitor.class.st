"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestFASTFortranJSONVisitor,
	#superclass : #PackageManifest,
	#category : #'FAST-Fortran-JSON-Visitor-Manifest'
}

{ #category : #'code-critics' }
ManifestFASTFortranJSONVisitor class >> ruleTempsReadBeforeWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#FASTFortranJsonVisitor #visitConditions: #false)) #'2023-05-13T10:18:21.006419+02:00') )
]
