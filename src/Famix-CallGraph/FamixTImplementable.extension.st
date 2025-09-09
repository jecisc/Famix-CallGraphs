Extension { #name : 'FamixTImplementable' }

{ #category : '*Famix-CallGraph' }
FamixTImplementable >> possibleRuntimeTypes [

	self flag: #todo. "Manage implementations."

	^ self subclassHierarchy
		  addFirst: self;
		  yourself
]
