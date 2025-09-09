Extension { #name : 'FamixTMethod' }

{ #category : '*Famix-CallGraph' }
FamixTMethod >> asCallGraphNode [

	^ FamixCallGraphNode methodName: self name kind: self parentType
]
