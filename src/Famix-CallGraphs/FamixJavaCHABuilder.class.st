"
I am a class used to build a CHA call graph for a Moose java model.

To be used you need to define entry points for your application lake this:

```st
	(FamixJavaCHABuilder entryPoints: (model allMethods select: [ :method | method name = 'main' ])) build
```

In case the program to analyze is using reflectivity, we might miss some edges. If the user knows some edges to add, it is possible to add them using the #reflectiveHook variable. 
For example:

```st
	(FamixJavaCHABuilder entryPoints: (model allMethods select: [ :method | method name = 'main' ]))
	reflectiveHook: [ :node :builder |
			(node kindName = 'Toto' and: [ node methodName = 'myMethod' ]) ifTrue: [
					node addCallee: (builder nodeForMethodSignature: 'myOtherMethod(String)' kind: (model allClasses detect: [ :class | class name = 'Titi' ]) stub: false) ] ];
	build
```
"
Class {
	#name : 'FamixJavaCHABuilder',
	#superclass : 'FamixAbstractCallGraphBuilder',
	#instVars : [
		'visited',
		'worklist',
		'reflectiveHook'
	],
	#category : 'Famix-CallGraphs',
	#package : 'Famix-CallGraphs'
}

{ #category : 'building' }
FamixJavaCHABuilder >> addEdgesTo: aNode for: invocation types: possibleRuntimeTypes [

	| nodes |
	nodes := possibleRuntimeTypes
		         select: [ :type | type implementesMethodEquivalentTo: invocation invokedEntity ]
		         thenCollect: [ :type | self nodeForMethodSignature: invocation invokedEntity signature kind: type stub: false ].
	nodes
		ifEmpty: [
				invocation invokedEntity isStub
					ifTrue: [ 
						"In case we have an invocation to a stub method of an interface with no known implementation, we create a stub node"
						aNode addCallee: (self nodeForMethodSignature: invocation invokedEntity signature kind: invocation invokedEntity parentType stub: true) ]
					ifFalse: [ self error: 'We should not get here?' ] ]
		ifNotEmpty: [ nodes do: [ :node | aNode addCallee: node ] ]
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
			
	"We allow the user to define a block to add edges if reflection is involved and the user knows what to call"
	self reflectiveHook cull: aNode cull: self.

	visited add: aNode
]

{ #category : 'initialization' }
FamixJavaCHABuilder >> initialize [

	self flag: #todo. "Manage graph exploration:
	- Is there a path between two methods?
	- What are all the paths between two methods?
	- Is a not reacheable?"
	super initialize.
	worklist := OrderedCollection new.
	visited := Set new
]

{ #category : 'building' }
FamixJavaCHABuilder >> nodeForMethodSignature: aString kind: kind stub: aBoolean [

	| node |
	visited
		detect: [ :aNode | aNode methodSignature = aString and: [ aNode kind = kind ] ]
		ifFound: [ :aNode | ^ aNode ].
	worklist
		detect: [ :aNode | aNode methodSignature = aString and: [ aNode kind = kind ] ]
		ifFound: [ :aNode | ^ aNode ].

	node := (aBoolean
		         ifTrue: [ FamixCallGraphStubNode ]
		         ifFalse: [ FamixCallGraphNode ]) methodSignature: aString kind: kind.

	aBoolean ifFalse: [ worklist add: node ].

	^ node
]

{ #category : 'accessing' }
FamixJavaCHABuilder >> reflectiveHook [

	^ reflectiveHook ifNil: [ reflectiveHook := [ :node :builder | "Do nothing" ] ]
]

{ #category : 'accessing' }
FamixJavaCHABuilder >> reflectiveHook: anObject [

	reflectiveHook := anObject
]
