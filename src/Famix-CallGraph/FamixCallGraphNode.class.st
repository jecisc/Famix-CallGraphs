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
FamixCallGraphNode >> addCallee: aNode for: anInvocation [

	(callees at: anInvocation ifAbsentPut: [ OrderedCollection new ]) add: aNode.
	aNode addCaller: self
]

{ #category : 'adding' }
FamixCallGraphNode >> addCaller: aNode [

	callers add: aNode
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
	callees := IdentityDictionary new
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

	^ realMethod ifNil: [ 1 halt "todo." ]
]

{ #category : 'accessing' }
FamixCallGraphNode >> realMethod: anObject [

	realMethod := anObject
]
