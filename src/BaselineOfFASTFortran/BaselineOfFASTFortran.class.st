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
				repository: 'github://moosetechnology/FAST' ];

	baseline: 'FamixFortran'
		with: [ spec
				loads: #('default');
				repository: 'github://moosetechnology/Famix-Fortran' ];
	
	
	baseline: 'NeoJSON'
		with: [ spec
				loads: #('default');
				repository: 'github://svenvc/NeoJSON' ].
		
]

{ #category : #baselines }
BaselineOfFASTFortran >> definePackages: spec [
	spec
		repository: 'https://github.com/moosetechnology/FAST-Fortran';
		package: 'FAST-Fortran-JSON-Visitor' with: [ spec requires: #(FamixFortran NeoJSON) ] ;
		package: 'FAST-Fortran-Generator' with: [ spec requires: #(FAST FamixFortran) ] ;
		package: 'FAST-Fortran-Entities' with: [ spec requires: #(FamixFortran) ];
		package: 'FAST-Fortran-Visitor' with: [ spec requires: #(FamixFortran) ]
]
