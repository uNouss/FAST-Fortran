Class {
	#name : #FASTFortranModelComparator,
	#superclass : #FamixModelComparator,
	#category : #'FAST-Fortran-Visitors-Tools'
}

{ #category : #comparison }
FASTFortranModelComparator >> ast: node1 acceptableDifferenceTo: node2 property: property [
	"returns nil if the difference is not acceptable
	 otherwise, must return  a block testing where the comparison process might resume"

	"if the difference does not reflects in the re-exported expression and is due to precedence of: binary operators
	 then we can most probably ignore it
	 It is assumed that an AST node has only one parent"
	((property implementingSelector = #operator) and:
	[ (self reExportAST: node1 parents anyOne) = (self reExportAST: node2 parents anyOne) ])
	ifTrue: [ "resume from the parent node"
			^[:a :b | a = node1 parents anyOne ]].
	
	^nil
]

{ #category : #utilities }
FASTFortranModelComparator >> reExportAST: ast [
	^(ast accept: FASTFortranExporterVisitor new) outputStream contents
]
