Class {
	#name : 'FamixJavaCHAExample1Test',
	#superclass : 'FamixAbstractJavaCallGraphBuilderTestCase',
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'helpers' }
FamixJavaCHAExample1Test class >> browseSources [

	<script>
	super browseSources
]

{ #category : 'open sources' }
FamixJavaCHAExample1Test >> openSources [

	<script: 'self new openSources'>
	super openSources
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testAConstructorCallsObjectConstructor [

	| constructor |
	self skip. "Todo + cleaning to do afterward https://github.com/moosetechnology/VerveineJ/issues/161"
	constructor := self graph anyOne callees detect: [ :node | node kindName = 'A' and: [ node realMethod isConstructor ] ].

	self assert: constructor callees size equals: 1.
	self assert: constructor callees anyOne kind name equals: 'object'.
	self assert: constructor callees anyOne realMethod isConstructor
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testAConstructorHasTwoCallers [

	| constructor |
	self skip. "Todo + cleaning to do afterward https://github.com/moosetechnology/VerveineJ/issues/161"
	constructor := self graph anyOne callees detect: [ :node | node kindName = 'A' and: [ node realMethod isConstructor ] ].

	self assert: constructor callers size equals: 2.
	self assert: (constructor callers anySatisfy: [ :caller | caller kindName = 'B' and: [ caller realMethod isConstructor ] ]).
	self assert: (constructor callers anySatisfy: [ :caller | caller kindName = 'Main' and: [ caller methodName = 'main' ] ])
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testAMCallsAllMethodsWithToString [

	| m |
	m := self graph anyOne firstNodeMatching: [ :node | node kindName = 'A' and: [ node methodName = 'm' ] ].

	self assert: m callees size equals: 3.
	self assert: (m callees anySatisfy: [ :node | node kindName = 'Object' and: [ node methodName = 'toString' ] ]).
	self assert: (m callees anySatisfy: [ :node | node kindName = 'C' and: [ node methodName = 'toString' ] ]). "This one is in the same hierarchy than A"
	self assert: (m callees anySatisfy: [ :node | node kindName = 'D' and: [ node methodName = 'toString' ] ]) "This one is not in A's hierarchy"
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testAMIsCalledInMain [

	| m |
	m := self graph anyOne firstNodeMatching: [ :node | node kindName = 'A' and: [ node methodName = 'm' ] ].

	self assert: m callers size equals: 1.
	self assert: (m callers anySatisfy: [ :caller | caller kindName = 'Main' and: [ caller methodName = 'main' ] ])
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testBConstructorCallees [

	| constructor |
	self skip. "Todo + cleaning to do afterward https://github.com/moosetechnology/VerveineJ/issues/161"
	constructor := self graph anyOne callees detect: [ :node | node kindName = 'B' and: [ node realMethod isConstructor ] ].

	self assert: constructor callees size equals: 3.
	self assert: (constructor callees anySatisfy: [ :node | node kindName = 'A' and: [ node realMethod isConstructor ] ]).
	self assert: (constructor callees anySatisfy: [ :node | node kindName = 'B' and: [ node methodName = 'initializeFromConstructor' ] ]).
	self assert: (constructor callees anySatisfy: [ :node | node kindName = 'B' and: [ node realMethod isInstanceInitializationBlock ] ])
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testBConstructorIsCalledByMain [

	| constructor |
	constructor := self graph anyOne callees detect: [ :node | node kindName = 'B' and: [ node realMethod isConstructor ] ].

	self assert: constructor callers size equals: 1.
	self assert: (constructor callers anySatisfy: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ])
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testBMCallsNothing [

	| m |
	m := self graph anyOne firstNodeMatching: [ :node | node kindName = 'B' and: [ node methodName = 'm' ] ].

	self deny: m hasCallees
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testBMIsCalledTwiceInMain [

	| m |
	m := self graph anyOne firstNodeMatching: [ :node | node kindName = 'B' and: [ node methodName = 'm' ] ].

	self assert: m callers size equals: 2.
	self assert: (m callers allSatisfy: [ :caller | caller kindName = 'Main' and: [ caller methodName = 'main' ] ])
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testBStaticInitializationBlockCallsInitializeFromStaticInitializationBlock [

	| block |
	self skip. "Waiting for https://github.com/moosetechnology/VerveineJ/issues/162"
	block := self graph anyOne firstNodeMatching: [ :node | node kindName = 'B' and: [ node realMethod isStaticInitializationBlock ] ].

	self assert: (block callees anySatisfy: [ :node | node kindName = 'B' and: [ node methodName = 'initializeFromStaticInitializationBlock' ] ])
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testCMCallsToString [

	| m |
	m := self graph anyOne firstNodeMatching: [ :node | node kindName = 'C' and: [ node methodName = 'm' ] ].

	self assert: m callees size equals: 1.
	self assert: m callees anyOne kindName equals: 'C'.
	self assert: m callees anyOne methodName equals: 'toString'
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testCMIsCalledInMain [

	| m |
	m := self graph anyOne firstNodeMatching: [ :node | node kindName = 'C' and: [ node methodName = 'm' ] ].

	self assert: m callers size equals: 1.
	self assert: (m callers anySatisfy: [ :caller | caller kindName = 'Main' and: [ caller methodName = 'main' ] ])
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testCToStringHasTwoCallers [

	| toString |
	toString := self graph anyOne firstNodeMatching: [ :node | node kindName = 'C' and: [ node methodName = 'toString' ] ].

	self assert: toString callers size equals: 2.
	self assert: (toString callers anySatisfy: [ :caller | caller kindName = 'C' and: [ caller methodName = 'm' ] ]).
	self assert: (toString callers anySatisfy: [ :caller | caller kindName = 'A' and: [ caller methodName = 'm' ] ])
]

{ #category : 'tests - api' }
FamixJavaCHAExample1Test >> testHasCallees [

	self assert: self graph anyOne hasCallees.
	self deny: (self graph anyOne firstNodeMatching: [ :node | node kindName = 'B' and: [ node methodName = 'm' ] ]) hasCallees
]

{ #category : 'tests - api' }
FamixJavaCHAExample1Test >> testIsStub [

	self assert: (self graph anyOne firstNodeMatching: [ :node | node kindName = 'PrintStream' and: [ node methodName = 'println' ] ]) isStub.
	self deny: self graph anyOne isStub
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testMainCallsAConstructor [

	| main |
	main := self graph anyOne.

	main callees
		detect: [ :node | node kindName = 'A' and: [ node realMethod isConstructor ] ]
		ifNone: [ self fail: 'Main should call the constructor of A' ]
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testMainCallsBConstructor [

	| main |
	main := self graph anyOne.

	main callees
		detect: [ :node | node kindName = 'B' and: [ node realMethod isConstructor ] ]
		ifNone: [ self fail: 'Main should call the constructor of B' ]
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testMainCallsBStaticInitializationBlock [

	| main |
	self skip. "Waiting for https://github.com/moosetechnology/VerveineJ/issues/162"
	main := self graph anyOne.

	main callees
		detect: [ :node | node kindName = 'B' and: [ node realMethod isStaticInitializationBlock ] ]
		ifNone: [ self fail: 'Main should call the static initialization block of B' ]
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testMainCallsMethodMFromAOnce [

	| main methods |
	main := self graph anyOne.

	methods := main callees select: [ :node | node kindName = 'A' and: [ node methodName = 'm' ] ].

	self assert: methods size equals: 1
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testMainCallsMethodMFromBTwice [

	| main methods |
	main := self graph anyOne.

	methods := main callees select: [ :node | node kindName = 'B' and: [ node methodName = 'm' ] ].

	self assert: methods size equals: 2.
	"We should have twice the same node. Once invoked from a.m and once from b.m."
	self assert: methods first identicalTo: methods second
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testMainCallsMethodMFromCOnce [

	| main methods |
	main := self graph anyOne.

	methods := main callees select: [ :node | node kindName = 'C' and: [ node methodName = 'm' ] ].

	self assert: methods size equals: 1
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testMainCallsStubPrintln [

	| main method |
	main := self graph anyOne.

	method := main callees
		          detect: [ :node | node kindName = 'PrintStream' and: [ node methodName = 'println' ] ]
		          ifNone: [ self fail: 'Main should call println' ].

	self assert: method isStub
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testMainHasNoCallers [

	| main |
	main := self graph anyOne.

	self assertEmpty: main callers
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testSameMethodIsReprentedByTheSameNode [

	| main bms |
	main := self graph anyOne.

	bms := OrderedCollection new.
	main callees
		select: [ :callee | callee methodName = 'm' and: [ callee kindName = 'B' ] ]
		thenDo: [ :callee | bms add: callee ].

	"We should have two times B.m() possibly invoked by main."
	self assert: bms size equals: 2.

	"Both should be the same instance."
	self assert: bms first identicalTo: bms second
]
