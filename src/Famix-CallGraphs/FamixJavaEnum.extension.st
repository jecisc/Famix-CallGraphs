Extension { #name : 'FamixJavaEnum' }

{ #category : '*Famix-CallGraphs' }
FamixJavaEnum >> possibleRuntimeTypes [

	^ self subclassHierarchy
		  addFirst: self;
		  yourself
]
