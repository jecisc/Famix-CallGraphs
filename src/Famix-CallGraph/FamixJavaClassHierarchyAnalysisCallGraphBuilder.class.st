Class {
	#name : 'FamixJavaClassHierarchyAnalysisCallGraphBuilder',
	#superclass : 'FamixAbstractClassHierarchyAnalysisCallGraphBuilder',
	#instVars : [
		'callGraph',
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

	^ callGraph
]

{ #category : 'building' }
FamixJavaClassHierarchyAnalysisCallGraphBuilder >> computeCallGraphOf: aNode [

	aNode outgoingInvocations do: [ :invocation |
			invocation receiver
				ifNil: [ self flag: #todo "Check what to do" ]
				ifNotNil: [
						invocation receiver isStub
							ifTrue: [ self flag: #todo "What to do?" ]
							ifFalse: [ invocation receiver declaredType possibleRuntimeTypes do: [ :type | type halt ] ] ] ]
]

{ #category : 'initialization' }
FamixJavaClassHierarchyAnalysisCallGraphBuilder >> initialize [

	super initialize.
	callGraph := IdentityDictionary new.
	worklist := OrderedCollection new.
	visited := Set new
]
