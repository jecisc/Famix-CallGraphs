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
				ifNil: [ self flag: #todo "Check what to do" ]
				ifNotNil: [
						invocation receiver isStub
							ifTrue: [ self flag: #todo "What to do?" ]
							ifFalse: [
									invocation receiver declaredType possibleRuntimeTypes do: [ :type |
										aNode addCallee: (self nodeForMethodNamed: invocation invokedEntity name kind: type) for: invocation ] ] ] ].

	visited add: aNode
]

{ #category : 'initialization' }
FamixJavaClassHierarchyAnalysisCallGraphBuilder >> initialize [

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

	node := FamixCallGraphNode new
		        methodName: aString;
		        kind: kind;
		        yourself.
	
	worklist add: node.

	^ node
]
