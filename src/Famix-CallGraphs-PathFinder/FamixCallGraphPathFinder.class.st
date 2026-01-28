"
Offer a simple API for finding path between to node of a graph, using a Breadth-First Search algorithm

How to initialize :
```smalltalk
FamixCallGraphPathFinder newOn: aGraph
```

Main API :
```smalltalk
""try finding a path between two node""
finder findPathFrom: startNode to: targetNode.

""Search for all paths between two node (with a colloration algorithm)""
finder findAllPathFrom: startNode to: targetNode.

""Search for a path between two node given the full qualified name of their method""
finder findPathFromNodeNamed: startNodeName toNodeNamed: targetNodeName.

""Search for all paths between two node given the full qualified name of their method""
finder findAllPathFromNodeNamed: startNodeName toNodeNamed: targetNodeName
```
"
Class {
	#name : 'FamixCallGraphPathFinder',
	#superclass : 'Object',
	#instVars : [
		'graph'
	],
	#category : 'Famix-CallGraphs-PathFinder',
	#package : 'Famix-CallGraphs-PathFinder'
}

{ #category : 'instance creation' }
FamixCallGraphPathFinder class >> newOn: aGraph [

	^ self new
		  graph: aGraph;
		  yourself
]

{ #category : 'accessing' }
FamixCallGraphPathFinder >> checkValidityOf: startNode and: targetNode [

	(self graph allNodes includes: startNode) ifFalse: [ self error: 'Entrypoint node is not in the graph' ].
	(self graph allNodes includes: targetNode) ifFalse: [ self error: 'Endpoint node is not in the graph' ]
]

{ #category : 'accessing' }
FamixCallGraphPathFinder >> findAllPathFrom: startNode to: targetNode [

	self checkValidityOf: startNode and: targetNode.

	^ self unsafeFindAllPathFrom: startNode to: targetNode
]

{ #category : 'accessing' }
FamixCallGraphPathFinder >> findAllPathFromNodeNamed: startNodeName toNodeNamed: targetNodeName [

	| startNode targetNode |
	startNode := self graph nodeNamed: startNodeName.
	targetNode := self graph nodeNamed: targetNodeName.

	^ self findAllPathFrom: startNode to: targetNode
]

{ #category : 'accessing' }
FamixCallGraphPathFinder >> findPathFrom: startNode to: targetNode [

	self checkValidityOf: startNode and: targetNode.

	^ self unsafeFindPathFrom: startNode to: targetNode
]

{ #category : 'accessing' }
FamixCallGraphPathFinder >> findPathFromNodeNamed: startNodeName toNodeNamed: targetNodeName [

	| startNode targetNode |
	startNode := self graph nodeNamed: startNodeName.
	targetNode := self graph nodeNamed: targetNodeName.

	^ self findPathFrom: startNode to: targetNode
]

{ #category : 'accessing' }
FamixCallGraphPathFinder >> graph [

	^ graph
]

{ #category : 'accessing' }
FamixCallGraphPathFinder >> graph: aGraph [

	graph := aGraph
]

{ #category : 'as yet unclassified' }
FamixCallGraphPathFinder >> reconstructPath: cameFrom target: targetNode [
	"Trace the chain of parents back from the target to the starting point."

	| path current |
	path := OrderedCollection new.
	current := targetNode.

	[ current isNil ] whileFalse: [
			path addFirst: current.
			current := cameFrom at: current ].

	^ path
]

{ #category : 'accessing' }
FamixCallGraphPathFinder >> unsafeFindAllPathFrom: startNode to: targetNode [
	"Use a Breadth-First Search to find ALL simple paths between nodes without loops.
	 WARNING: This has exponential complexity. Do not run on dense graphs."

	| queue currentPath lastNode foundPaths |
	foundPaths := OrderedCollection new.

	"The queue contains all differents paths"
	queue := OrderedCollection with: (OrderedCollection with: startNode).

	[ queue isNotEmpty ] whileTrue: [
			currentPath := queue removeFirst.
			lastNode := currentPath last.

			lastNode = targetNode
				ifTrue: [ "We have a complete path, so we stop here" foundPaths add: currentPath ]
				ifFalse: [ "If the last nodes isn't attained, then continuer the research"
						lastNode callees do: [ :callee | "CRITICAL : We check for already studied nodes only in the current path"
								(currentPath includes: callee) ifFalse: [ "New path = Current path + Neighbor"
									queue add: (currentPath copyWith: callee) ] ] ] ].

	^ foundPaths
]

{ #category : 'accessing' }
FamixCallGraphPathFinder >> unsafeFindPathFrom: startNode to: targetNode [
	"Use a Breadth-First Search to find a path from the two given nodes"

	| queue cameFrom current |
	"Intialize queue, and precedences colloration"
	queue := OrderedCollection with: startNode.
	cameFrom := Dictionary new.
	cameFrom at: startNode put: nil.

	[ queue isNotEmpty ] whileTrue: [
			current := queue removeFirst.

			"If the target node is found then return the path taken"
			current = targetNode ifTrue: [ ^ self reconstructPath: cameFrom target: targetNode ].

			"Check on neighbors"
			current callees do: [ :callee | "If already studied, then do not study it again"
					(cameFrom includesKey: callee) ifFalse: [
							cameFrom at: callee put: current.
							queue add: callee ] ] ].

	^ nil "No path found"
]
