Class {
	#name : 'FamixJavaCHAExample2Test',
	#superclass : 'FamixAbstractJavaCallGraphBuilderTestCase',
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'open sources' }
FamixJavaCHAExample2Test >> openSources [

	<script: 'self new openSources'>
	super openSources
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testAMethod1IsCalledInMain [

	| m |
	m := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'A' and: [ node methodName = 'method1' ] ].

	self assert: m callers size equals: 1.
	self assert: (m callers anySatisfy: [ :caller | caller kindName = 'Main' and: [ caller methodName = 'main' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testAMethod1IsCallsNothing [

	| m |
	m := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'A' and: [ node methodName = 'method1' ] ].

	self assertEmpty: m callees
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testBMethod5IsCalledInIMethod3 [

	| m |
	m := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'B' and: [ node methodName = 'method5' ] ].

	self assert: m callers size equals: 1.
	self assert: (m callers anySatisfy: [ :caller | caller kindName = 'I' and: [ caller methodName = 'method3' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testBMethod5IsCallsNothing [

	| m |
	m := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'B' and: [ node methodName = 'method5' ] ].

	self assertEmpty: m callees
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testCMethod1IsCalledInMain [

	| m |
	m := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'C' and: [ node methodName = 'method1' ] ].

	self assert: m callers size equals: 1.
	self assert: (m callers anySatisfy: [ :caller | caller kindName = 'Main' and: [ caller methodName = 'main' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testCMethod1IsCallsNothing [

	| m |
	m := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'C' and: [ node methodName = 'method1' ] ].

	self assertEmpty: m callees
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testCMethod5IsCalledInIMethod3 [

	| m |
	m := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'C' and: [ node methodName = 'method5' ] ].

	self assert: m callers size equals: 1.
	self assert: (m callers anySatisfy: [ :caller | caller kindName = 'I' and: [ caller methodName = 'method3' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testCMethod5IsCallsNothing [

	| m |
	m := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'C' and: [ node methodName = 'method5' ] ].

	self assertEmpty: m callees
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testI2Method2IsCalledInMain [

	| m |
	m := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'I2' and: [ node methodName = 'method2' ] ].

	self assert: m callers size equals: 1.
	self assert: (m callers anySatisfy: [ :caller | caller kindName = 'Main' and: [ caller methodName = 'main' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testI2Method2IsCallsNothing [

	| m |
	m := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'I2' and: [ node methodName = 'method2' ] ].

	self assertEmpty: m callees
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testI2Method4IsCalledInMain [

	| m |
	m := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'I2' and: [ node methodName = 'method4' ] ].

	self assert: m callers size equals: 1.
	self assert: (m callers anySatisfy: [ :caller | caller kindName = 'Main' and: [ caller methodName = 'main' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testI2Method4IsCallsNothing [

	| m |
	m := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'I2' and: [ node methodName = 'method4' ] ].

	self assertEmpty: m callees
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testIMethod1IsNotInTheCallgraph [

	self deny: (self graph entryPoint hasNodeMatching: [ :node | node kindName = 'I' and: [ node methodName = 'method1' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testIMethod2IsNotInTheCallgraph [

	self deny: (self graph entryPoint hasNodeMatching: [ :node | node kindName = 'I' and: [ node methodName = 'method2' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testIMethod3CallsMethod5FromBAndC [

	| m |
	m := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'I' and: [ node methodName = 'method3' ] ].

	m callees
		detect: [ :node | node kindName = 'B' and: [ node methodName = 'method5' ] ]
		ifNone: [ self fail ].

	m callees
		detect: [ :node | node kindName = 'C' and: [ node methodName = 'method5' ] ]
		ifNone: [ self fail ].

	self assert: m callees size equals: 2
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testIMethod3IsCalledInMain [

	| m |
	m := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'I' and: [ node methodName = 'method3' ] ].

	self assert: m callers size equals: 1.
	self assert: (m callers anySatisfy: [ :caller | caller kindName = 'Main' and: [ caller methodName = 'main' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testIMethod4IsCalledInMain [

	| m |
	m := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'I' and: [ node methodName = 'method4' ] ].

	self assert: m callers size equals: 1.
	self assert: (m callers anySatisfy: [ :caller | caller kindName = 'Main' and: [ caller methodName = 'main' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testIMethod4IsCallsNothing [

	| m |
	m := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'I' and: [ node methodName = 'method4' ] ].

	self assertEmpty: m callees
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testIMethod5IsNotInTheCallgraph [

	self deny: (self graph entryPoint hasNodeMatching: [ :node | node kindName = 'I' and: [ node methodName = 'method5' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testMainCallsBConstructor [

	| main |
	main := self graph entryPoint.

	main callees
		detect: [ :node | node kindName = 'B' and: [ node isConstructor ] ]
		ifNone: [ self fail: 'Main should call the constructor of B' ]
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testMainCallsMethod1FromAAndC [

	| main |
	main := self graph entryPoint.

	main callees
		detect: [ :node | node kindName = 'A' and: [ node methodName = 'method1' ] ]
		ifNone: [ self fail: 'Main should call method1 from the class A' ].

	main callees
		detect: [ :node | node kindName = 'C' and: [ node methodName = 'method1' ] ]
		ifNone: [ self fail: 'Main should call method1 from the class C' ].

	self assert: (main callees select: [ :node | node methodName = 'method1' ]) size equals: 2
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testMainCallsMethod2FromI2 [

	| main |
	main := self graph entryPoint.

	main callees
		detect: [ :node | node kindName = 'I2' and: [ node methodName = 'method2' ] ]
		ifNone: [ self fail: 'Main should call method2 from the class I2' ].

	self assert: (main callees select: [ :node | node methodName = 'method2' ]) size equals: 1
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testMainCallsMethod3FromI [

	| main |
	main := self graph entryPoint.

	main callees
		detect: [ :node | node kindName = 'I' and: [ node methodName = 'method3' ] ]
		ifNone: [ self fail: 'Main should call method3 from the class I' ].

	self assert: (main callees select: [ :node | node methodName = 'method3' ]) size equals: 1
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testMainCallsMethod4FromIAndI2 [

	| main |
	main := self graph entryPoint.

	main callees
		detect: [ :node | node kindName = 'I' and: [ node methodName = 'method4' ] ]
		ifNone: [ self fail: 'Main should call method4 from the class I' ].

	main callees
		detect: [ :node | node kindName = 'I2' and: [ node methodName = 'method4' ] ]
		ifNone: [ self fail: 'Main should call method4 from the class I2' ].

	self assert: (main callees select: [ :node | node methodName = 'method4' ]) size equals: 2
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testMainCallsMethod6FromI [
	"Regression test when invoking a default method without statements"

	| main |
	main := self graph entryPoint.

	main callees
		detect: [ :node | node kindName = 'I' and: [ node methodName = 'method6' ] ]
		ifNone: [ self fail: 'Main should call method6 from the class I' ].

	self assert: (main callees select: [ :node | node methodName = 'method6' ]) size equals: 1
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testMainCallsStubPrintln4Times [

	| main printlns |
	main := self graph entryPoint.

	printlns := main callees select: [ :node | node kindName = 'PrintStream' and: [ node methodName = 'println' ] ].

	self assert: (printlns allSatisfy: #isStub).
	self assert: printlns size equals: 4.
	self assert: printlns asSet size equals: 1
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testMainDoesNotCallsMethod1FromI [

	| main |
	main := self graph entryPoint.

	main callees
		detect: [ :node | node kindName = 'I' and: [ node methodName = 'method1' ] ]
		ifFound: [ self fail: 'Main should call method1 from the class I because the method is only declared and not implemented.' ]
]

{ #category : 'tests' }
FamixJavaCHAExample2Test >> testMainHasNoCallers [

	| main |
	main := self graph entryPoint.

	self assertEmpty: main callers
]
