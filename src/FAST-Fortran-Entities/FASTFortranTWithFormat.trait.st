"
I represent a statement with a format (format, print)

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
| `format` | `FASTFortranTWithFormat` | `parentFormatedStatement` | `FASTFortranTFormat` | The description of the format|



"
Trait {
	#name : #FASTFortranTWithFormat,
	#instVars : [
		'#format => FMOne type: #FASTFortranTFormat opposite: #parentFormatedStatement'
	],
	#category : #'FAST-Fortran-Entities-Traits'
}

{ #category : #meta }
FASTFortranTWithFormat classSide >> annotation [

	<FMClass: #TWithFormat super: #Object>
	<package: #'FAST-Fortran-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTFortranTWithFormat >> format [
	"Relation named: #format type: #FASTFortranTFormat opposite: #parentFormatedStatement"

	<generated>
	<FMComment: 'The description of the format'>
	^ format
]

{ #category : #accessing }
FASTFortranTWithFormat >> format: anObject [

	<generated>
	format := anObject
]

{ #category : #navigation }
FASTFortranTWithFormat >> formatGroup [
	<generated>
	<navigation: 'Format'>
	^ MooseSpecializedGroup with: self format
]
