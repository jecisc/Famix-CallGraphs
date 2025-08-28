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
FamixJavaCHAExample1Test >> testRightNumberOfNodes [

	| numberOfNodes |
	numberOfNodes := 0.

	self graph anyOne withAllNodesDo: [ :node | numberOfNodes := numberOfNodes + 1 ].

	self assert: numberOfNodes equals: 8
]

{ #category : 'tests - callgraph' }
FamixJavaCHAExample1Test >> testSameMethodIsReprentedByTheSameNode [

	| main bms |
	main := self graph anyOne.

	bms := OrderedCollection new.
	main callees
		select: [ :callee | callee methodName = 'm' and: [ callee kind name = 'B' ] ]
		thenDo: [ :callee | bms add: callee ].

	"We should have two times B.m() possibly invoked by main."
	self assert: bms size equals: 2.

	"Both should be the same instance."
	self assert: bms first identicalTo: bms second
]

{ #category : 'tests - API' }
FamixJavaCHAExample1Test >> testWithAllNodesDo [

	| nodes |
	nodes := OrderedCollection new.
	self graph anyOne withAllNodesDo: [ :node | nodes add: node ].

	self assert: nodes size equals: 8
]
