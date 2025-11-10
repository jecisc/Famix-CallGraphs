Extension { #name : 'FamixTMethod' }

{ #category : '*Famix-CallGraphs' }
FamixTMethod >> asCallGraphNode [

	^ FamixCallGraphNode methodSignature: self signature kind: self parentType
]
