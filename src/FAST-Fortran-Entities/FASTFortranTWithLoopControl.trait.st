"
I represent a loop control: initialization/limit/increment
"
Trait {
	#name : #FASTFortranTWithLoopControl,
	#instVars : [
		'#loopControl => FMOne type: #FASTFortranLoopControlExpression opposite: #parentLoop'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTWithLoopControl classSide >> annotation [

	<FMClass: #TWithLoopControl super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTWithLoopControl >> loopControl [
	"Relation named: #loopControl type: #FASTFortranLoopControlExpression opposite: #parentLoop"

	<generated>
	<FMComment: 'loop control'>
	^ loopControl
]

{ #category : #accessing }
FASTFortranTWithLoopControl >> loopControl: anObject [

	<generated>
	loopControl := anObject
]

{ #category : #navigation }
FASTFortranTWithLoopControl >> loopControlGroup [
	<generated>
	<navigation: 'LoopControl'>
	^ MooseSpecializedGroup with: self loopControl
]
