Class {
	#name : 'FamixCallGraphNode',
	#superclass : 'Object',
	#instVars : [
		'methodName',
		'kind',
		'realMethod',
		'callers',
		'callees'
	],
	#category : 'Famix-CallGraph',
	#package : 'Famix-CallGraph'
}

{ #category : 'as yet unclassified' }
FamixCallGraphNode class >> methodName: aString kind: aFamixType [

	^ self new
		  methodName: aString;
		  kind: aFamixType;
		  yourself
]

{ #category : 'comparing' }
FamixCallGraphNode >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ kind = anObject kind and: [ methodName = anObject methodName ]
]

{ #category : 'adding' }
FamixCallGraphNode >> addCallee: aNode [

	callees add: aNode.
	aNode addCaller: self
]

{ #category : 'adding' }
FamixCallGraphNode >> addCaller: aNode [

	callers add: aNode
]

{ #category : 'accessing' }
FamixCallGraphNode >> allNodesMatching: aBlock [
	1halt.
]

{ #category : 'accessing' }
FamixCallGraphNode >> callees [
	^ callees
]

{ #category : 'accessing' }
FamixCallGraphNode >> firstNodeMatching: aBlock [

	^ self firstNodeMatching: aBlock visited: Set new
]

{ #category : 'accessing' }
FamixCallGraphNode >> firstNodeMatching: aBlock visited: aCollection [

	(aCollection includes: self) ifFalse: [
			(aBlock value: self) ifTrue: [ ^ self ].
			aCollection add: self ].

	self callees do: [ :aNode | (aNode firstNodeMatching: aBlock) ifNotNil: [ :result | ^ result ] ].

	^ nil
]

{ #category : 'comparing' }
FamixCallGraphNode >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ kind hash bitXor: methodName hash
]

{ #category : 'initialization' }
FamixCallGraphNode >> initialize [

	super initialize.
	callers := OrderedCollection new.
	callees := OrderedCollection new
]

{ #category : 'accessing' }
FamixCallGraphNode >> kind [

	^ kind
]

{ #category : 'accessing' }
FamixCallGraphNode >> kind: anObject [

	kind := anObject
]

{ #category : 'accessing' }
FamixCallGraphNode >> methodName [

	^ methodName
]

{ #category : 'accessing' }
FamixCallGraphNode >> methodName: anObject [

	methodName := anObject
]

{ #category : 'accessing' }
FamixCallGraphNode >> outgoingInvocations [

	^ self realMethod outgoingInvocations
]

{ #category : 'printing' }
FamixCallGraphNode >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' (';
		nextPutAll: kind name;
		nextPutAll: '>>';
		nextPutAll: methodName;
		nextPutAll: ')'
]

{ #category : 'accessing' }
FamixCallGraphNode >> realMethod [

	self flag: #todo. "Add multiple tests on this. With subclasses and interfaces and all."
	^ realMethod ifNil: [ realMethod := (kind lookupMethodNamed: methodName) ifNil: [ 1 halt ] ]
]

{ #category : 'accessing' }
FamixCallGraphNode >> realMethod: anObject [

	realMethod := anObject
]
