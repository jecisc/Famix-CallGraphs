"
I am a class used to build a CHA call graph for a Moose java model.

To be used you need to define entry points for your application lake this:

```st
	(FamixJavaCHABuilder entryPoints: (model allMethods select: [ :method | method name = 'main' ])) build
```
"
Class {
	#name : 'FamixJavaCHABuilder',
	#superclass : 'FamixAbstractCallGraphBuilder',
	#instVars : [
		'visited',
		'worklist'
	],
	#category : 'Famix-CallGraph',
	#package : 'Famix-CallGraph'
}

{ #category : 'building' }
FamixJavaCHABuilder >> addEdgesTo: aNode for: invocation types: possibleRuntimeTypes [

	| nodes |
	nodes := possibleRuntimeTypes
		         select: [ :type | type implementesMethodEquivalentTo: invocation invokedEntity ]
		         thenCollect: [ :type | self nodeForMethodSignature: invocation invokedEntity signature kind: type ].
	nodes ifEmpty: [ self error: 'We should not get here?' ] ifNotEmpty: [ nodes do: [ :node | aNode addCallee: node ] ]
]

{ #category : 'building' }
FamixJavaCHABuilder >> build [

	worklist addAll: self entryPoints.

	[ worklist isEmpty ] whileFalse: [
			self computeCallGraphOf: worklist first.
			visited add: worklist removeFirst ].

	^ graph
]

{ #category : 'building' }
FamixJavaCHABuilder >> computeCallGraphOf: aNode [

	aNode outgoingInvocations do: [ :invocation |
			(invocation isSuperInvocation or: [ invocation invokedEntity isConstructor ])
				ifTrue: [ self addEdgesTo: aNode for: invocation types: { invocation invokedEntity parentType } ]
				ifFalse: [ self addEdgesTo: aNode for: invocation types: invocation invokedEntity parentType possibleRuntimeTypes ] ].

	visited add: aNode
]

{ #category : 'initialization' }
FamixJavaCHABuilder >> initialize [

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
FamixJavaCHABuilder >> nodeForMethodSignature: aString kind: kind [

	| node |
	visited
		detect: [ :aNode | aNode methodSignature = aString and: [ aNode kind = kind ] ]
		ifFound: [ :aNode | ^ aNode ].
	worklist
		detect: [ :aNode | aNode methodSignature = aString and: [ aNode kind = kind ] ]
		ifFound: [ :aNode | ^ aNode ].

	node := FamixCallGraphNode methodSignature: aString kind: kind.

	worklist add: node.

	^ node
]
