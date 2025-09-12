Class {
	#name : 'FamixJavaCHAExample2Test',
	#superclass : 'FamixAbstractJavaCallGraphBuilderTestCase',
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testAMethod1IsCalledInMain [

	| m |
	m := self graph anyOne firstNodeMatching: [ :node | node kindName = 'A' and: [ node methodName = 'method1' ] ].

	self assert: m callers size equals: 1.
	self assert: (m callers anySatisfy: [ :caller | caller kindName = 'Main' and: [ caller methodName = 'main' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testMainCallsBConstructor [

	| main |
	main := self graph anyOne.

	main callees
		detect: [ :node | node kindName = 'B' and: [ node realMethod isConstructor ] ]
		ifNone: [ self fail: 'Main should call the constructor of B' ]
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testMainCallsMethod1FromAAndC [

	| main |
	main := self graph anyOne.

	main callees
		detect: [ :node | node kindName = 'A' and: [ node methodName = 'method1' ] ]
		ifNone: [ self fail: 'Main should call method1 from the class A' ].

	main callees
		detect: [ :node | node kindName = 'C' and: [ node methodName = 'method1' ] ]
		ifNone: [ self fail: 'Main should call method1 from the class C' ]
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testMainCallsStubPrintln4Times [

	| main printlns |
	main := self graph anyOne.

	printlns := main callees select: [ :node | node kindName = 'PrintStream' and: [ node methodName = 'println' ] ].

	self assert: (printlns allSatisfy: #isStub).
	self assert: printlns size equals: 4.
	self assert: printlns asSet size equals: 1
]
