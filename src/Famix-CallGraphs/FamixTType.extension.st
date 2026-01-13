Extension { #name : 'FamixTType' }

{ #category : '*Famix-CallGraphs' }
FamixTType >> implementesMethodEquivalentTo: aMethod [

	(self methods select: #isMethodDefinition) do: [ :method | "Simplest and fastest case."
			method == aMethod ifTrue: [ ^ true ].

			(method isEquivalentTo: aMethod) ifTrue: [ ^ true ] ].

	^ false
]

{ #category : '*Famix-CallGraphs' }
FamixTType >> possibleRuntimeTypes [

	^ self subclassResponsibility
]
