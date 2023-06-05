Class {
	#name : #BaselineOfFASTFortran,
	#superclass : #BaselineOf,
	#category : #BaselineOfFASTFortran
}

{ #category : #baselines }
BaselineOfFASTFortran >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec description: 'Developement version of FAST Fortran'.
		self definePackages: spec.
		self defineDependencies: spec ]
]

{ #category : #baselines }
BaselineOfFASTFortran >> defineDependencies: spec [
	spec
		baseline: 'FAST'
		with: [ spec
				loads: #('default');
				repository: 'github://moosetechnology/Famix:development/src' ].
	
	"will be loaded from Famix"
	"spec
		baseline: 'NeoJSON'
		with: [ spec
				loads: #('default');
				repository: 'https://github.com/svenvc/NeoJSON' ]."
		
]

{ #category : #baselines }
BaselineOfFASTFortran >> definePackages: spec [
	spec
		repository: 'https://github.com/moosetechnology/FAST-Fortran';
		package: 'FAST-Fortran-JSON-Visitor' with: [ spec requires: #(FAST NeoJSON) ] ;
		package: 'FAST-Fortran-Generator' with: [ spec requires: #(FAST) ] ;
		package: 'FAST-Fortran-Entities' with: [ spec requires: #(FAST) ];
		package: 'FAST-Fortran-Visitor' with: [ spec requires: #(FAST) ]
]
