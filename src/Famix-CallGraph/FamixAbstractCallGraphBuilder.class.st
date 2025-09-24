"
TODO: Check the browsers removed from Moose security: https://github.com/moosetechnology/Moose-Security/commit/9a4aaa2dade1789e01ce4c145e64ff06295ffa43
"
Class {
	#name : 'FamixAbstractCallGraphBuilder',
	#superclass : 'Object',
	#instVars : [
		'graph'
	],
	#category : 'Famix-CallGraph',
	#package : 'Famix-CallGraph'
}

{ #category : 'accessing' }
FamixAbstractCallGraphBuilder class >> entryPoint: aMethod [

	^ self entryPoints: { aMethod }
]

{ #category : 'accessing' }
FamixAbstractCallGraphBuilder class >> entryPoints: aCollection [

	^ self new
		  entryPoints: aCollection;
		  yourself
]

{ #category : 'building' }
FamixAbstractCallGraphBuilder >> build [

	self subclassResponsibility
]

{ #category : 'accessing' }
FamixAbstractCallGraphBuilder >> entryPoints [

	^ graph entryPoints
]

{ #category : 'accessing' }
FamixAbstractCallGraphBuilder >> entryPoints: aCollection [

	^ graph entryPoints: aCollection
]

{ #category : 'accessing' }
FamixAbstractCallGraphBuilder >> graph [

	^ graph
]

{ #category : 'accessing' }
FamixAbstractCallGraphBuilder >> graph: anObject [

	graph := anObject
]

{ #category : 'initialization' }
FamixAbstractCallGraphBuilder >> initialize [

	super initialize.
	graph := FamixCallGraph new
]
