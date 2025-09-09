Class {
	#name : 'FamixJavaClassHierarchyAnalysisCallGraphBuilder',
	#superclass : 'FamixAbstractClassHierarchyAnalysisCallGraphBuilder',
	#instVars : [
		'visited',
		'worklist'
	],
	#category : 'Famix-CallGraph',
	#package : 'Famix-CallGraph'
}

{ #category : 'building' }
FamixJavaClassHierarchyAnalysisCallGraphBuilder >> addEdgesTo: aNode for: invocation types: possibleRuntimeTypes [

	| nodes |
	nodes := possibleRuntimeTypes
		         select: [ :type | type methods anySatisfy: [ :method | method signature = invocation invokedEntity signature ] ]
		         thenCollect: [ :type | self nodeForMethodNamed: invocation invokedEntity name kind: type ].
	nodes ifEmpty: [ self error: 'We should not get here?' ] ifNotEmpty: [ nodes do: [ :node | aNode addCallee: node ] ]
]

{ #category : 'building' }
FamixJavaClassHierarchyAnalysisCallGraphBuilder >> build [

	worklist addAll: self entryPoints.

	[ worklist isEmpty ] whileFalse: [
			self computeCallGraphOf: worklist first.
			visited add: worklist removeFirst ].

	^ self entryPoints
]

{ #category : 'building' }
FamixJavaClassHierarchyAnalysisCallGraphBuilder >> computeCallGraphOf: aNode [

	aNode outgoingInvocations do: [ :invocation |
			invocation receiver
				ifNil: [
						invocation invokedEntity isConstructor
							ifTrue: [ self addEdgesTo: aNode for: invocation types: { invocation invokedEntity parentType } ]
							ifFalse: [
									1 halt.
									self flag: #todo "Check what to do" ] ]
				ifNotNil: [ self addEdgesTo: aNode for: invocation types: invocation invokedEntity parentType possibleRuntimeTypes ] ].

	visited add: aNode
]

{ #category : 'initialization' }
FamixJavaClassHierarchyAnalysisCallGraphBuilder >> initialize [

	self flag: #todo. "Method of same name but different signatures	"
	self flag: #todo. "Manage graph reduction."
	self flag: #todo. "Manage graph exploration:
	- Is there a path between two methods?
	- What are all the paths between two methods?
	- Is a not reacheable?"
	super initialize.
	worklist := OrderedCollection new.
	visited := Set new
]

{ #category : 'building' }
FamixJavaClassHierarchyAnalysisCallGraphBuilder >> nodeForMethodNamed: aString kind: kind [

	| node |
	visited
		detect: [ :aNode | aNode methodName = aString and: [ aNode kind = kind ] ]
		ifFound: [ :aNode | ^ aNode ].
	worklist
		detect: [ :aNode | aNode methodName = aString and: [ aNode kind = kind ] ]
		ifFound: [ :aNode | ^ aNode ].

	node := FamixCallGraphNode methodName: aString kind: kind.

	worklist add: node.

	^ node
]
