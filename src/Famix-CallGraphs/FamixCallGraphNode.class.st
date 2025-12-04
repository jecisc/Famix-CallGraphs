Class {
	#name : 'FamixCallGraphNode',
	#superclass : 'FamixAbstractCallGraphNode',
	#instVars : [
		'callees'
	],
	#category : 'Famix-CallGraphs',
	#package : 'Famix-CallGraphs'
}

{ #category : 'adding' }
FamixCallGraphNode >> addCallee: aNode [

	callees add: aNode.
	aNode addCaller: self
]

{ #category : 'accessing' }
FamixCallGraphNode >> callees [
	^ callees
]

{ #category : 'initialization' }
FamixCallGraphNode >> initialize [

	super initialize.
	callees := OrderedCollection new
]

{ #category : 'testing' }
FamixCallGraphNode >> isStub [

	^ self realMethod isStub
]

{ #category : 'accessing' }
FamixCallGraphNode >> outgoingInvocations [

	^ self realMethod outgoingInvocations
]
