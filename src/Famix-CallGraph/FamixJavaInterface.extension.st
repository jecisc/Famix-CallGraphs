Extension { #name : 'FamixJavaInterface' }

{ #category : '*Famix-CallGraph' }
FamixJavaInterface >> lookupMethodWithSignature: aString [

	self withSuperclassesDo: [ :class |
			class methods
				detect: [ :method | method signature = aString ]
				ifFound: [ :method | ^ method ] ].

	self withSuperclassesDo: [ :class |
			class allImplementedInterfacesDo: [ :interface |
					interface methods
						detect: [ :method | method signature = aString ]
						ifFound: [ :method | ^ method ] ] ].

	^ nil
]
