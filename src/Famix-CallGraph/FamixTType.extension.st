Extension { #name : 'FamixTType' }

{ #category : '*Famix-CallGraph' }
FamixTType >> implementesMethodEquivalentTo: aMethod [

	^ (self methods select: #isMethodDefinition) anySatisfy: [ :method | method signature = aMethod signature ]
]

{ #category : '*Famix-CallGraph' }
FamixTType >> possibleRuntimeTypes [

	^ self subclassResponsibility
]
