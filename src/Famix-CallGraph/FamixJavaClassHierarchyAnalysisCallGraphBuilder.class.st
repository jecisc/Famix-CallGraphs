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
											self flag: #todo. "Constructor."
											self flag: #todo. "Check if it already exists."
											aNode
												addCallee: (FamixCallGraphNode new
														 methodName: invocation invokedEntity name;
														 kind: type;
														 yourself)
												for: invocation ] ] ] ]
]

{ #category : 'initialization' }
FamixJavaClassHierarchyAnalysisCallGraphBuilder >> initialize [

	super initialize.
	worklist := OrderedCollection new.
	visited := Set new
]
