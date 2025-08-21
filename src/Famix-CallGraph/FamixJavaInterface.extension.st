Extension { #name : 'FamixJavaInterface' }

{ #category : '*Famix-CallGraph' }
FamixJavaInterface >> lookupMethodNamed: aString [

	self withSuperclassesDo: [ :class |
			class methods
				detect: [ :method | method name = aString ]
				ifFound: [ :method | ^ method ] ].

	self allImplementedInterfacesDo: [ :interface |
			interface methods
				detect: [ :method | method name = aString ]
				ifFound: [ :method | ^ method ] ].

	^ nil
]
