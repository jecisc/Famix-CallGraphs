Class {
	#name : 'FamixCallGraphAdditionalPropertiesTest',
	#superclass : 'TestCase',
	#category : 'Famix-CallGraphs-Properties-Tests',
	#package : 'Famix-CallGraphs-Properties-Tests'
}

{ #category : 'accessing' }
FamixCallGraphAdditionalPropertiesTest class >> resources [

	^ { FamixJavaCHAExample1Resource }
]

{ #category : 'accessing' }
FamixCallGraphAdditionalPropertiesTest >> graph [

	^ FamixJavaCHAExample1Resource current graph
]

{ #category : 'running' }
FamixCallGraphAdditionalPropertiesTest >> performTest [

	FamixCallGraphAdditionalProperties newInstanceDuring: [ super performTest ]
]

{ #category : 'tests' }
FamixCallGraphAdditionalPropertiesTest >> testAdditionalProperties [

	| node |
	node := self graph entryPoint.
	self assert: node additionalProperties isNil.

	node additionalPropertiesNamed: #foo put: #bar.

	self assert: node additionalProperties isNotNil
]

{ #category : 'tests' }
FamixCallGraphAdditionalPropertiesTest >> testAdditionalPropertiesNamed [

	| node |
	node := self graph entryPoint.
	self should: [ node additionalPropertiesNamed: #foo ] raise: NotFound.

	node additionalPropertiesNamed: #foo2 put: #bar.

	self should: [ node additionalPropertiesNamed: #foo ] raise: NotFound.
	node additionalPropertiesNamed: #foo put: #bar.

	self assert: (node additionalPropertiesNamed: #foo) equals: #bar
]

{ #category : 'tests' }
FamixCallGraphAdditionalPropertiesTest >> testAdditionalPropertiesNamedIfAbsent [

	| node |
	node := self graph entryPoint.
	self assert: (node additionalPropertiesNamed: #foo ifAbsent: [ true ]).

	node additionalPropertiesNamed: #foo2 put: #bar.

	self assert: (node additionalPropertiesNamed: #foo ifAbsent: [ true ]).

	node additionalPropertiesNamed: #foo put: #bar.

	self assert: (node additionalPropertiesNamed: #foo ifAbsent: [ false ]) equals: #bar
]

{ #category : 'tests' }
FamixCallGraphAdditionalPropertiesTest >> testAdditionalPropertiesNamedIfPresent [

	| node |
	node := self graph entryPoint.
	self assert: (node additionalPropertiesNamed: #foo ifPresent: [ :value | value ]) isNil.

	node additionalPropertiesNamed: #foo2 put: #bar.

	self assert: (node additionalPropertiesNamed: #foo ifPresent: [ :value | value ]) isNil.

	node additionalPropertiesNamed: #foo put: #bar.

	self assert: (node additionalPropertiesNamed: #foo ifPresent: [ :value | value ]) equals: #bar
]

{ #category : 'tests' }
FamixCallGraphAdditionalPropertiesTest >> testAdditionalPropertiesNamedIfPresentIfAbsent [

	| node |
	node := self graph entryPoint.
	self assert: (node additionalPropertiesNamed: #foo ifPresent: [ :value | value ] ifAbsent: [ true ]).

	node additionalPropertiesNamed: #foo2 put: #bar.

	self assert: (node additionalPropertiesNamed: #foo ifPresent: [ :value | value ] ifAbsent: [ true ]).

	node additionalPropertiesNamed: #foo put: #bar.

	self assert: (node additionalPropertiesNamed: #foo ifPresent: [ :value | value ] ifAbsent: [ true ]) equals: #bar
]

{ #category : 'tests' }
FamixCallGraphAdditionalPropertiesTest >> testAdditionalPropertiesNamedPut [

	| node |
	node := self graph entryPoint.

	node additionalPropertiesNamed: #foo put: #bar.

	self assert: (node additionalPropertiesNamed: #foo) equals: #bar.

	node additionalPropertiesNamed: #foo put: #bar2.

	self assert: (node additionalPropertiesNamed: #foo) equals: #bar2
]

{ #category : 'tests' }
FamixCallGraphAdditionalPropertiesTest >> testResetAdditionalProperties [

	| node |
	node := self graph entryPoint.

	node additionalPropertiesNamed: #foo put: #bar.

	self assert: (node additionalPropertiesNamed: #foo) equals: #bar.

	FamixCallGraphAdditionalProperties resetAdditionalProperties.

	self should: [ node additionalPropertiesNamed: #foo ] raise: NotFound
]
