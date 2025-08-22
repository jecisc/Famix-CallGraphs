Extension { #name : 'FamixJavaClass' }

{ #category : '*Famix-CallGraph' }
FamixJavaClass >> lookupMethodNamed: aString [

	self withSuperclassesDo: [ :class |
			class methods
				detect: [ :method | method name = aString ]
				ifFound: [ :method | ^ method ] ].

	self withSuperclassesDo: [ :class |
			class allImplementedInterfacesDo: [ :interface |
					interface methods
						detect: [ :method | method name = aString ]
						ifFound: [ :method | ^ method ] ] ].

	^ nil
]
