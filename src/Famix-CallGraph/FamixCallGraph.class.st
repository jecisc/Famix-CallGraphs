Class {
	#name : 'FamixCallGraph',
	#superclass : 'Object',
	#instVars : [
		'entryPoints'
	],
	#category : 'Famix-CallGraph',
	#package : 'Famix-CallGraph'
}

{ #category : 'helpers' }
FamixCallGraph >> allNodes [

	^ self entryPoints flatCollectAsSet: #withAllCallees
]

{ #category : 'accessing' }
FamixCallGraph >> entryPoint [

	self entryPoints size = 1 ifFalse: [ self error: 'This method should be called only if the graph has 1 entry point.' ].
	^ self entryPoints anyOne
]

{ #category : 'accessing' }
FamixCallGraph >> entryPoints [

	^ entryPoints
]

{ #category : 'accessing' }
FamixCallGraph >> entryPoints: aCollection [

	entryPoints := aCollection collect: [ :method |
			               method isMooseObject
				               ifTrue: [ method asCallGraphNode ]
				               ifFalse: [ method ] ]
]

{ #category : 'helpers' }
FamixCallGraph >> numberOfNodes [

	^ self allNodes size
]
