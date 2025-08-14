Extension { #name : 'FamixTImplementable' }

{ #category : '*Famix-CallGraph' }
FamixTImplementable >> possibleRuntimeTypes [

	self flag: #todo. "Manage implementations."
	self error.
	^ self subclassHierarchy
		  addFirst: self;
		  yourself
]
