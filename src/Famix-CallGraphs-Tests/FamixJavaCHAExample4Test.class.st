Class {
	#name : 'FamixJavaCHAExample4Test',
	#superclass : 'FamixAbstractJavaCallGraphBuilderTestCase',
	#category : 'Famix-CallGraphs-Tests',
	#package : 'Famix-CallGraphs-Tests'
}

{ #category : 'open sources' }
FamixJavaCHAExample4Test >> openSources [

	<script: 'self new openSources'>
	super openSources
]

{ #category : 'tests' }
FamixJavaCHAExample4Test >> testBoxConstructorCallees [

	| constructor |
	self skip. "Todo + cleaning to do afterward https://github.com/moosetechnology/VerveineJ/issues/161"
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'Box' and: [ node isConstructor ] ].

	self assert: constructor callees size equals: 1.
	self assert: (constructor callees anySatisfy: [ :node | node kindName = 'object' and: [ node isConstructor ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample4Test >> testBoxConstructorIsCalledByMain [

	| constructor |
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'Box' and: [ node isConstructor ] ].

	self assert: constructor callers size equals: 3.
	self assert: (constructor callers select: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ]) size equals: 3
]

{ #category : 'tests' }
FamixJavaCHAExample4Test >> testBoxGetHasNoCallees [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'Box' and: [ node methodName = 'get' ] ].

	self deny: method hasCallees
]

{ #category : 'tests' }
FamixJavaCHAExample4Test >> testBoxGetIsCalledByMain [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'Box' and: [ node methodName = 'get' ] ].

	self assert: method callers size equals: 1.
	self assert: (method callers anySatisfy: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample4Test >> testBoxSetHasNoCallees [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'Box' and: [ node methodName = 'get' ] ].

	self deny: method hasCallees
]

{ #category : 'tests' }
FamixJavaCHAExample4Test >> testBoxSetIsCalledByMain [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'Box' and: [ node methodName = 'get' ] ].

	self assert: method callers size equals: 1.
	self assert: (method callers anySatisfy: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample4Test >> testUtilFirstCallees [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'Util' and: [ node methodName = 'first' ] ].

	self assert: method callees size equals: 1.
	self assert: (method callees anySatisfy: [ :node | node kindName = 'IllegalArgumentException' and: [ node isConstructor ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample4Test >> testUtilFirstCallers [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'Util' and: [ node methodName = 'first' ] ].

	self assert: method callers size equals: 2.
	self assert: (method callers anySatisfy: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ])
]
