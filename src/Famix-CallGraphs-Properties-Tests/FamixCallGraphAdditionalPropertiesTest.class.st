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

	node additionalPropertyNamed: #foo put: #bar.

	self assert: node additionalProperties isNotNil
]

{ #category : 'tests' }
FamixCallGraphAdditionalPropertiesTest >> testAdditionalPropertyNamed [

	| node |
	node := self graph entryPoint.
	self should: [ node additionalPropertyNamed: #foo ] raise: NotFound.

	node additionalPropertyNamed: #foo2 put: #bar.

	self should: [ node additionalPropertyNamed: #foo ] raise: NotFound.
	node additionalPropertyNamed: #foo put: #bar.

	self assert: (node additionalPropertyNamed: #foo) equals: #bar
]

{ #category : 'tests' }
FamixCallGraphAdditionalPropertiesTest >> testAdditionalPropertyNamedIfAbsent [

	| node |
	node := self graph entryPoint.
	self assert: (node additionalPropertyNamed: #foo ifAbsent: [ true ]).

	node additionalPropertyNamed: #foo2 put: #bar.

	self assert: (node additionalPropertyNamed: #foo ifAbsent: [ true ]).

	node additionalPropertyNamed: #foo put: #bar.

	self assert: (node additionalPropertyNamed: #foo ifAbsent: [ false ]) equals: #bar
]

{ #category : 'tests' }
FamixCallGraphAdditionalPropertiesTest >> testAdditionalPropertyNamedIfPresent [

	| node |
	node := self graph entryPoint.
	self assert: (node additionalPropertyNamed: #foo ifPresent: [ :value | value ]) isNil.

	node additionalPropertyNamed: #foo2 put: #bar.

	self assert: (node additionalPropertyNamed: #foo ifPresent: [ :value | value ]) isNil.

	node additionalPropertyNamed: #foo put: #bar.

	self assert: (node additionalPropertyNamed: #foo ifPresent: [ :value | value ]) equals: #bar
]

{ #category : 'tests' }
FamixCallGraphAdditionalPropertiesTest >> testAdditionalPropertyNamedIfPresentIfAbsent [

	| node |
	node := self graph entryPoint.
	self assert: (node additionalPropertyNamed: #foo ifPresent: [ :value | value ] ifAbsent: [ true ]).

	node additionalPropertyNamed: #foo2 put: #bar.

	self assert: (node additionalPropertyNamed: #foo ifPresent: [ :value | value ] ifAbsent: [ true ]).

	node additionalPropertyNamed: #foo put: #bar.

	self assert: (node additionalPropertyNamed: #foo ifPresent: [ :value | value ] ifAbsent: [ true ]) equals: #bar
]

{ #category : 'tests' }
FamixCallGraphAdditionalPropertiesTest >> testAdditionalPropertyNamedPut [

	| node |
	node := self graph entryPoint.

	node additionalPropertyNamed: #foo put: #bar.

	self assert: (node additionalPropertyNamed: #foo) equals: #bar.

	node additionalPropertyNamed: #foo put: #bar2.

	self assert: (node additionalPropertyNamed: #foo) equals: #bar2
]

{ #category : 'tests' }
FamixCallGraphAdditionalPropertiesTest >> testResetAdditionalProperties [

	| node |
	node := self graph entryPoint.

	node additionalPropertyNamed: #foo put: #bar.

	self assert: (node additionalPropertyNamed: #foo) equals: #bar.

	FamixCallGraphAdditionalProperties resetAdditionalProperties.

	self should: [ node additionalPropertyNamed: #foo ] raise: NotFound
]
