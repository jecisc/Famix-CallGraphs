Extension { #name : 'FamixTImplementable' }

{ #category : '*Famix-CallGraph' }
FamixTImplementable >> possibleRuntimeTypes [

	| result |
	result := self subclassHierarchy.
	result addFirst: self.
	result copy do: [ :interface | interface implementors do: [ :class | result addAll: class possibleRuntimeTypes ] ].
	^ result
]
