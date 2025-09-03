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

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testMainCallsAConstructor [

	| main |
	main := self graph anyOne.

	main callees
		detect: [ :node | node kindName = 'A' and: [ node realMethod isConstructor ] ]
		ifNone: [ self fail: 'Main should call the constructor of A' ]
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
