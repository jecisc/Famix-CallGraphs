Extension { #name : 'FamixTClass' }

{ #category : '*Famix-CallGraph' }
FamixTClass >> lookupMethodNamed: aString [

	self withSuperclassesDo: [ :class |
			class methods
				detect: [ :method | method name = aString ]
				ifFound: [ :method | ^ method ] ].
	^ nil
]

{ #category : '*Famix-CallGraph' }
FamixTClass >> possibleRuntimeTypes [

	^ self subclassHierarchy
		  addFirst: self;
		  yourself
]
