Extension { #name : 'FamixTWithInheritances' }

{ #category : '*Famix-CallGraphs' }
FamixTWithInheritances >> applicableConcretizations [

	| concretizations |
	concretizations := Set new.
	self withSuperclassesDo: [ :class |
			class superInheritances
				select: [ :inheritance | inheritance isParametricAssociation ]
				thenDo: [ :inheritance | concretizations addAll: inheritance concretizations ] ].
	^ concretizations
]
