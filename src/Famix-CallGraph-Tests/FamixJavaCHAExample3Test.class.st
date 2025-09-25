Class {
	#name : 'FamixJavaCHAExample3Test',
	#superclass : 'FamixAbstractJavaCallGraphBuilderTestCase',
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'open sources' }
FamixJavaCHAExample3Test >> openSources [

	<script: 'self new openSources'>
	super openSources
]

{ #category : 'tests - abstract' }
FamixJavaCHAExample3Test >> testAbstractMethodsAreNotInCallGraph [

	self deny: (self graph entryPoint hasNodeMatching: [ :node | node kindName = 'H' and: [ node methodName = 'methodA' ] ]).
	self deny: (self graph entryPoint hasNodeMatching: [ :node | node kindName = 'H' and: [ node methodName = 'methodC' ] ]).
	self deny: (self graph entryPoint hasNodeMatching: [ :node | node kindName = 'H' and: [ node methodName = 'methodE' ] ])
]

{ #category : 'tests - constructor' }
FamixJavaCHAExample3Test >> testBConstructorCallees [

	| constructor |
	self skip. "Todo + cleaning to do afterward https://github.com/moosetechnology/VerveineJ/issues/161"
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'B' and: [ node isConstructor ] ].

	self assert: constructor callees size equals: 2.
	self assert: (constructor callees anySatisfy: [ :node | node kindName = 'object' and: [ node isConstructor ] ]).
	self assert: (constructor callees anySatisfy: [ :node | node kindName = 'B' and: [ node methodName = 'initB' ] ])
]

{ #category : 'tests - constructor' }
FamixJavaCHAExample3Test >> testBConstructorIsCalledByCConstructor [

	| constructor |
	self skip. "Waiting for VerveineJ"
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'B' and: [ node isConstructor ] ].

	self assert: constructor callers size equals: 1.
	self assert: (constructor callers anySatisfy: [ :node | node kindName = 'C' and: [ node isConstructor ] ])
]

{ #category : 'tests - constructor' }
FamixJavaCHAExample3Test >> testBPrintStringCallsNothing [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'B' and: [ node methodName = 'printString' ] ].

	self deny: method hasCallees
]

{ #category : 'tests - constructor' }
FamixJavaCHAExample3Test >> testBPrintStringIsCalledByCAndMain [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'B' and: [ node methodName = 'printString' ] ].

	self assert: method callers size equals: 2.
	self assert: (method callers anySatisfy: [ :node | node kindName = 'C' and: [ node methodName = 'printString' ] ]).
	self assert: (method callers anySatisfy: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ])
]

{ #category : 'tests - constructor' }
FamixJavaCHAExample3Test >> testCConstructorWithParameterCallees [

	| constructor |
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'C' and: [ node methodSignature = 'C(String)' ] ].

	self assert: constructor callees size equals: 1.
	self assert: (constructor callees anySatisfy: [ :node | node kindName = 'C' and: [ node methodSignature = 'C()' ] ])
]

{ #category : 'tests - constructor' }
FamixJavaCHAExample3Test >> testCConstructorWithParameterIsCalledFromMain [

	| constructor |
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'C' and: [ node methodSignature = 'C(String)' ] ].

	self assert: constructor callers size equals: 1.
	self assert: (constructor callers anySatisfy: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ])
]

{ #category : 'tests - constructor' }
FamixJavaCHAExample3Test >> testCPrintStringCallsSuperPrintString [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'C' and: [ node methodName = 'printString' ] ].

	self assert: method callees size equals: 1.
	self assert: (method callees anySatisfy: [ :node | node kindName = 'B' and: [ node methodName = 'printString' ] ])
]

{ #category : 'tests - constructor' }
FamixJavaCHAExample3Test >> testCSimpleConstructorCallees [

	| constructor |
	self skip. "Todo + cleaning to do afterward https://github.com/moosetechnology/VerveineJ/issues/161"
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'C' and: [ node methodSignature = 'C()' ] ].

	self assert: constructor callees size equals: 2.
	self assert: (constructor callees anySatisfy: [ :node | node kindName = 'B' and: [ node isConstructor ] ]).
	self assert: (constructor callees anySatisfy: [ :node | node kindName = 'C' and: [ node methodName = 'initC' ] ])
]

{ #category : 'tests - constructor' }
FamixJavaCHAExample3Test >> testCSimpleConstructorIsCalledFromConstructorWithParameter [

	| constructor |
	self skip. "Waiting for VerveineJ"
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'C' and: [ node methodSignature = 'C()' ] ].

	self assert: constructor callers size equals: 1.
	self assert: (constructor callers anySatisfy: [ :node | node kindName = 'C' and: [ node methodSignature = 'C(String)' ] ])
]

{ #category : 'tests - super' }
FamixJavaCHAExample3Test >> testDMethod1CalledByMainAndFMethod1 [

	| constructor |
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'D' and: [ node methodName = 'method1' ] ].

	self assert: (constructor callers select: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ]) size equals: 2.
	self assert: (constructor callers select: [ :node | node kindName = 'F' and: [ node methodName = 'method1' ] ]) size equals: 1
]

{ #category : 'tests - super' }
FamixJavaCHAExample3Test >> testDMethod1CallsNothing [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'D' and: [ node methodName = 'method1' ] ].

	self deny: method hasCallees
]

{ #category : 'tests - super' }
FamixJavaCHAExample3Test >> testDMethod2CalledByMainAndGMethod1 [

	| constructor |
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'D' and: [ node methodName = 'method2' ] ].

	self assert: (constructor callers select: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ]) size equals: 1.
	self assert: (constructor callers select: [ :node | node kindName = 'G' and: [ node methodName = 'method1' ] ]) size equals: 1
]

{ #category : 'tests - super' }
FamixJavaCHAExample3Test >> testDMethod2CallsNothing [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'D' and: [ node methodName = 'method2' ] ].

	self deny: method hasCallees
]

{ #category : 'tests - super' }
FamixJavaCHAExample3Test >> testFMethod1CalledByMain [

	| constructor |
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'F' and: [ node methodName = 'method1' ] ].

	self assert: constructor callers size equals: 2.
	self assert: (constructor callers select: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ]) size equals: 2
]

{ #category : 'tests - super' }
FamixJavaCHAExample3Test >> testFMethod1CallsDMethod1 [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'F' and: [ node methodName = 'method1' ] ].

	self assert: method callees size equals: 1.
	self assert: (method callees anySatisfy: [ :node | node kindName = 'D' and: [ node methodName = 'method1' ] ])
]

{ #category : 'tests - super' }
FamixJavaCHAExample3Test >> testGMethod1CalledByMain [

	| constructor |
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'G' and: [ node methodName = 'method1' ] ].

	self assert: constructor callers size equals: 2.
	self assert: (constructor callers select: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ]) size equals: 2
]

{ #category : 'tests - super' }
FamixJavaCHAExample3Test >> testGMethod1CallsDMethod2 [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'G' and: [ node methodName = 'method1' ] ].

	self assert: method callees size equals: 1.
	self assert: (method callees anySatisfy: [ :node | node kindName = 'D' and: [ node methodName = 'method2' ] ])
]

{ #category : 'tests - super' }
FamixJavaCHAExample3Test >> testGMethod2CalledByMain [

	| constructor |
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'G' and: [ node methodName = 'method2' ] ].

	self assert: constructor callers size equals: 1.
	self assert: (constructor callers select: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ]) size equals: 1
]

{ #category : 'tests - super' }
FamixJavaCHAExample3Test >> testGMethod2CallsNothing [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'G' and: [ node methodName = 'method2' ] ].

	self deny: method hasCallees
]

{ #category : 'tests - abstract' }
FamixJavaCHAExample3Test >> testHMethodBCalledByMain [

	| method |
	method := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'H' and: [ node methodName = 'methodB' ] ].

	self assert: method callers size equals: 1.
	self assert: (method callers anySatisfy: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ])
]

{ #category : 'tests - abstract' }
FamixJavaCHAExample3Test >> testHMethodBCallsMethodAFromIAndK [

	| method |
	method := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'H' and: [ node methodName = 'methodB' ] ].

	self assert: (method callees select: [ :node | node kindName = 'I' and: [ node methodName = 'methodA' ] ]) size equals: 1.
	self assert: (method callees select: [ :node | node kindName = 'K' and: [ node methodName = 'methodA' ] ]) size equals: 1.
	self assert: method callees size equals: 2
]

{ #category : 'tests - abstract' }
FamixJavaCHAExample3Test >> testHMethodDCalledByMain [

	| method |
	method := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'H' and: [ node methodName = 'methodD' ] ].

	self assert: method callers size equals: 1.
	self assert: (method callers anySatisfy: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ])
]

{ #category : 'tests - abstract' }
FamixJavaCHAExample3Test >> testHMethodDCallsMethodCFromJAndK [

	| method |
	method := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'H' and: [ node methodName = 'methodD' ] ].

	self assert: (method callees select: [ :node | node kindName = 'J' and: [ node methodName = 'methodC' ] ]) size equals: 1.
	self assert: (method callees select: [ :node | node kindName = 'K' and: [ node methodName = 'methodC' ] ]) size equals: 1.
	self assert: method callees size equals: 2
]

{ #category : 'tests - abstract' }
FamixJavaCHAExample3Test >> testHMethodFCalledByMain [

	| method |
	method := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'H' and: [ node methodName = 'methodF' ] ].

	self assert: method callers size equals: 1.
	self assert: (method callers anySatisfy: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ])
]

{ #category : 'tests - abstract' }
FamixJavaCHAExample3Test >> testHMethodFCallsMethodEFromIJAndK [

	| method |
	method := self graph entryPoint firstCalleeMatching: [ :node | node kindName = 'H' and: [ node methodName = 'methodF' ] ].

	self assert: (method callees select: [ :node | node kindName = 'I' and: [ node methodName = 'methodE' ] ]) size equals: 1.
	self assert: (method callees select: [ :node | node kindName = 'J' and: [ node methodName = 'methodE' ] ]) size equals: 1.
	self assert: (method callees select: [ :node | node kindName = 'K' and: [ node methodName = 'methodE' ] ]) size equals: 1.
	self assert: method callees size equals: 3
]

{ #category : 'tests - constructor' }
FamixJavaCHAExample3Test >> testMainCallsCConstructor [

	| main |
	main := self graph entryPoint.

	main callees
		detect: [ :node | node kindName = 'C' and: [ node isConstructor ] ]
		ifNone: [ self fail: 'Main should call the constructor of C' ]
]

{ #category : 'tests - super' }
FamixJavaCHAExample3Test >> testMainCallsMethod1FromDFAndG [

	| main |
	main := self graph entryPoint.

	self assert: (main callees select: [ :node | node kindName = 'D' and: [ node methodName = 'method1' ] ]) size equals: 2.
	self assert: (main callees select: [ :node | node kindName = 'F' and: [ node methodName = 'method1' ] ]) size equals: 2.
	self assert: (main callees select: [ :node | node kindName = 'G' and: [ node methodName = 'method1' ] ]) size equals: 2.
	self assert: (main callees select: [ :node | node methodName = 'method1' ]) size equals: 6
]

{ #category : 'tests - super' }
FamixJavaCHAExample3Test >> testMainCallsMethod2FromDAndG [

	| main |
	main := self graph entryPoint.

	self assert: (main callees select: [ :node | node kindName = 'D' and: [ node methodName = 'method2' ] ]) size equals: 1.
	self assert: (main callees select: [ :node | node kindName = 'G' and: [ node methodName = 'method2' ] ]) size equals: 1.
	self assert: (main callees select: [ :node | node methodName = 'method2' ]) size equals: 2
]

{ #category : 'tests - abstract' }
FamixJavaCHAExample3Test >> testMainCallsMethodAFromIAndK [

	| main |
	main := self graph entryPoint.

	self assert: (main callees select: [ :node | node kindName = 'I' and: [ node methodName = 'methodA' ] ]) size equals: 1.
	self assert: (main callees select: [ :node | node kindName = 'K' and: [ node methodName = 'methodA' ] ]) size equals: 1.
	self assert: (main callees select: [ :node | node methodName = 'methodA' ]) size equals: 2
]

{ #category : 'tests - abstract' }
FamixJavaCHAExample3Test >> testMainCallsMethodBFromH [

	| main |
	main := self graph entryPoint.

	self assert: (main callees select: [ :node | node kindName = 'H' and: [ node methodName = 'methodB' ] ]) size equals: 1.
	self assert: (main callees select: [ :node | node methodName = 'methodB' ]) size equals: 1
]

{ #category : 'tests - abstract' }
FamixJavaCHAExample3Test >> testMainCallsMethodDFromH [

	| main |
	main := self graph entryPoint.

	self assert: (main callees select: [ :node | node kindName = 'H' and: [ node methodName = 'methodD' ] ]) size equals: 1.
	self assert: (main callees select: [ :node | node methodName = 'methodD' ]) size equals: 1
]

{ #category : 'tests - abstract' }
FamixJavaCHAExample3Test >> testMainCallsMethodFFromH [

	| main |
	main := self graph entryPoint.

	self assert: (main callees select: [ :node | node kindName = 'H' and: [ node methodName = 'methodF' ] ]) size equals: 1.
	self assert: (main callees select: [ :node | node methodName = 'methodF' ]) size equals: 1
]

{ #category : 'tests - constructor' }
FamixJavaCHAExample3Test >> testMainCallsPrintStringFromBAndC [

	| main |
	main := self graph entryPoint.

	main callees
		detect: [ :node | node kindName = 'B' and: [ node methodName = 'printString' ] ]
		ifNone: [ self fail ].

	main callees
		detect: [ :node | node kindName = 'C' and: [ node methodName = 'printString' ] ]
		ifNone: [ self fail ].

	self assert: (main callees select: [ :node | node methodName = 'printString' ]) size equals: 2
]

{ #category : 'tests - signature' }
FamixJavaCHAExample3Test >> testMainCallsTwoMethodsWithSameNameButDifferentSignature [

	| main m1 m2 |
	main := self graph entryPoint.

	m1 := main callees
		      detect: [ :node | node kindName = 'A' and: [ node methodSignature = 'm()' ] ]
		      ifNone: [ self fail ].

	m2 := main callees
		      detect: [ :node | node kindName = 'A' and: [ node methodSignature = 'm(String)' ] ]
		      ifNone: [ self fail ].

	self deny: m1 identicalTo: m2.

	self assert: (main callees select: [ :node | node methodName = 'm' ]) size equals: 2
]
