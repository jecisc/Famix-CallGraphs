Extension { #name : 'FamixCallGraph' }

{ #category : '*Famix-CallGraphs-PathFinder' }
FamixCallGraph >> findAllPathFrom: aNode to: anotherNode [

	^ (FamixCallGraphPathFinder newOn: self) findAllPathFrom: aNode to: anotherNode
]

{ #category : '*Famix-CallGraphs-PathFinder' }
FamixCallGraph >> findAllPathFromNodeNamed: aNode toNodeNamed: anotherNode [

	^ (FamixCallGraphPathFinder newOn: self) findAllPathFromNodeNamed: aNode toNodeNamed: anotherNode
]

{ #category : '*Famix-CallGraphs-PathFinder' }
FamixCallGraph >> findPathFrom: aNode to: anotherNode [

	^ (FamixCallGraphPathFinder newOn: self) findPathFrom: aNode to: anotherNode
]

{ #category : '*Famix-CallGraphs-PathFinder' }
FamixCallGraph >> findPathFromNodeNamed: aNode toNodeNamed: anotherNode [

	^ (FamixCallGraphPathFinder newOn: self) findPathFromNodeNamed: aNode toNodeNamed: anotherNode
]

{ #category : '*Famix-CallGraphs-PathFinder' }
FamixCallGraph >> nodeNamed: aString [

	self allNodes
		detect: [ :node | node realMethod mooseName = aString ]
		ifFound: [ :node | ^ node ]
		ifNone: [ self error: 'No node named ' , aString , ' in the graph' ]
]
