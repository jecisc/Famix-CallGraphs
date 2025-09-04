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

{ #category : 'tests - api' }
FamixJavaCHAExample1Test >> testHasCallees [

	self assert: self graph anyOne hasCallees.
	self deny: (self graph anyOne firstNodeMatching: [ :node | node kindName = 'C' and: [ node methodName = 'm' ] ]) hasCallees
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testMFromCDoesNotCallAnything [

	| m |
	m := self graph anyOne firstNodeMatching: [ :node | node kindName = 'C' and: [ node methodName = 'm' ] ].

	self deny: m hasCallees
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
