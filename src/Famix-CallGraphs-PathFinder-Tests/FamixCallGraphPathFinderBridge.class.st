Class {
	#name : 'FamixCallGraphPathFinderBridge',
	#superclass : 'GitBridge',
	#category : 'Famix-CallGraphs-PathFinder-Tests-Resources',
	#package : 'Famix-CallGraphs-PathFinder-Tests',
	#tag : 'Resources'
}

{ #category : 'accessing' }
FamixCallGraphPathFinderBridge class >> resources [

	^ self root / 'resources'
]

{ #category : 'accessing' }
FamixCallGraphPathFinderBridge class >> sources [

	^ self resources / 'sources' 
]
