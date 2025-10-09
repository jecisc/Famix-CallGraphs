Extension { #name : 'FamixJavaEnum' }

{ #category : '*Famix-CallGraph' }
FamixJavaEnum >> possibleRuntimeTypes [

	^ self subclassHierarchy
		  addFirst: self;
		  yourself
]
