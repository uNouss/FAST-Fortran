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
		self defineDependencies: spec ]
]

{ #category : #baselines }
BaselineOfFASTFortran >> defineDependencies: spec [
	spec
		baseline: 'FAST'
		with: [ spec
				loads: #('default');
				repository: 'github://moosetechnology/FAST:v1.x.x/src' ].
	
	spec
		baseline: 'Neo-JSON'
		with: [ spec
				loads: #('default');
				repository: 'https://github.com/svenvc/NeoJSON' ].
			
	spec
		baseline: 'PetitParser2'
		with: [ spec
				loads: #('default');
				repository: 'https://github.com/kursjan/petitparser2' ].
]
