Class {
	#name : 'FamixCallGraphBridge',
	#superclass : 'GitBridge',
	#category : 'Famix-CallGraphs-Tests',
	#package : 'Famix-CallGraphs-Tests'
}

{ #category : 'accessing' }
FamixCallGraphBridge class >> resources [

	^ self root / 'resources'
]

{ #category : 'accessing' }
FamixCallGraphBridge class >> sources [

	^ self resources / 'sources'
]
