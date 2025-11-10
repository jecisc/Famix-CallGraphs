Extension { #name : 'FamixTClass' }

{ #category : '*Famix-CallGraphs' }
FamixTClass >> possibleRuntimeTypes [

	^ self subclassHierarchy
		  addFirst: self;
		  yourself
]
