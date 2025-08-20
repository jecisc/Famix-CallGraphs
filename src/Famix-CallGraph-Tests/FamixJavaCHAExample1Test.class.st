Class {
	#name : 'FamixJavaCHAExample1Test',
	#superclass : 'FamixAbstractJavaCallGraphBuilderTestCase',
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'accessing' }
FamixJavaCHAExample1Test >> javaSourcesFolder [

	^ FamixCallGraphBridge sources / 'example1'
]

{ #category : 'tests' }
FamixJavaCHAExample1Test >> testSameMethodIsReprentedByTheSameNode [

	| main bms |
	main := graph anyOne.

	bms := OrderedCollection new.
	main callees valuesDo: [ :callees |
			callees
				select: [ :callee | callee methodName = 'm' and: [ callee kind name = 'B' ] ]
				thenDo: [ :callee | bms add: callee ] ].

	"We should have two times B.m() possibly invoked by main."
	self assert: bms size equals: 2.
	"Both should be the same instance."
	self assert: bms first identicalTo: bms second
]
