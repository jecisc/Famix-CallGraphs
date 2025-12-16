Extension { #name : 'FamixJavaClass' }

{ #category : '*Famix-CallGraphs' }
FamixJavaClass >> applicableConcretizations [

	| concretizations |
	concretizations := Set new.
	self withSuperclassesDo: [ :class |
			class superInheritances
				select: [ :inheritance | inheritance isParametricAssociation ]
				thenDo: [ :inheritance | concretizations addAll: inheritance concretizations ] ].
	^ concretizations
]

{ #category : '*Famix-CallGraphs' }
FamixJavaClass >> lookupMethodWithSignature: aString [

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
