Extension { #name : 'FamixTMethod' }

{ #category : '*Famix-CallGraphs' }
FamixTMethod >> asCallGraphNode [

	^ FamixCallGraphNode methodSignature: self signature kind: self parentType
]

{ #category : '*Famix-CallGraphs' }
FamixTMethod >> orederedParameters [

	^ self parameters sorted: [ :method | method sourceAnchor startPos ] ascending
]
