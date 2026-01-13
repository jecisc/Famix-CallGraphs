Class {
	#name : 'FamixCallGraphStubNode',
	#superclass : 'FamixAbstractCallGraphNode',
	#category : 'Famix-CallGraphs',
	#package : 'Famix-CallGraphs'
}

{ #category : 'comparing' }
FamixCallGraphStubNode >> = anObject [
	"Answer whether the receiver and the argument represent the same
	object. If = is redefined in any subclass, consider also redefining the
	message hash."

	^ self == anObject
]

{ #category : 'accessing' }
FamixCallGraphStubNode >> callees [
	"We cannot know."

	^ #(  )
]

{ #category : 'comparing' }
FamixCallGraphStubNode >> hash [
	"Answer a SmallInteger whose value is related to the receiver's identity.
	May be overridden, and should be overridden in any classes that define = "

	^ self identityHash
]

{ #category : 'testing' }
FamixCallGraphStubNode >> isStub [

	^ true
]

{ #category : 'testing' }
FamixCallGraphStubNode >> isStubNode [

	^ true
]
