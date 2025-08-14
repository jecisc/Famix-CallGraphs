Class {
	#name : 'FamixCallGraphBridge',
	#superclass : 'GitBridge',
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'accessing' }
FamixCallGraphBridge class >> resources [

	^ self root / 'resources'
]

{ #category : 'accessing' }
FamixCallGraphBridge class >> sources [

	^ self resources / 'sources'
]
