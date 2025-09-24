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

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testBConstructorCallees [

	| constructor |
	self skip. "Todo + cleaning to do afterward https://github.com/moosetechnology/VerveineJ/issues/161"
	constructor := self graph anyOne callees detect: [ :node | node kindName = 'B' and: [ node realMethod isConstructor ] ].

	self assert: constructor callees size equals: 2.
	self assert: (constructor callees anySatisfy: [ :node | node kindName = 'object' and: [ node realMethod isConstructor ] ]).
	self assert: (constructor callees anySatisfy: [ :node | node kindName = 'B' and: [ node methodName = 'initB' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testBConstructorIsCalledByCConstructor [

	| constructor |
	self skip. "Waiting for VerveineJ"
	constructor := self graph anyOne callees detect: [ :node | node kindName = 'B' and: [ node realMethod isConstructor ] ].

	self assert: constructor callers size equals: 1.
	self assert: (constructor callers anySatisfy: [ :node | node kindName = 'C' and: [ node realMethod isConstructor ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testBPrintStringCallsNothing [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'B' and: [ node methodName = 'printString' ] ].

	self deny: method hasCallees
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testBPrintStringIsCalledByCAndMain [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'B' and: [ node methodName = 'printString' ] ].

	self assert: method callers size equals: 2.
	self assert: (method callers anySatisfy: [ :node | node kindName = 'C' and: [ node methodName = 'printString' ] ]).
	self assert: (method callers anySatisfy: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testCConstructorWithParameterCallees [

	| constructor |
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'C' and: [ node methodSignature = 'C(String)' ] ].

	self assert: constructor callees size equals: 1.
	self assert: (constructor callees anySatisfy: [ :node | node kindName = 'C' and: [ node methodSignature = 'C()' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testCConstructorWithParameterIsCalledFromMain [

	| constructor |
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'C' and: [ node methodSignature = 'C(String)' ] ].

	self assert: constructor callers size equals: 1.
	self assert: (constructor callers anySatisfy: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testCPrintStringCallsSuperPrintString [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'C' and: [ node methodName = 'printString' ] ].

	self assert: method callees size equals: 1.
	self assert: (method callees anySatisfy: [ :node | node kindName = 'B' and: [ node methodName = 'printString' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testCSimpleConstructorCallees [

	| constructor |
	self skip. "Todo + cleaning to do afterward https://github.com/moosetechnology/VerveineJ/issues/161"
	constructor := self graph anyOne callees detect: [ :node | node kindName = 'C' and: [ node methodSignature = 'C()' ] ].

	self assert: constructor callees size equals: 2.
	self assert: (constructor callees anySatisfy: [ :node | node kindName = 'B' and: [ node realMethod isConstructor ] ]).
	self assert: (constructor callees anySatisfy: [ :node | node kindName = 'C' and: [ node methodName = 'initC' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testCSimpleConstructorIsCalledFromConstructorWithParameter [

	| constructor |
	self skip. "Waiting for VerveineJ"
	constructor := self graph anyOne callees detect: [ :node | node kindName = 'C' and: [ node methodSignature = 'C()' ] ].

	self assert: constructor callers size equals: 1.
	self assert: (constructor callers anySatisfy: [ :node | node kindName = 'C' and: [ node methodSignature = 'C(String)' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testDMethod1CalledByMainAndFMethod1 [

	| constructor |
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'D' and: [ node methodName = 'method1' ] ].

	self assert: (constructor callers select: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ]) size equals: 2.
	self assert: (constructor callers select: [ :node | node kindName = 'F' and: [ node methodName = 'method1' ] ]) size equals: 1
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testDMethod1CallsNothing [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'D' and: [ node methodName = 'method1' ] ].

	self deny: method hasCallees
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testDMethod2CalledByMainAndGMethod1 [

	| constructor |
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'D' and: [ node methodName = 'method2' ] ].

	self assert: (constructor callers select: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ]) size equals: 1.
	self assert: (constructor callers select: [ :node | node kindName = 'G' and: [ node methodName = 'method1' ] ]) size equals: 1
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testDMethod2CallsNothing [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'D' and: [ node methodName = 'method2' ] ].

	self deny: method hasCallees
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testFMethod1CalledByMain [

	| constructor |
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'F' and: [ node methodName = 'method1' ] ].

	self assert: constructor callers size equals: 2.
	self assert: (constructor callers select: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ]) size equals: 2
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testFMethod1CallsDMethod1 [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'F' and: [ node methodName = 'method1' ] ].

	self assert: method callees size equals: 1.
	self assert: (method callees anySatisfy: [ :node | node kindName = 'D' and: [ node methodName = 'method1' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testGMethod1CalledByMain [

	| constructor |
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'G' and: [ node methodName = 'method1' ] ].

	self assert: constructor callers size equals: 2.
	self assert: (constructor callers select: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ]) size equals: 2
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testGMethod1CallsDMethod2 [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'G' and: [ node methodName = 'method1' ] ].

	self assert: method callees size equals: 1.
	self assert: (method callees anySatisfy: [ :node | node kindName = 'D' and: [ node methodName = 'method2' ] ])
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testGMethod2CalledByMain [

	| constructor |
	constructor := self graph entryPoint callees detect: [ :node | node kindName = 'G' and: [ node methodName = 'method2' ] ].

	self assert: constructor callers size equals: 1.
	self assert: (constructor callers select: [ :node | node kindName = 'Main' and: [ node methodName = 'main' ] ]) size equals: 1
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testGMethod2CallsNothing [

	| method |
	method := self graph entryPoint callees detect: [ :node | node kindName = 'G' and: [ node methodName = 'method2' ] ].

	self deny: method hasCallees
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testMainCallsCConstructor [

	| main |
	main := self graph entryPoint.

	main callees
		detect: [ :node | node kindName = 'C' and: [ node realMethod isConstructor ] ]
		ifNone: [ self fail: 'Main should call the constructor of C' ]
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testMainCallsMethod1FromDFAndG [

	| main |
	main := self graph entryPoint.

	self assert: (main callees select: [ :node | node kindName = 'D' and: [ node methodName = 'method1' ] ]) size equals: 2.
	self assert: (main callees select: [ :node | node kindName = 'F' and: [ node methodName = 'method1' ] ]) size equals: 2.
	self assert: (main callees select: [ :node | node kindName = 'G' and: [ node methodName = 'method1' ] ]) size equals: 2.
	self assert: (main callees select: [ :node | node methodName = 'method1' ]) size equals: 6
]

{ #category : 'tests' }
FamixJavaCHAExample3Test >> testMainCallsMethod2FromDAndG [

	| main |
	main := self graph entryPoint.

	self assert: (main callees select: [ :node | node kindName = 'D' and: [ node methodName = 'method2' ] ]) size equals: 1.
	self assert: (main callees select: [ :node | node kindName = 'G' and: [ node methodName = 'method2' ] ]) size equals: 1.
	self assert: (main callees select: [ :node | node methodName = 'method2' ]) size equals: 2
]

{ #category : 'tests' }
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

{ #category : 'tests' }
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
