Extension { #name : 'FamixTMethod' }

{ #category : '*Famix-CallGraph' }
FamixTMethod >> asCallGraphNode [

	^ FamixCallGraphNode methodSignature: self signature kind: self parentType
]
