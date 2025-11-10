Extension { #name : 'FamixTType' }

{ #category : '*Famix-CallGraphs' }
FamixTType >> implementesMethodEquivalentTo: aMethod [

	^ (self methods select: #isMethodDefinition) anySatisfy: [ :method | method signature = aMethod signature ]
]

{ #category : '*Famix-CallGraphs' }
FamixTType >> possibleRuntimeTypes [

	^ self subclassResponsibility
]
