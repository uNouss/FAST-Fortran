Class {
	#name : #AbstractJsonToFASTTests,
	#superclass : #TestCase,
	#instVars : [
		'fortranCode',
		'jsonCode'
	],
	#category : #'FAST-Fortran-Visitors-Tests-Visitor'
}

{ #category : #running }
AbstractJsonToFASTTests >> jsonVisitor [
	self subclassResponsibility 
]

{ #category : #running }
AbstractJsonToFASTTests >> visitJsonCode [

	| visitor |
	visitor := self jsonVisitor new.
	visitor initLineSizes: fortranCode.
	^ visitor visitProgramFile: (NeoJSONReader fromString: jsonCode)
]
