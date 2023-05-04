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
				repository: 'github://moosetechnology/FAST:v2/src' ].
	
	spec
		baseline: 'NeoJSON'
		with: [ spec
				loads: #('default');
				repository: 'https://github.com/svenvc/NeoJSON' ].
			
	"spec
		baseline: 'PetitParser2'
		with: [ spec
				loads: #('default');
				repository: 'https://github.com/kursjan/petitparser2' ]."
]

{ #category : #baselines }
BaselineOfFASTFortran >> definePackages: spec [
	spec
		repository: 'https://github.com/moosetechnology/FAST-Fortran';
		package: 'FAST-Fortran-JSON-Visitor' with: [ spec requires: #(FAST NeoJSON) ] ;
		package: 'FAST-Fortran-Model-Generator' with: [ spec requires: #(FAST) ]

]
