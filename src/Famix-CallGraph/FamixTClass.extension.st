Extension { #name : 'FamixTClass' }

{ #category : '*Famix-CallGraph' }
FamixTClass >> possibleRuntimeTypes [

	^ self subclassHierarchy
		  addFirst: self;
		  yourself
]
